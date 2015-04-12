package com.wellheadstone.nemms.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.EventPo;

/**
 * 用户操作日志表数据访问实现类
 */
@Repository
public class EventDao extends BaseDao<EventPo> {

	public EventDao() {
		super(EventPo.EntityName, EventPo.EventId);
	}

	@Resource
	public void setJDBCTemplate(JdbcTemplate membershipJdbcTemplate) {
		this.setJdbcTemplate(membershipJdbcTemplate);
	}
}
