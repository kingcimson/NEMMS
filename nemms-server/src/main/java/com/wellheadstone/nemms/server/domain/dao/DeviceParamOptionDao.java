package com.wellheadstone.nemms.server.domain.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.server.domain.po.DeviceParamOptionPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceParamOptionDao extends BaseDao<DeviceParamOptionPo> {

	public DeviceParamOptionDao() {
		super(DeviceParamOptionPo.EntityName, DeviceParamOptionPo.Id);
	}
}
