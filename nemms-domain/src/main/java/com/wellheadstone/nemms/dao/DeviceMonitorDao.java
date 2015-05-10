package com.wellheadstone.nemms.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.DeviceMonitorPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceMonitorDao extends BaseDao<DeviceMonitorPo> {

	public DeviceMonitorDao() {
		super(DeviceMonitorPo.EntityName, DeviceMonitorPo.Id);
	}
}
