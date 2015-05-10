package com.wellheadstone.nemms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceMonitorDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceMonitorPo;

@Service
public class DeviceMonitorService extends BaseService<DeviceMonitorDao, DeviceMonitorPo> {
	@Autowired
	public DeviceMonitorService(DeviceMonitorDao dao) {
		super(dao);
	}
}