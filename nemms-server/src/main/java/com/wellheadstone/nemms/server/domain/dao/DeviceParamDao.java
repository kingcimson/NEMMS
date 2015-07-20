package com.wellheadstone.nemms.server.domain.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;

@Repository
public class DeviceParamDao extends BaseDao<DeviceParamPo> {

	public DeviceParamDao() {
		super(DeviceParamPo.EntityName, DeviceParamPo.Id);
	}
}