package com.wellheadstone.nemms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.DeviceMonitorPo;
import com.wellheadstone.nemms.po.SiteParamPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceMonitorDao extends BaseDao<DeviceMonitorPo> {

	public DeviceMonitorDao() {
		super(DeviceMonitorPo.EntityName, DeviceMonitorPo.Id);
	}

	public List<SiteParamPo> queryAllValues(int siteId) {
		StringBuilder sqlBuilder = new StringBuilder("");
		sqlBuilder.append("SELECT ");
		sqlBuilder.append("	t2.*, ");
		sqlBuilder.append("	t1.site_id, ");
		sqlBuilder.append("	t1.`value` ");
		sqlBuilder.append("FROM ");
		sqlBuilder.append("	device_monitor t1 ");
		sqlBuilder.append("INNER JOIN device_param t2 ON t1.param_id = t2.id ");
		sqlBuilder.append("WHERE ");
		sqlBuilder.append("	t1.site_id = %s ");
		String sql = 		String.format(sqlBuilder.toString(),siteId);
		return this.queryForList(sql, SiteParamPo.class);
	}
}
