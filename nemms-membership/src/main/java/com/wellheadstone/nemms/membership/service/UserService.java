package com.wellheadstone.nemms.membership.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.membership.dao.UserDao;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.membership.security.PasswordService;

@Service
public class UserService extends BaseService<UserDao, UserPo> {
	@Resource
	private PasswordService passwordService;
	@Resource
	private RoleService roleService;

	@Autowired
	public UserService(UserDao dao) {
		super(dao);
	}

	public UserPo getUserByAccount(String account) {
		return this.dao.queryByAccount(account);
	}

	public List<UserPo> getUsers(PageInfo page, UserPo logingUser) {
		String[] columnNames = new String[] {
				UserPo.UserId, UserPo.Account, UserPo.Name, UserPo.Comment,
				UserPo.Email, UserPo.Telephone, UserPo.Status, UserPo.CreateTime
		};

		String condition = this.roleService.isSuperAdminRole(logingUser.getRoles()) ? "" :
				String.format("FIND_IN_SET(%1$s,'%2$s') ", UserPo.Roles, this.roleService.getRoleIdsBy(logingUser.getAccount()));
		return this.getDao().query(condition, page, columnNames);
	}

	public List<UserPo> getUsersByKeyword(PageInfo page, UserPo logingUser, String fieldName, String keyword) {
		String[] columnNames = new String[] {
				UserPo.UserId, UserPo.Account, UserPo.Name, UserPo.Comment,
				UserPo.Email, UserPo.Telephone, UserPo.Status, UserPo.CreateTime
		};

		String condition = this.roleService.isSuperAdminRole(logingUser.getRoles()) ? "1=1 " :
				String.format("FIND_IN_SET(%1$s,'%2$s') ", UserPo.Roles, this.roleService.getRoleIdsBy(logingUser.getAccount()));
		if (StringUtils.isNotBlank(keyword)) {
			condition += String.format("AND %s LIKE '%%%s%%' ", fieldName, keyword);
		}
		return this.getDao().query(condition, page, columnNames);
	}

	public void encryptPassword(UserPo user) {
		user.setSalt(passwordService.genreateSalt());
		user.setPassword(passwordService.encryptPassword(user.getPassword(), user.getCredentialsSalt()));
	}
}