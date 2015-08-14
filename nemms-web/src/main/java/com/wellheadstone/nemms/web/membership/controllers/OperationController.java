package com.wellheadstone.nemms.web.membership.controllers;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.membership.po.OperationPo;
import com.wellheadstone.nemms.membership.service.ModuleService;
import com.wellheadstone.nemms.membership.service.OperationService;
import com.wellheadstone.nemms.membership.service.RoleService;
import com.wellheadstone.nemms.web.controllers.AbstractController;

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

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Integer id, HttpServletRequest request) {
		int moduleId = (id == null ? 0 : id);

		List<OperationPo> list = this.operationService.getOperationByModuleId(moduleId);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", list.size());
		modelMap.put("rows", list);

		return modelMap;
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
}