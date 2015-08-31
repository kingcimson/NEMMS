package com.wellheadstone.nemms.server.domain.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;

/**
 * 数据访问实现类
 */
@Repository
public class DeviceParamDao extends BaseDao<DeviceParamPo> {

	public DeviceParamDao() {
		super(DeviceParamPo.EntityName, DeviceParamPo.Id);
	}

	public List<DeviceParamPo> queryParamListBy(int mcp) {
		String condition = Restrictions.equal(DeviceParamPo.McpId, "?").toString();
		return this.query(condition, new Object[] { mcp });
	}
}
