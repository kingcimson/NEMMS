package com.wellheadstone.nemms.server.domain.dao;

import java.sql.Types;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.po.DeviceSiteParamPo;

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
		sqlBuilder.append("	t2.*, ");
		sqlBuilder.append("	t1.`value` ");
		sqlBuilder.append("FROM ");
		sqlBuilder.append("	%s t1 ");
		sqlBuilder.append("INNER JOIN %s t2 ON t1.param_uid = t2.uid and t1.mcp_id = t2.mcp_id ");
		sqlBuilder.append("WHERE ");
		sqlBuilder.append("	t1.site_uid = ? ");
		String sql = String.format(sqlBuilder.toString(), DeviceDataPo.EntityName, DeviceParamPo.EntityName);
		return this.queryForList(sql, new Object[] { siteUid }, new int[] { Types.VARCHAR }, DeviceSiteParamPo.class);
	}

	public int updateAlarm(DeviceDataPo po) {
		String condition = Restrictions.equal(DeviceDataPo.SiteUid, "?")
				.append(Restrictions.And)
				.append(Restrictions.equal(DeviceDataPo.ParamUid, "?"))
				.append(Restrictions.And)
				.append(Restrictions.equal(DeviceDataPo.McpId, "?")).toString();
		return this.update(po, condition,
				new Object[] { po.getSiteUid(), po.getParamUid(), po.getMcpId() }, DeviceDataPo.Value);
	}

	public int deleteBySiteUid(String siteUid) {
		String condition = Restrictions.equal(DeviceDataPo.SiteUid, "?").toString();
		return this.delete(condition, new Object[] { siteUid });
	}
}
