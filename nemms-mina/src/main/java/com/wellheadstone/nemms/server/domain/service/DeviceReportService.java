package com.wellheadstone.nemms.server.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.DeviceReportDao;
import com.wellheadstone.nemms.server.domain.po.DeviceReportPo;

@Service
public class DeviceReportService extends BaseService<DeviceReportDao, DeviceReportPo> {
	@Autowired
	public DeviceReportService(DeviceReportDao dao) {
		super(dao);
	}
}