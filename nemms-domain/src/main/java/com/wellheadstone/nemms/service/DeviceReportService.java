package com.wellheadstone.nemms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceReportDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceReportPo;

@Service
public class DeviceReportService extends BaseService<DeviceReportDao, DeviceReportPo> {
	@Autowired
	public DeviceReportService(DeviceReportDao dao) {
		super(dao);
	}
}