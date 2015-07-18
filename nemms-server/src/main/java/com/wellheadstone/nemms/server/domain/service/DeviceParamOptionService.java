package com.wellheadstone.nemms.server.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.DeviceParamOptionDao;
import com.wellheadstone.nemms.server.domain.po.DeviceParamOptionPo;

@Service
public class DeviceParamOptionService extends BaseService<DeviceParamOptionDao, DeviceParamOptionPo> {
	@Autowired
	public DeviceParamOptionService(DeviceParamOptionDao dao) {
		super(dao);
	}
}