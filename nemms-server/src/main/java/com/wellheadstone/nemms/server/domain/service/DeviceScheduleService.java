package com.wellheadstone.nemms.server.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.DeviceScheduleDao;
import com.wellheadstone.nemms.server.domain.po.DeviceSchedulePo;

@Service
public class DeviceScheduleService extends BaseService<DeviceScheduleDao, DeviceSchedulePo> {
	@Autowired
	public DeviceScheduleService(DeviceScheduleDao dao) {
		super(dao);
	}
}