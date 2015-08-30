package com.wellheadstone.nemms.dao;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.NmsStatusPo;

/**
 * 数据访问实现类
 */
@Repository
public class NmsStatusDao extends BaseDao<NmsStatusPo> {

	public NmsStatusDao() {
		super(NmsStatusPo.EntityName, NmsStatusPo.Id);
	}
}
