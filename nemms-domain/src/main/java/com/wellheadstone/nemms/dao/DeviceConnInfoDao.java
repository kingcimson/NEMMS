package com.wellheadstone.nemms.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.DeviceConnInfoPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceConnInfoDao extends BaseDao<DeviceConnInfoPo> {

	public DeviceConnInfoDao() {
		super(DeviceConnInfoPo.EntityName, DeviceConnInfoPo.Id);
	}
}
