package com.wellheadstone.nemms.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.DeviceSchedulePo;

/**
 * 定时任务信息表数据访问实现类
 */
@Repository
public class DeviceScheduleDao extends BaseDao<DeviceSchedulePo> {

	public DeviceScheduleDao() {
		super(DeviceSchedulePo.EntityName, DeviceSchedulePo.Id);
	}
}
