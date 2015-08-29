package com.wellheadstone.nemms.server.domain.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceConnInfoDao extends BaseDao<DeviceConnInfoPo> {

	public DeviceConnInfoDao() {
		super(DeviceConnInfoPo.EntityName, DeviceConnInfoPo.Id);
	}

	public DeviceConnInfoPo queryBy(String siteUid) {
		String condition = Restrictions.equal(DeviceConnInfoPo.SiteUid, "?").toString();
		Object[] args = new Object[] { siteUid };
		return this.queryOne(condition, args);
	}
}
