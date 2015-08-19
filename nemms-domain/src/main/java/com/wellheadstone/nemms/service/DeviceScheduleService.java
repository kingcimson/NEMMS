package com.wellheadstone.nemms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceScheduleDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceSchedulePo;

@Service
public class DeviceScheduleService extends BaseService<DeviceScheduleDao, DeviceSchedulePo> {
	@Autowired
	public DeviceScheduleService(DeviceScheduleDao dao) {
		super(dao);
	}
}