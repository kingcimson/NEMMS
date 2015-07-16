package com.wellheadstone.nemms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceParamOptionDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceParamOptionPo;

@Service
public class DeviceParamOptionService extends BaseService<DeviceParamOptionDao, DeviceParamOptionPo> {
	@Autowired
	public DeviceParamOptionService(DeviceParamOptionDao dao) {
		super(dao);
	}
}