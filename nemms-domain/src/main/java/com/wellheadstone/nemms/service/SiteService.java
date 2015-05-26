package com.wellheadstone.nemms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.SiteDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.SitePo;

@Service
public class SiteService extends BaseService<SiteDao, SitePo> {
	@Autowired
	public SiteService(SiteDao dao) {
		super(dao);
	}
}