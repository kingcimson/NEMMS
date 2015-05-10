package com.wellheadstone.nemms.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.DeviceParamPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceParamDao extends BaseDao<DeviceParamPo> {

	public DeviceParamDao() {
		super(DeviceParamPo.EntityName, DeviceParamPo.Id);
	}
}
