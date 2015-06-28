package com.wellheadstone.nemms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.SortType;
import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.criterion.operands.Bracket;
import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.SitePo;

/**
 * 设备站点数据访问实现类
 */
@Repository
public class SiteDao extends BaseDao<SitePo> {

	public SiteDao() {
		super(SitePo.EntityName, SitePo.Id);
	}

	public boolean exists(String createUser, int id) {
		String condition = Restrictions.equal(SitePo.CreateUser, "?")
				.append(Restrictions.And)
				.append(Restrictions.equal(SitePo.Id, "?")).toString();
		Object[] args = new Object[] { createUser, id };
		return this.count(condition, args) > 0;
	}

	public boolean exists(int pid, int id, String name) {
		String condition = Restrictions.equal(SitePo.Pid, "?")
				.append(Restrictions.And)
				.append(Restrictions.equal(SitePo.Name, "?"))
				.append(Restrictions.And)
				.append(Restrictions.notEqual(SitePo.Id, "?")).toString();
		Object[] args = new Object[] { pid, name, id };
		return this.count(condition, args) > 0;
	}

	public boolean existsByUid(String uid) {
		String condition = Restrictions.equal(SitePo.Uid, "?").toString();
		Object[] args = new Object[] { uid };
		return this.count(condition, args) > 0;
	}

	public int countChildBy(int pid) {
		String condition = Restrictions.equal(SitePo.Pid, pid).toString();
		return this.count(condition);
	}

	public int countChildBy(int pid, String name) {
		String condition = Restrictions.equal(SitePo.Pid, "?")
				.append(Restrictions.And)
				.append(Restrictions.bracket(Bracket.Left))
				.append(Restrictions.equal(SitePo.Name, "?"))
				.append(Restrictions.Or)
				.append(Restrictions.like(SitePo.Name, String.format("%s_复件%%", name)))
				.append(Restrictions.bracket(Bracket.Rgiht)).toString();
		Object[] args = new Object[] { pid, name };
		return this.count(condition, args);
	}

	public int queryStatus(int id) {
		SitePo po = this.queryByKey(id, SitePo.Status);
		return po == null ? -1 : po.getStatus();
	}

	public SitePo queryByUid(String uid) {
		String condition = Restrictions.equal(SitePo.Uid, "?").toString();
		Object[] args = new Object[] { uid };
		return this.queryOne(condition, args);
	}

	public String queryPath(int pid) {
		SitePo po = this.queryByKey(pid, SitePo.Path);
		return po == null ? "" : po.getPath();
	}

	public int queryId(String uid) {
		String condition = Restrictions.equal(SitePo.Uid, "?").toString();
		Object[] args = new Object[] { uid };
		SitePo po = this.queryOne(condition, args, SitePo.Id);
		return po == null ? 0 : po.getId();
	}

	public List<SitePo> queryAllChild(int id) {
		String condition = Restrictions.equal(SitePo.Id, "?")
				.append(Restrictions.like(SitePo.Path, "'" + id + ",%'")).toString();
		Object[] args = new Object[] { id };
		return this.query(condition, args);
	}

	public List<SitePo> queryByPid(int pid) {
		String condition = Restrictions.equal(SitePo.Pid, "?")
				.append(Restrictions.orderBy(SortType.ASC, SitePo.Sequence))
				.toString();
		Object[] args = new Object[] { pid };
		return this.query(condition, args);
	}

	public List<SitePo> queryByPage(String fieldName, String keyword, PageInfo page) {
		String condition = "";
		if (keyword != null && keyword.trim().length() > 0) {
			condition = Restrictions.like(fieldName, "%" + keyword + "%").toString();
		}
		String[] columnNames = new String[] {
				SitePo.Id, SitePo.Pid, SitePo.Uid, SitePo.Path,
				SitePo.Name, SitePo.CreateUser, SitePo.CreateTime
		};
		return this.query(condition, page, columnNames);
	}

	public int updateUid(int id, String uid) {
		String condition = Restrictions.equal(SitePo.Id, "?").toString();
		String[] columnNames = new String[] { SitePo.Uid };
		Object[] args = new Object[] { uid, id };
		return this.update(condition, args, columnNames);
	}

	public int updatePath(int id, String path) {
		String condition = Restrictions.equal(SitePo.Id, "?").toString();
		String[] columnNames = new String[] { SitePo.Path };
		Object[] args = new Object[] { path, id };
		return this.update(condition, args, columnNames);
	}

	public int updateHasChild(int pid, boolean hasChild) {
		String condition = Restrictions.equal(SitePo.Id, "?").toString();
		String[] columnNames = new String[] { SitePo.HasChild };
		Object[] args = new Object[] { hasChild, pid };
		return this.update(condition, args, columnNames);
	}

	public int updatePid(int id, int pid) {
		String condition = Restrictions.equal(SitePo.Id, "?").toString();
		String[] columnNames = new String[] { SitePo.Pid };
		Object[] args = new Object[] { pid, id };
		return this.update(condition, args, columnNames);
	}

	public int updateCreateUser(int id, String createUser, String comment) {
		String condition = Restrictions.equal(SitePo.Id, "?").toString();
		String[] columnNames = new String[] { SitePo.CreateUser, SitePo.Comment };
		Object[] args = new Object[] { createUser, comment, id };
		return this.update(condition, args, columnNames);
	}

	public int updateByUid(SitePo po) {
		String[] columnNames = new String[] {
				SitePo.Name,
				SitePo.Comment
		};
		String condition = Restrictions.equal(SitePo.Uid, "?").toString();
		Object[] args = new Object[] { po.getUid() };
		return this.update(po, condition, args, columnNames);
	}
}
