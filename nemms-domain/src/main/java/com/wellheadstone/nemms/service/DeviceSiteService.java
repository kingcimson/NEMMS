package com.wellheadstone.nemms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceSiteDao;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceSitePo;

@Service
public class DeviceSiteService extends BaseService<DeviceSiteDao, DeviceSitePo> {
	@Autowired
	public DeviceSiteService(DeviceSiteDao dao) {
		super(dao);
	}

	public int addSite(DeviceSitePo entity) {
		int newId = this.dao.insertWithId(entity);
		this.setHasChild(entity.getPid());
		this.dao.updatePath(newId, this.getPath(entity.getPid(), newId));
		return newId;
	}

	public boolean editSite(DeviceSitePo entity) {
		String[] columnNames = new String[] {
				DeviceSitePo.Name, DeviceSitePo.Uid, DeviceSitePo.DeviceType,
				DeviceSitePo.ApProtocol, DeviceSitePo.McpProtocol,
				DeviceSitePo.Protocol, DeviceSitePo.Manufactor, DeviceSitePo.Sequence, DeviceSitePo.Comment,
				DeviceSitePo.ApMaxLen, DeviceSitePo.McpMode, DeviceSitePo.Nc, DeviceSitePo.Tot1, DeviceSitePo.Tg,
				DeviceSitePo.Location
		};
		return this.edit(entity, entity.getId(), columnNames);
	}

	public boolean editDevice(DeviceSitePo entity) {
		String[] columnNames = new String[] {
				DeviceSitePo.Name, DeviceSitePo.Uid,
				DeviceSitePo.Sequence, DeviceSitePo.Comment,
		};
		return this.edit(entity, entity.getId(), columnNames);
	}

	public DeviceSitePo getByUid(String uid) {
		return this.dao.queryByUid(uid);
	}

	public List<DeviceSitePo> getByPid(int pid) {
		return this.dao.queryByPid(pid);
	}

	public List<DeviceSitePo> getByPage(String fieldName, String keyword, PageInfo page) {
		return this.dao.queryByPage(fieldName, keyword, page);
	}

	public boolean hasChild(int pid) {
		return this.dao.countChildBy(pid) > 0;
	}

	public boolean remove(int id, int pid) {
		this.dao.deleteByKey(id);
		if (this.hasChild(pid)) {
			return true;
		}
		return this.dao.updateHasChild(pid, false) > 0;
	}

	public String getPath(int pid, int id) {
		if (pid <= 0) {
			return "" + id;
		}
		return this.dao.queryPath(pid) + "," + id;
	}

	public void setHasChild(int pid) {
		if (pid > 0) {
			this.dao.updateHasChild(pid, true);
		}
	}
}