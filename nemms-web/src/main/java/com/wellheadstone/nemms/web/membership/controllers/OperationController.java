package com.wellheadstone.nemms.web.membership.controllers;

import java.util.Calendar;
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
import com.wellheadstone.nemms.common.viewmodel.TreeNode<to>;
import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
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
	public TreeNode<String> listOperationTree(@CurrentUser UserPo loginUser, Integer id) {
		int roleId = (id == null ? 0 : id);
		RolePo role = this.roleService.getById(roleId, RolePo.Modules, RolePo.Operations);
		String[] moduleSplit = new String[] {};
		String[] operationSplit = new String[] {};
		if (role != null) {
			moduleSplit = StringUtils.split(role.getModules(), ',');
			operationSplit = StringUtils.split(role.getOperations(), ',');
		}
		List<TreeNode<to>> nodes = this.getModuleOperations(loginUser.getRoles(), moduleSplit, operationSplit);
		return DhtmlXTreeUtils.getRootNode("0", DhtmlXTreeUtils.getNodes(nodes, "0"));
	}

	private List<TreeNode<to>> getModuleOperations(String userRoles, String[] moduleSplit, String[] operationSplit) {
		boolean isSuperAdminRole = this.roleService.isSuperAdminRole(userRoles);
		List<ModulePo> modules = isSuperAdminRole ?
				this.moduleService.getAllModules() :
				this.moduleService.getModules(this.roleService.getModuleIds(userRoles));
		List<TreeNode<to>> moduleNodes = modules.stream().map(x -> {
			TreeNode<to> node = new TreeNode<to>();
			node.setId(String.valueOf(-x.getModuleId()));
			node.setChild(x.isLeaf() ? 0 : 1);
			node.setText(x.getName());
			node.setTooltip(x.getName());
			node.setSequence(x.getSequence());
			node.setPid(String.valueOf(-x.getParentId()));
			node.setChecked((ArrayUtils.contains(moduleSplit, x.getModuleId().toString())) ? -1 : 0);
			return node;
		}).collect(Collectors.toList());

		List<OperationPo> operations = this.operationService.getAllOperations();
		List<TreeNode<to>> operationNodes = operations.stream().map(x -> {
			TreeNode<to> node = new TreeNode<to>();
			node.setId(String.valueOf(x.getOperationId()));
			node.setChild(0);
			node.setText(x.getName());
			node.setTooltip(x.getComment());
			node.setSequence(x.getSequence());
			node.setPid(String.valueOf(-x.getModuleId()));
			node.setChecked((ArrayUtils.contains(operationSplit, x.getOperationId().toString())) ? 1 : 0);
			return node;
		}).collect(Collectors.toList());
		moduleNodes.addAll(operationNodes);

		return moduleNodes;
	}
}