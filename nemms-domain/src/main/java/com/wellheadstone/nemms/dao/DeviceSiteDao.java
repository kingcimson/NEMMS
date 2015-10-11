package com.wellheadstone.nemms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.SortType;
import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.criterion.operands.Bracket;
import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.DeviceSitePo;

/**
 * 设备站点数据访问实现类
 */
@Repository
public class DeviceSiteDao extends BaseDao<DeviceSitePo> {

	public DeviceSiteDao() {
		super(DeviceSitePo.EntityName, DeviceSitePo.Id);
	}

	public boolean exists(String createUser, int id) {
		String condition = Restrictions.equal(DeviceSitePo.CreateUser, "?")
				.append(Restrictions.And)
				.append(Restrictions.equal(DeviceSitePo.Id, "?")).toString();
		Object[] args = new Object[] { createUser, id };
		return this.count(condition, args) > 0;
	}

	public boolean exists(int pid, int id, String name) {
		String condition = Restrictions.equal(DeviceSitePo.Pid, "?")
				.append(Restrictions.And)
				.append(Restrictions.equal(DeviceSitePo.Name, "?"))
				.append(Restrictions.And)
				.append(Restrictions.notEqual(DeviceSitePo.Id, "?")).toString();
		Object[] args = new Object[] { pid, name, id };
		return this.count(condition, args) > 0;
	}

	public boolean existsByUid(String uid) {
		String condition = Restrictions.equal(DeviceSitePo.Uid, "?").toString();
		Object[] args = new Object[] { uid };
		return this.count(condition, args) > 0;
	}

	public int countChildBy(int pid) {
		String condition = Restrictions.equal(DeviceSitePo.Pid, pid).toString();
		return this.count(condition);
	}

	public int countChildBy(int pid, String name) {
		String condition = Restrictions.equal(DeviceSitePo.Pid, "?")
				.append(Restrictions.And)
				.append(Restrictions.bracket(Bracket.Left))
				.append(Restrictions.equal(DeviceSitePo.Name, "?"))
				.append(Restrictions.Or)
				.append(Restrictions.like(DeviceSitePo.Name, String.format("%s_复件%%", name)))
				.append(Restrictions.bracket(Bracket.Rgiht)).toString();
		Object[] args = new Object[] { pid, name };
		return this.count(condition, args);
	}

	public int queryStatus(int id) {
		DeviceSitePo po = this.queryByKey(id, DeviceSitePo.Status);
		return po == null ? -1 : po.getStatus();
	}

	public DeviceSitePo queryByUid(String uid) {
		String condition = Restrictions.equal(DeviceSitePo.Uid, "?").toString();
		Object[] args = new Object[] { uid };
		return this.queryOne(condition, args);
	}

	public String queryPath(int pid) {
		DeviceSitePo po = this.queryByKey(pid, DeviceSitePo.Path);
		return po == null ? "" : po.getPath();
	}

	public int queryId(String uid) {
		String condition = Restrictions.equal(DeviceSitePo.Uid, "?").toString();
		Object[] args = new Object[] { uid };
		DeviceSitePo po = this.queryOne(condition, args, DeviceSitePo.Id);
		return po == null ? 0 : po.getId();
	}

	public List<DeviceSitePo> queryAllChild(int id) {
		String condition = Restrictions.equal(DeviceSitePo.Id, "?")
				.append(Restrictions.like(DeviceSitePo.Path, "'" + id + ",%'")).toString();
		Object[] args = new Object[] { id };
		return this.query(condition, args);
	}

	public List<DeviceSitePo> queryByPid(int pid) {
		String condition = Restrictions.equal(DeviceSitePo.Pid, "?")
				.append(Restrictions.orderBy(SortType.ASC, DeviceSitePo.Sequence))
				.toString();
		Object[] args = new Object[] { pid };
		return this.query(condition, args);
	}

	public List<DeviceSitePo> queryByPage(String fieldName, String keyword, PageInfo page) {
		String condition = "";
		if (keyword != null && keyword.trim().length() > 0) {
			condition = Restrictions.like(fieldName, "%" + keyword + "%").toString();
		}
		String[] columnNames = new String[] {
				DeviceSitePo.Id, DeviceSitePo.Pid, DeviceSitePo.Uid, DeviceSitePo.Path,
				DeviceSitePo.Name, DeviceSitePo.CreateUser, DeviceSitePo.CreateTime
		};
		return this.query(condition, page, columnNames);
	}

	public int updateUid(int id, String uid) {
		String condition = Restrictions.equal(DeviceSitePo.Id, "?").toString();
		String[] columnNames = new String[] { DeviceSitePo.Uid };
		Object[] args = new Object[] { uid, id };
		return this.update(condition, args, columnNames);
	}

	public int updatePath(int id, String path) {
		String condition = Restrictions.equal(DeviceSitePo.Id, "?").toString();
		String[] columnNames = new String[] { DeviceSitePo.Path };
		Object[] args = new Object[] { path, id };
		return this.update(condition, args, columnNames);
	}

	public int updateHasChild(int pid, boolean hasChild) {
		String condition = Restrictions.equal(DeviceSitePo.Id, "?").toString();
		String[] columnNames = new String[] { DeviceSitePo.HasChild };
		Object[] args = new Object[] { hasChild, pid };
		return this.update(condition, args, columnNames);
	}

	public int updatePid(int id, int pid) {
		String condition = Restrictions.equal(DeviceSitePo.Id, "?").toString();
		String[] columnNames = new String[] { DeviceSitePo.Pid };
		Object[] args = new Object[] { pid, id };
		return this.update(condition, args, columnNames);
	}

	public int updateCreateUser(int id, String createUser, String comment) {
		String condition = Restrictions.equal(DeviceSitePo.Id, "?").toString();
		String[] columnNames = new String[] { DeviceSitePo.CreateUser, DeviceSitePo.Comment };
		Object[] args = new Object[] { createUser, comment, id };
		return this.update(condition, args, columnNames);
	}

	public int updateByUid(DeviceSitePo po) {
		String[] columnNames = new String[] {
				DeviceSitePo.Name,
				DeviceSitePo.Comment
		};
		String condition = Restrictions.equal(DeviceSitePo.Uid, "?").toString();
		Object[] args = new Object[] { po.getUid() };
		return this.update(po, condition, args, columnNames);
	}

	public int updateChild(DeviceSitePo po) {
		String[] columnNames = new String[] {
				DeviceSitePo.DeviceType, DeviceSitePo.ApProtocol, DeviceSitePo.McpProtocol,
				DeviceSitePo.Protocol, DeviceSitePo.Manufactor, DeviceSitePo.ApMaxLen, DeviceSitePo.
				McpMode, DeviceSitePo.Nc, DeviceSitePo.Tot1, DeviceSitePo.Tg, DeviceSitePo.Location
		};
		String condition = Restrictions.equal(DeviceSitePo.Pid, "?").toString();
		Object[] args = new Object[] { po.getId() };
		return this.update(po, condition, args, columnNames);
	}
}
