package com.wellheadstone.nemms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.NmsStatusDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.NmsStatusPo;

@Service
public class NmsStatusService extends BaseService<NmsStatusDao, NmsStatusPo> {
	@Autowired
	public NmsStatusService(NmsStatusDao dao) {
		super(dao);
	}
}