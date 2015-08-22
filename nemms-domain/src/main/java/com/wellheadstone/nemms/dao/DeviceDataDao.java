package com.wellheadstone.nemms.dao;

import java.sql.Types;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.DeviceDataPo;
import com.wellheadstone.nemms.po.DeviceParamPo;
import com.wellheadstone.nemms.po.DeviceSiteParamPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceDataDao extends BaseDao<DeviceDataPo> {

	public DeviceDataDao() {
		super(DeviceDataPo.EntityName, DeviceDataPo.Id);
	}

	public List<DeviceSiteParamPo> queryAllValues(String siteUid) {
		StringBuilder sqlBuilder = new StringBuilder("");
		sqlBuilder.append("SELECT ");
		sqlBuilder.append("	t2.id,");
		sqlBuilder.append("	t2.category_id,");
		sqlBuilder.append("	t2.name,");
		sqlBuilder.append("	t2.mode,");
		sqlBuilder.append("	t2.unit,");
		sqlBuilder.append("	t2.ratio,");
		sqlBuilder.append("	t2.value_type,");
		sqlBuilder.append("	t2.html_elem,");
		sqlBuilder.append("	t2.html_elem_key,");
		sqlBuilder.append("	t1.site_uid,");
		sqlBuilder.append("	t1.param_uid,");
		sqlBuilder.append("	t1.mcp_id,");
		sqlBuilder.append("	t1.create_time,");
		sqlBuilder.append("	t1.`value` ");		
		sqlBuilder.append("FROM ");
		sqlBuilder.append("	%s t1 ");
		sqlBuilder.append("INNER JOIN %s t2 ON t1.param_uid = t2.uid and t1.mcp_id = t2.mcp_id ");
		sqlBuilder.append("WHERE ");
		sqlBuilder.append("	t1.site_uid = ? ");
		String sql = String.format(sqlBuilder.toString(), DeviceDataPo.EntityName, DeviceParamPo.EntityName);
		return this.queryForList(sql, new Object[] { siteUid }, new int[] { Types.VARCHAR }, DeviceSiteParamPo.class);
	}
}
