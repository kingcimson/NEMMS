package com.wellheadstone.nemms.server.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.DeviceParamDao;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;

@Service
public class DeviceParamService extends BaseService<DeviceParamDao, DeviceParamPo> {
	@Autowired
	public DeviceParamService(DeviceParamDao dao) {
		super(dao);
	}
}