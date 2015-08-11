package com.wellheadstone.nemms.web.membership.controllers;

import java.util.ArrayList;
import java.util.Collection;
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
import org.springframework.web.servlet.ModelAndView;

import com.wellheadstone.nemms.common.viewmodel.IdNamePair;
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.common.viewmodel.TreeNode;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.membership.po.ModulePo;
import com.wellheadstone.nemms.membership.po.OperationPo;
import com.wellheadstone.nemms.membership.po.RolePo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.membership.service.ModuleService;
import com.wellheadstone.nemms.membership.service.OperationService;
import com.wellheadstone.nemms.membership.service.RoleService;
import com.wellheadstone.nemms.web.DataGridPager;
import com.wellheadstone.nemms.web.controllers.AbstractController;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/membership/role")
public class RoleController extends AbstractController {
	@Resource
	private RoleService roleService;
	@Resource
	private ModuleService moduleService;
	@Resource
	private OperationService operationService;

	@RequestMapping(value = { "", "/", "/index" })
	public ModelAndView index(@CurrentUser UserPo loginUser) {
		ModelAndView modelAndView = new ModelAndView("membership/role");
		modelAndView.addObject("isSuperAdmin", this.roleService.isSuperAdminRole(loginUser.getRoles()));
		return modelAndView;
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(@CurrentUser UserPo loginUser, DataGridPager pager,
			HttpServletRequest request) {
		pager.setDefaultSort(RolePo.Sequence);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(),
				pager.getRows(), pager.getSort(), pager.getOrder());
		List<RolePo> list = this.roleService.isSuperAdminRole(loginUser.getRoles()) ?
				this.roleService.getByPage(pageInfo) :
				this.roleService.getRolesBy(pageInfo, loginUser.getAccount());

		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);
		return modelMap;
	}

	@RequestMapping(value = "/find")
	@ResponseBody
	public Map<String, Object> find(@CurrentUser UserPo loginUser,
			DataGridPager pager, String fieldName, String keyword, HttpServletRequest request) {
		pager.setDefaultSort(UserPo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(),
				pager.getRows(), pager.getSort(), pager.getOrder());
		List<RolePo> list = this.roleService.getRolesByKeyword(pageInfo, loginUser, fieldName, keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);
		return modelMap;
	}

	@RequestMapping(value = "/getRoleList")
	@ResponseBody
	public List<IdNamePair> getRoleList(@CurrentUser UserPo loginUser) {
		return this.roleService.getRolesList(loginUser)
				.stream()
				.map(x -> new IdNamePair(String.valueOf(x.getRoleId()), x.getName()))
				.collect(Collectors.toList());
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public ParamJsonResult<RolePo> add(@CurrentUser UserPo loginUser, RolePo po) {
		ParamJsonResult<RolePo> result = new ParamJsonResult<RolePo>(false, "创建角色失败！");

		try {
			po.setCreateUser(loginUser.getAccount());
			this.roleService.add(po);
			this.setSuccessResult(result, "创建角色成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public ParamJsonResult<RolePo> remove(String id) {
		ParamJsonResult<RolePo> result = new ParamJsonResult<RolePo>(false, "删除角色失败!");
		try {
			if (this.roleService.isSuperAdminRole(id)) {
				this.setFailureResult(result, "删除角色失败,系统角色不能删除！");
			}
			this.roleService.remove(Integer.parseInt(id));
			this.setSuccessResult(result, "删除角色成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public ParamJsonResult<RolePo> edit(RolePo po) {
		ParamJsonResult<RolePo> result = new ParamJsonResult<RolePo>(false, "更新角色失败!");
		String[] names = new String[] {
				RolePo.Name, RolePo.Code, RolePo.IsSystem,
				RolePo.Status, RolePo.Sequence, RolePo.Comment
		};

		try {
			this.roleService.edit(po, po.getRoleId(), names);
			this.setSuccessResult(result, "更新角色成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/authorize")
	@ResponseBody
	public ParamJsonResult<RolePo> authorize(RolePo po) {
		ParamJsonResult<RolePo> result = new ParamJsonResult<RolePo>(false, "给角色授权失败!");
		String[] names = new String[] {
				RolePo.Modules,
				RolePo.Operations,
				RolePo.DeviceParamProps
		};

		try {
			po.setOperations(StringUtils.stripEnd(po.getOperations(), ","));
			po.setModules(operationService.getModuleIds(po.getOperations()));
			this.roleService.edit(po, po.getRoleId(), names);
			this.setSuccessResult(result, "给角色授权成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/getRoleById")
	@ResponseBody
	public RolePo getRoleById(String id) {
		return this.roleService.getById(id);

	}

	@RequestMapping(value = "/listOperationTree")
	@ResponseBody
	public List<TreeNode<String>> listOperationTree(@CurrentUser UserPo loginUser) {
		Map<String, String[]> roleModuleAndOperationMap =
				this.roleService.getRoleModulesAndOperations(loginUser);
		if (roleModuleAndOperationMap == null) {
			return new ArrayList<TreeNode<String>>(0);
		}

		return this.buildTree(this.getModuleOperations(
				loginUser.getRoles(),
				roleModuleAndOperationMap.get("modules"),
				roleModuleAndOperationMap.get("operations")));
	}

	private List<TreeNode<String>> getModuleOperations(String userRoles, String[] moduleSplit, String[] operationSplit) {
		boolean isSuperAdminRole = this.roleService.isSuperAdminRole(userRoles);
		List<ModulePo> modules = isSuperAdminRole ?
				this.moduleService.getAllModules() :
				this.moduleService.getModules(this.roleService.getModuleIds(userRoles));
		List<TreeNode<String>> moduleNodes = modules.stream().map(x -> {
			TreeNode<String> node = new TreeNode<String>(
					String.valueOf(-x.getModuleId()),
					String.valueOf(-x.getParentId()),
					x.getName(),
					"closed",
					"",
					ArrayUtils.contains(moduleSplit, x.getModuleId().toString()),
					x.getName()
					);
			return node;
		}).collect(Collectors.toList());

		List<OperationPo> operations = this.operationService.getAllOperations();
		List<TreeNode<String>> operationNodes = operations.stream().map(x -> {
			TreeNode<String> node = new TreeNode<String>(
					String.valueOf(x.getOperationId()),
					String.valueOf(-x.getModuleId()),
					x.getName(),
					"open",
					"",
					ArrayUtils.contains(operationSplit, x.getOperationId().toString()),
					x.getName()
					);
			return node;
		}).collect(Collectors.toList());
		moduleNodes.addAll(operationNodes);

		return moduleNodes;
	}

	private List<TreeNode<String>> buildTree(Collection<TreeNode<String>> nodes) {
		if (nodes == null || nodes.size() == 0) {
			return new ArrayList<TreeNode<String>>(0);
		}

		List<TreeNode<String>> rootNodes = nodes.stream()
				.filter(x -> x.getPId().equals("0"))
				.collect(Collectors.toList());

		for (TreeNode<String> rootNode : rootNodes) {
			getChildNodes(nodes, rootNode);
		}
		return rootNodes;
	}

	private void getChildNodes(Collection<TreeNode<String>> nodes, TreeNode<String> node) {
		List<TreeNode<String>> childNodes = nodes.stream()
				.filter(x -> x.getPId().equals(node.getId()))
				.collect(Collectors.toList());

		for (TreeNode<String> childNode : childNodes) {
			node.getChildren().add(childNode);
			getChildNodes(nodes, childNode);
		}
	}
}