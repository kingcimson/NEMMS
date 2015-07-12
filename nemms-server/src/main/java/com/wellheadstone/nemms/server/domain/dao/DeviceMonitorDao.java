package com.wellheadstone.nemms.server.domain.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.server.domain.po.DeviceMonitorPo;

@Repository
public class DeviceMonitorDao extends BaseDao<DeviceMonitorPo> {

	public DeviceMonitorDao() {
		super(DeviceMonitorPo.EntityName, DeviceMonitorPo.Id);
	}
}
