package com.wellheadstone.nemms.web.membership.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.util.DhtmlXTreeUtils;
import com.wellheadstone.nemms.common.viewmodel.DhtmlXTreeNode;
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.SortType;
import com.wellheadstone.nemms.membership.po.RolePo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.membership.security.PasswordService;
import com.wellheadstone.nemms.membership.service.RoleService;
import com.wellheadstone.nemms.membership.service.UserService;
import com.wellheadstone.nemms.web.DataGridPager;
import com.wellheadstone.nemms.web.DataTablePageInfo;
import com.wellheadstone.nemms.web.controllers.AbstractController;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/membership/user")
public class UserController extends AbstractController {
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	@Resource
	private PasswordService passwordService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index() {
		return "membership/user";
	}

	@RequestMapping(value = "/getUsers")
	@ResponseBody
	public Map<String, Object> getusers(@CurrentUser UserPo loginUser, DataGridPager pager,
			HttpServletRequest request) {
		pager.setDefaultSort(UserPo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(), pager.getOrder());
		List<UserPo> list = this.userService.getUsers(pageInfo, loginUser);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/getUsersByKeyword")
	@ResponseBody
	public Map<String, Object> getUsersByKeyword(@CurrentUser UserPo loginUser, DataTablePageInfo dtPageInfo,
			String fieldName, String keyword,
			HttpServletRequest request) {
		PageInfo page = dtPageInfo.toPageInfo(request.getParameterMap(), UserPo.CreateTime);
		List<UserPo> list = this.userService.getUsersByKeyword(page, loginUser, fieldName, keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("draw", dtPageInfo.getDraw());
		modelMap.put("recordsTotal", page.getTotals());
		modelMap.put("recordsFiltered", page.getTotals());
		modelMap.put("data", list);
		return modelMap;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public ParamJsonResult<UserPo> add(UserPo po, HttpServletRequest request) {
		ParamJsonResult<UserPo> result = new ParamJsonResult<UserPo>(false, "");
		try {
			this.userService.encryptPassword(po);
			this.userService.add(po);
			this.setSuccessResult(result, "创建用户成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/removeById")
	@ResponseBody
	public ParamJsonResult<UserPo> remove(Integer id, HttpServletRequest request) {
		ParamJsonResult<UserPo> result = new ParamJsonResult<UserPo>(false, "");
		try {
			this.userService.remove(id);
			result.setSuccess(this.userService.remove(id));
			this.setSuccessResult(result, "删除用户成功!");
			return result;
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/updateUserPasswordById")
	@ResponseBody
	public ParamJsonResult<UserPo> updateUserPasswordById(Integer userId, String password, HttpServletRequest request) {
		ParamJsonResult<UserPo> result = new ParamJsonResult<UserPo>(false, "更新密码失败！");
		try {
			UserPo user = this.userService.getById(userId, UserPo.UserId, UserPo.Account);
			user.setPassword(password);
			this.userService.encryptPassword(user);
			this.userService.edit(user, user.getUserId(), UserPo.Password, UserPo.Salt);
			this.setSuccessResult(result, "更新密码成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/updateUserPassword")
	@ResponseBody
	public ParamJsonResult<UserPo> updateUserPassword(@CurrentUser UserPo loginUser,
			String password, String oldPassword, HttpServletRequest request) {
		ParamJsonResult<UserPo> result = new ParamJsonResult<UserPo>(false, "修改密码失败！");
		try {
			String encryptPassword = this.passwordService.encryptPassword(
					oldPassword,
					loginUser.getCredentialsSalt());

			if (!encryptPassword.equals(loginUser.getPassword())) {
				result.setMsg("原账户密码错误！");
				return result;
			}

			loginUser.setPassword(password);
			this.userService.encryptPassword(loginUser);
			this.userService.edit(loginUser, loginUser.getUserId(), UserPo.Password, UserPo.Salt);
			this.setSuccessResult(result, "更新密码成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/updateUserById")
	@ResponseBody
	public ParamJsonResult<UserPo> editUserById(UserPo po, HttpServletRequest request) {
		ParamJsonResult<UserPo> result = new ParamJsonResult<UserPo>(false, "更新用户失败!");
		String[] args = new String[] {
				UserPo.Name, UserPo.Email, UserPo.Status,
				UserPo.Comment, UserPo.Roles, UserPo.Telephone
		};

		try {
			this.userService.edit(po, po.getUserId(), args);
			this.setSuccessResult(result, "更新用户成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/getRoles")
	@ResponseBody
	public DhtmlXTreeNode getRoles(@CurrentUser UserPo loginUser, Integer id) {
		int userId = (id == null ? 0 : id);
		UserPo user = this.userService.getById(userId, UserPo.Roles);
		String[] roleSplit = (user == null) ?
				new String[] {} :
				StringUtils.split(user.getRoles(), ',');

		List<RolePo> roles = this.roleService.isSuperAdminRole(loginUser.getRoles()) ?
				this.roleService.getDao().query(RolePo.Sequence, SortType.ASC) :
				this.roleService.getRolesBy(loginUser.getAccount());
		List<DhtmlXTreeNode> nodes = roles.stream().map(x -> {
			DhtmlXTreeNode node = new DhtmlXTreeNode();
			node.setId(String.valueOf(x.getRoleId()));
			node.setChild(0);
			node.setText(x.getName());
			node.setTooltip(x.getComment());
			node.setSequence(x.getSequence());
			node.setPid("0");
			node.setChecked(ArrayUtils.contains(roleSplit, x.getRoleId().toString()) ? 1 : 0);
			return node;
		}).collect(Collectors.toList());

		return DhtmlXTreeUtils.getRootNode("0", DhtmlXTreeUtils.getNodes(nodes, "0"));
	}
}