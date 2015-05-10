package com.wellheadstone.nemms.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceParamDao;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.membership.service.RoleService;
import com.wellheadstone.nemms.po.DeviceParamPo;

@Service
public class DeviceParamService extends BaseService<DeviceParamDao, DeviceParamPo> {
	@Resource
	private RoleService roleService;

	@Autowired
	public DeviceParamService(DeviceParamDao dao) {
		super(dao);
	}

	public List<DeviceParamPo> getParams(PageInfo page, UserPo logingUser) {
		String condition = this.roleService.isSuperAdminRole(logingUser.getRoles()) ? "" :
				String.format("FIND_IN_SET(%1$s,'%2$s') ", DeviceParamPo.AuthorityRoles, logingUser.getRoles());
		return this.getDao().query(condition, page);
	}

	public List<DeviceParamPo> getParamsByKeyword(PageInfo page, UserPo logingUser, String categoryId,
			String fieldName, String keyword) {
		String condition = this.roleService.isSuperAdminRole(logingUser.getRoles()) ? "1=1 " :
				String.format("FIND_IN_SET(%1$s,'%2$s') ", DeviceParamPo.AuthorityRoles, logingUser.getRoles());
		if (StringUtils.isNotBlank(categoryId) && !"all".equals(categoryId)) {
			condition += String.format("AND %s ='%s' ", DeviceParamPo.CategoryId, categoryId);
		}
		if (StringUtils.isNotBlank(keyword)) {
			condition += String.format("AND %s LIKE '%%%s%%' ", fieldName, keyword);
		}
		return this.getDao().query(condition, page);
	}
}