package com.wellheadstone.nemms.membership.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.SortType;
import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.membership.dao.RoleDao;
import com.wellheadstone.nemms.membership.po.RolePo;
import com.wellheadstone.nemms.membership.po.UserPo;

@Service
public class RoleService extends BaseService<RoleDao, RolePo> {
	@Autowired
	public RoleService(RoleDao dao) {
		super(dao);
	}

	public boolean isSuperAdminRole(String roleIds) {
		String condition = Restrictions.in(RolePo.RoleId, roleIds).toString();
		List<RolePo> list = this.getDao().query(condition, RolePo.Code);
		if (list == null || list.size() == 0) {
			return false;
		}
		return list.stream().anyMatch(x -> x.getCode().equals("superAdmin"));
	}

	public String getNames(String roleIds) {
		String condition = Restrictions.in(RolePo.RoleId, roleIds).toString();
		List<RolePo> list = this.getDao().query(condition, RolePo.Name);
		if (list == null || list.size() == 0) {
			return StringUtils.EMPTY;
		}
		return StringUtils.join(list.stream().map(x -> x.getName()).collect(Collectors.toList()), ',');
	}

	public String getModuleIds(String roleIds) {
		String condition = Restrictions.in(RolePo.RoleId, roleIds).toString();
		List<RolePo> list = this.getDao().query(condition, RolePo.Modules);
		List<String> modulesList = list.stream().map(x -> x.getModules()).collect(Collectors.toList());

		String moduleIds = StringUtils.join(modulesList, ',');
		List<String> moduleIdList = Arrays.asList(StringUtils.split(moduleIds, ',')).stream()
				.distinct()
				.collect(Collectors.toList());
		return StringUtils.join(moduleIdList, ',');
	}

	public String getOperationIds(String roleIds) {
		String condition = Restrictions.in(RolePo.RoleId, roleIds).toString();
		List<RolePo> list = this.getDao().query(condition, RolePo.Operations);
		List<String> operationsList = list.stream().map(x -> x.getModules()).collect(Collectors.toList());

		String operationIds = StringUtils.join(operationsList, ',');
		List<String> operationIdList = Arrays.asList(StringUtils.split(operationIds, ',')).stream()
				.distinct()
				.collect(Collectors.toList());
		return StringUtils.join(operationIdList, ',');
	}

	/**
	 * 获取当前用户的所有创建的roles
	 * 
	 * @param page
	 *            分页对象
	 * @param createUser
	 *            当前登录用户账号
	 * @return 当前用户的所有创建的role集合
	 */
	public List<RolePo> getRolesBy(PageInfo page, String createUser) {
		Object[] args = new Object[] { createUser };
		String condition = Restrictions.equal(RolePo.CreateUser, "?").toString();
		return this.getDao().query(condition, page, args);
	}

	/**
	 * 获取当前用户的所有创建的roleids
	 * 
	 * @param createUser
	 *            当前登录用户账号
	 * @return 当前用户的所有创建的role id逗号分隔字符串
	 */
	public String getRoleIdsBy(String createUser) {
		Object[] args = new Object[] { createUser };
		String condition = Restrictions.equal(RolePo.CreateUser, "?").toString();
		List<RolePo> list = this.getDao().query(condition, RolePo.Sequence, SortType.ASC, args, RolePo.RoleId);
		return StringUtils.join(list.stream().map(x -> x.getRoleId().toString()).collect(Collectors.toList()), ',');
	}

	/**
	 * 
	 * @param page
	 * @param logingUser
	 * @param fieldName
	 * @param keyword
	 * @return
	 */
	public List<RolePo> getRolesByKeyword(PageInfo page, UserPo logingUser, String fieldName, String keyword) {
		String condition = this.isSuperAdminRole(logingUser.getRoles()) ? "1=1 " :
				String.format("%1$s = '%2$s' ", RolePo.CreateUser, logingUser.getAccount());
		if (StringUtils.isNotBlank(keyword)) {
			condition += String.format("AND %s LIKE '%%%s%%' ", fieldName, keyword);
		}
		return this.getDao().query(condition, page);
	}

	public List<RolePo> getRolesList(UserPo logingUser) {
		String condition = this.isSuperAdminRole(logingUser.getRoles()) ? "" :
				String.format("%1$s = '%2$s' ", RolePo.CreateUser, logingUser.getAccount());
		return this.getDao().query(condition, RolePo.RoleId, RolePo.Name);
	}
}