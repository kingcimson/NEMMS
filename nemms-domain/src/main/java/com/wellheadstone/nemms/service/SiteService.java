package com.wellheadstone.nemms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.SiteDao;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.SitePo;

@Service
public class SiteService extends BaseService<SiteDao, SitePo> {
	@Autowired
	public SiteService(SiteDao dao) {
		super(dao);
	}

	public int addSite(SitePo entity) {
		// entity.setUid(UUID.randomUUID().toString());
		int newId = this.dao.insertWithId(entity);
		this.setHasChild(entity.getPid());
		this.dao.updatePath(newId, this.getPath(entity.getPid(), newId));
		return newId;
	}

	public boolean editSite(SitePo entity) {
		String[] columnNames = new String[] {
				SitePo.Name, SitePo.Uid, SitePo.DeviceType,
				SitePo.ApProtocol, SitePo.McpProtocol,
				SitePo.Protocol, SitePo.Manufactor,
				SitePo.Sequence, SitePo.Comment
		};
		return this.edit(entity, entity.getId(), columnNames);
	}

	public boolean editDevice(SitePo entity) {
		String[] columnNames = new String[] {
				SitePo.Name, SitePo.Uid, SitePo.IpAddr, SitePo.Port,
				SitePo.Sequence, SitePo.Comment,
		};
		return this.edit(entity, entity.getId(), columnNames);
	}

	public SitePo getByUid(String uid) {
		return this.dao.queryByUid(uid);
	}

	public List<SitePo> getByPid(int pid) {
		return this.dao.queryByPid(pid);
	}

	public List<SitePo> getByPage(String fieldName, String keyword, PageInfo page) {
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