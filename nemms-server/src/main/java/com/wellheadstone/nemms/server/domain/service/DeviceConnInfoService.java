package com.wellheadstone.nemms.server.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.DeviceConnInfoDao;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;

@Service
public class DeviceConnInfoService extends BaseService<DeviceConnInfoDao, DeviceConnInfoPo> {
	@Autowired
	public DeviceConnInfoService(DeviceConnInfoDao dao) {
		super(dao);
	}
}