package com.wellheadstone.nemms.web.membership.controllers;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wellheadstone.nemms.common.util.DhtmlXTreeUtils;
import com.wellheadstone.nemms.common.viewmodel.DhtmlXTreeNode;
import com.wellheadstone.nemms.common.viewmodel.IdNamePair;
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.data.SortType;
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
	public DhtmlXTreeNode list(@CurrentUser UserPo loginUser) {
		List<RolePo> roles = this.roleService.isSuperAdminRole(loginUser.getRoles()) ?
				this.roleService.getDao().query(RolePo.Sequence, SortType.ASC) :
				this.roleService.getRolesBy(loginUser.getAccount());
		List<DhtmlXTreeNode> nodes = roles.stream().map(x -> {
			DhtmlXTreeNode node = new DhtmlXTreeNode();
			node.setId(String.valueOf(x.getRoleId()));
			node.setChild(0);
			node.setText(x.getName());
			node.setTooltip(x.getComment());
			return node;
		}).collect(Collectors.toList());
		return DhtmlXTreeUtils.getRootNode("0", nodes);
	}

	@RequestMapping(value = "/getRoleList")
	@ResponseBody
	public List<IdNamePair> getRoleList() {
		return this.roleService.getAll(RolePo.RoleId, RolePo.Name)
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
			po.setOperations(StringUtils.stripEnd(po.getOperations(), ","));
			po.setModules(operationService.getModuleIds(po.getOperations()));
			this.roleService.add(po);
			this.setSuccessResult(result, "创建角色成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/removeById")
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
		po.setModules(operationService.getModuleIds(po.getOperations()));
		ParamJsonResult<RolePo> result = new ParamJsonResult<RolePo>(false, "更新角色失败!");
		String[] names = new String[] {
				RolePo.Name, RolePo.Code, RolePo.IsSystem, RolePo.Status,
				RolePo.Sequence, RolePo.Comment, RolePo.Modules, RolePo.Operations
		};

		try {
			this.roleService.edit(po, po.getRoleId(), names);
			this.setSuccessResult(result, "更新角色成功!");
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

	@RequestMapping(value = "/getoperations")
	@ResponseBody
	public DhtmlXTreeNode getOperations(@CurrentUser UserPo loginUser, Integer id) {
		int roleId = (id == null ? 0 : id);
		RolePo role = this.roleService.getById(roleId, RolePo.Modules, RolePo.Operations);
		String[] moduleSplit = new String[] {};
		String[] operationSplit = new String[] {};
		if (role != null) {
			moduleSplit = StringUtils.split(role.getModules(), ',');
			operationSplit = StringUtils.split(role.getOperations(), ',');
		}
		List<DhtmlXTreeNode> nodes = this.getModuleOperations(loginUser.getRoles(), moduleSplit, operationSplit);
		return DhtmlXTreeUtils.getRootNode("0", DhtmlXTreeUtils.getNodes(nodes, "0"));
	}

	private List<DhtmlXTreeNode> getModuleOperations(String userRoles, String[] moduleSplit, String[] operationSplit) {
		boolean isSuperAdminRole = this.roleService.isSuperAdminRole(userRoles);
		List<ModulePo> modules = isSuperAdminRole ?
				this.moduleService.getAllModules() :
				this.moduleService.getModules(this.roleService.getModuleIds(userRoles));
		List<DhtmlXTreeNode> moduleNodes = modules.stream().map(x -> {
			DhtmlXTreeNode node = new DhtmlXTreeNode();
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
		List<DhtmlXTreeNode> operationNodes = operations.stream().map(x -> {
			DhtmlXTreeNode node = new DhtmlXTreeNode();
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