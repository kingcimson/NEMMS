package com.wellheadstone.nemms.server.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.DeviceMonitorDao;
import com.wellheadstone.nemms.server.domain.po.DeviceMonitorPo;

@Service
public class DeviceMonitorService extends BaseService<DeviceMonitorDao, DeviceMonitorPo> {
	@Autowired
	public DeviceMonitorService(DeviceMonitorDao dao) {
		super(dao);
	}
}