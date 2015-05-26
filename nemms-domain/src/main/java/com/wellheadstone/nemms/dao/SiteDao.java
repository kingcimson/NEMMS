package com.wellheadstone.nemms.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.SitePo;

/**
 * 数据访问实现类
 */
@Repository
public class SiteDao extends BaseDao<SitePo> {

	public SiteDao() {
		super(SitePo.EntityName, SitePo.Id);
	}
}
