package com.wellheadstone.nemms.server.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.SiteDao;
import com.wellheadstone.nemms.server.domain.po.SitePo;

@Service
public class SiteService extends BaseService<SiteDao, SitePo> {
	@Autowired
	public SiteService(SiteDao dao) {
		super(dao);
	}

	public SitePo getByUid(String uid) {
		return this.dao.queryByUid(uid);
	}

	public List<SitePo> getByPid(int pid) {
		return this.dao.queryByPid(pid);
	}

	public boolean hasChild(int pid) {
		return this.dao.countChildBy(pid) > 0;
	}

	public String getPath(int pid, int id) {
		if (pid <= 0) {
			return "" + id;
		}
		return this.dao.queryPath(pid) + "," + id;
	}
}