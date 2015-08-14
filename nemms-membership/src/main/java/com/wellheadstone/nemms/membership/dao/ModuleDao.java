package com.wellheadstone.nemms.membership.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.SortType;
import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.criterion.operands.Bracket;
import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.membership.po.ModulePo;

/**
 * 系统模块数据访问实现类
 */
@Repository
public class ModuleDao extends BaseDao<ModulePo> {

	public ModuleDao() {
		super(ModulePo.EntityName, ModulePo.ModuleId);
	}

	@Override
	@Resource
	public void setJDBCTemplate(JdbcTemplate membershipJdbcTemplate) {
		this.setJdbcTemplate(membershipJdbcTemplate);
	}

	public int countChildBy(int pid) {
		String condition = Restrictions.equal(ModulePo.ModuleId, pid).toString();
		return this.count(condition);
	}

	public int countChildBy(int pid, String name) {
		String condition = Restrictions.equal(ModulePo.ModuleId, "?")
				.append(Restrictions.And)
				.append(Restrictions.bracket(Bracket.Left))
				.append(Restrictions.equal(ModulePo.Name, "?"))
				.append(Restrictions.Or)
				.append(Restrictions.like(ModulePo.Name, String.format("'%s_复件%'", name)))
				.append(Restrictions.bracket(Bracket.Rgiht)).toString();
		Object[] args = new Object[] { pid, name };
		return this.count(condition, args);
	}

	public int updatePath(int id, String path) {
		String condition = Restrictions.equal(ModulePo.ModuleId, "?").toString();
		String[] columnNames = new String[] { ModulePo.Path };
		Object[] args = new Object[] { path, id };
		return this.update(condition, args, columnNames);
	}

	public int updateHasChild(int pid, boolean hasChild) {
		String condition = Restrictions.equal(ModulePo.ModuleId, "?").toString();
		String[] columnNames = new String[] { ModulePo.HasChild };
		Object[] args = new Object[] { hasChild, pid };
		return this.update(condition, args, columnNames);
	}

	public int updatePid(int id, int pid) {
		String condition = Restrictions.equal(ModulePo.ModuleId, "?").toString();
		String[] columnNames = new String[] { ModulePo.ParentId };
		Object[] args = new Object[] { pid, id };
		return this.update(condition, args, columnNames);
	}

	public String queryPath(int pid) {
		ModulePo po = this.queryByKey(pid, ModulePo.Path);
		return po == null ? "" : po.getPath();
	}

	public List<ModulePo> queryByPid(int pid) {
		String condition = Restrictions.equal(ModulePo.ParentId, "?")
				.append(Restrictions.orderBy(SortType.ASC, ModulePo.Sequence))
				.toString();
		Object[] args = new Object[] { pid };
		return this.query(condition, args);
	}

	public List<ModulePo> queryPageByPid(PageInfo page, int pid) {
		String condition = Restrictions.equal(ModulePo.ParentId, "?")
				.toString();
		Object[] args = new Object[] { pid };
		return this.query(condition, page, args);
	}
}
