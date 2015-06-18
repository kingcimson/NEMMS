package com.wellheadstone.nemms.membership.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.membership.po.ModulePo;
import com.wellheadstone.nemms.membership.po.OperationPo;

/**
 * 系统操作表数据访问实现类
 */
@Repository
public class OperationDao extends BaseDao<OperationPo> {

	public OperationDao() {
		super(OperationPo.EntityName, OperationPo.OperationId);
	}

	@Resource
	public void setJDBCTemplate(JdbcTemplate membershipJdbcTemplate) {
		this.setJdbcTemplate(membershipJdbcTemplate);
	}

	public List<OperationPo> queryWithModulePath() {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("SELECT ");
		sqlBuilder.append("		t1.*, t2.path  ");
		sqlBuilder.append("FROM  ");
		sqlBuilder.append("		%s t1  ");
		sqlBuilder.append("INNER JOIN %s t2 ON t1.module_id = t2.module_id");

		String sql = String.format(sqlBuilder.toString(), OperationPo.EntityName, ModulePo.EntityName);
		return this.queryForList(sql, OperationPo.class);
	}

	public Map<String, OperationPo> queryWithModulePathForMap() {
		List<OperationPo> opertions = this.queryWithModulePath();
		Map<String, OperationPo> operationMap = new HashMap<String, OperationPo>(opertions.size());
		for (OperationPo opertion : opertions) {
			operationMap.put(opertion.getOperationId().toString(), opertion);
		}
		return operationMap;
	}
}
