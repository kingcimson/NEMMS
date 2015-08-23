package com.wellheadstone.nemms.server.domain.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.server.domain.po.DeviceReportPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceReportDao extends BaseDao<DeviceReportPo> {

	public DeviceReportDao() {
		super(DeviceReportPo.EntityName, DeviceReportPo.Id);
	}
}
