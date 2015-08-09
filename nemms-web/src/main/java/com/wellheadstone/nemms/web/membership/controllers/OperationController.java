package com.wellheadstone.nemms.web.membership.controllers;

import java.util.ArrayList;
import java.util.Calendar;
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

import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.common.viewmodel.TreeNode;
import com.wellheadstone.nemms.membership.po.ModulePo;
import com.wellheadstone.nemms.membership.po.OperationPo;
import com.wellheadstone.nemms.membership.po.RolePo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.membership.service.ModuleService;
import com.wellheadstone.nemms.membership.service.OperationService;
import com.wellheadstone.nemms.membership.service.RoleService;
import com.wellheadstone.nemms.web.controllers.AbstractController;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/membership/operation")
public class OperationController extends AbstractController {
	@Resource
	private OperationService operationService;
	@Resource
	private RoleService roleService;
	@Resource
	private ModuleService moduleService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index() {
		return "membership/operation";
	}

	@RequestMapping(value = "/refresh")
	@ResponseBody
	public JsonResult refresh() {
		JsonResult result = new JsonResult(false, "刷新操作列表失败!");
		try {
			this.operationService.reloadCache();
			this.setSuccessResult(result, "刷新操作列表成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public ParamJsonResult<OperationPo> add(OperationPo po) {
		ParamJsonResult<OperationPo> result = new ParamJsonResult<OperationPo>(false, "添加操作失败！");

		po.setCreateTime(Calendar.getInstance().getTime());
		try {
			this.operationService.addOperation(po);
			this.setSuccessResult(result, "添加操作成功！");
			this.operationService.reloadCache();
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public ParamJsonResult<OperationPo> remove(Integer id) {
		ParamJsonResult<OperationPo> result = new ParamJsonResult<OperationPo>(false, "删除操作失败！");

		try {
			this.operationService.remove(id);
			this.setSuccessResult(result, "删除操作成功！");
			this.operationService.reloadCache();
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public ParamJsonResult<OperationPo> edit(OperationPo po) {
		ParamJsonResult<OperationPo> result = new ParamJsonResult<OperationPo>(false, "更新操作失败！");
		String[] names = new String[] {
				OperationPo.Name, OperationPo.Code,
				OperationPo.Sequence, OperationPo.Comment
		};

		try {
			this.operationService.edit(po, po.getOperationId(), names);
			this.setSuccessResult(result, "更新操作成功！");
			this.operationService.reloadCache();
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/getOperations")
	@ResponseBody
	public Map<String, Object> getOperations(Integer id, HttpServletRequest request) {
		int operationId = (id == null ? 0 : id);

		List<OperationPo> list = this.operationService.getOperationMapById(operationId);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("data", list);

		return modelMap;
	}

	@RequestMapping(value = "/listOperationTree")
	@ResponseBody
	public List<TreeNode<String>> listOperationTree(@CurrentUser UserPo loginUser, Integer id) {
		int roleId = (id == null ? 0 : id);
		RolePo role = this.roleService.getById(roleId, RolePo.Modules, RolePo.Operations);
		String[] moduleSplit = new String[] {};
		String[] operationSplit = new String[] {};
		if (role != null) {
			moduleSplit = StringUtils.split(role.getModules(), ',');
			operationSplit = StringUtils.split(role.getOperations(), ',');
		}

		return this.buildTree(this.getModuleOperations(
				loginUser.getRoles(),
				moduleSplit,
				operationSplit));
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
				.filter(x -> x.getPId().equals("-0"))
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