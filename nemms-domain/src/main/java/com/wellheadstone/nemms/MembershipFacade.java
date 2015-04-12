package com.wellheadstone.nemms;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.po.ModulePo;
import com.wellheadstone.nemms.po.UserPo;
import com.wellheadstone.nemms.service.ModuleService;
import com.wellheadstone.nemms.service.OperationService;
import com.wellheadstone.nemms.service.RoleService;
import com.wellheadstone.nemms.service.UserService;

/**
 * 用户权限服务外观类
 * 
 *
 */
@Service
public class MembershipFacade {
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	@Resource
	private ModuleService moduleService;
	@Resource
	private OperationService operationService;

	public MembershipFacade() {
	}

	/**
	 * 
	 * @param account
	 * @return
	 */
	public UserPo getUser(String account) {
		return this.userService.getUserByAccount(account);
	}

	/**
	 * 获取角色id对应的名称
	 * 
	 * @param 用户的roleIds
	 * @return names
	 */
	public String getRoleNames(String roleIds) {
		return this.roleService.getNames(roleIds);
	}

	/**
	 * 获取角色id Set集合
	 * 
	 * @param roleIds
	 *            角色ids
	 * @return Set集合
	 */
	public Set<String> getRoleSet(String roleIds) {
		String[] roleIdSplit = StringUtils.split(roleIds, ',');
		if (roleIdSplit == null || roleIdSplit.length == 0) {
			return Collections.emptySet();
		}

		Set<String> roleSet = new HashSet<String>(roleIdSplit.length);
		for (String roleId : roleIdSplit) {
			if (!roleSet.contains(roleId.trim())) {
				roleSet.add(roleId);
			}
		}
		return roleSet;
	}

	/**
	 * 获取权限id Set集合
	 * 
	 * @param roleIds
	 *            角色ids
	 * @return Set集合
	 */
	public Set<String> getPermissionSet(String roleIds) {
		String operationIds = roleService.getOperationIds(roleIds);
		if (StringUtils.isBlank(operationIds)) {
			return Collections.emptySet();
		}

		String[] operationIdSplit = StringUtils.split(operationIds, ',');
		Set<String> permSet = new HashSet<String>(operationIdSplit.length);
		for (String optId : operationIdSplit) {
			if (!permSet.contains(optId.trim())) {
				permSet.add(optId);
			}
		}
		return permSet;
	}

	/**
	 * 
	 * @param roleIds
	 * @param codes
	 * @return
	 */
	public boolean hasPermission(String roleIds, String... codes) {
		if (this.isAdministrator(roleIds)) {
			return true;
		}

		if (StringUtils.isBlank(roleIds) || codes == null || codes.length == 0) {
			return false;
		}

		String operationIds = roleService.getOperationIds(roleIds);
		if (StringUtils.isBlank(operationIds)) {
			return false;
		}

		String[] operationIdSplit = StringUtils.split(operationIds, ',');
		String codeOperationIds = operationService.getOperationIds(codes);
		String[] codeOperationIdSplit = StringUtils.split(codeOperationIds, ',');

		return this.hasPermission(codeOperationIdSplit, operationIdSplit);
	}

	private boolean hasPermission(String[] codeOperationIdSplit, String[] operationIdSplit) {
		if (codeOperationIdSplit == null ||
				operationIdSplit == null)
			return false;

		for (String optId : codeOperationIdSplit) {
			if (!ArrayUtils.contains(operationIdSplit, optId))
				return false;
		}

		return true;
	}

	/**
	 * 
	 * @param roleIds
	 * @return
	 */
	public boolean isAdministrator(String roleIds) {
		if (StringUtils.isBlank(roleIds))
			return false;
		return this.roleService.isSuperAdminRole(roleIds);
	}

	/**
	 * 
	 * @param roleIds
	 * @return
	 */
	public List<ModulePo> getModules(String roleIds) {
		if (this.isAdministrator(roleIds)) {
			return moduleService.getAllModules();
		}
		String moduleIds = roleService.getModuleIds(roleIds);
		return moduleService.getModules(moduleIds);
	}
}
