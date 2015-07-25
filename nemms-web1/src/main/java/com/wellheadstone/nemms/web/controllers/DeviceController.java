package com.wellheadstone.nemms.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.po.DeviceParamPo;
import com.wellheadstone.nemms.service.DeviceParamService;
import com.wellheadstone.nemms.web.DataTablePageInfo;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/device")
public class DeviceController extends AbstractController {

	@Resource
	private DeviceParamService deviceParamService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(@CurrentUser UserPo loginUser, Model model, HttpServletRequest req) {
		return "device/index";
	}

	@RequestMapping(value = { "/params" })
	public String paramList(@CurrentUser UserPo loginUser, Model model, HttpServletRequest req) {
		return "device/params";
	}

	@RequestMapping(value = "/params/list")
	@ResponseBody
	public Map<String, Object> list(@CurrentUser UserPo loginUser, DataTablePageInfo dtPageInfo, HttpServletRequest request) {
		PageInfo page = dtPageInfo.toPageInfo(request.getParameterMap(), UserPo.CreateTime);
		List<DeviceParamPo> list = this.deviceParamService.getParams(page, loginUser);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("draw", dtPageInfo.getDraw());
		modelMap.put("recordsTotal", page.getTotals());
		modelMap.put("recordsFiltered", page.getTotals());
		modelMap.put("data", list);

		return modelMap;
	}

	@RequestMapping(value = "/params/find")
	@ResponseBody
	public Map<String, Object> getParamsByKeyword(@CurrentUser UserPo loginUser, DataTablePageInfo dtPageInfo,
			String categoryId, String fieldName, String keyword, HttpServletRequest request) {
		PageInfo page = dtPageInfo.toPageInfo(request.getParameterMap(), UserPo.CreateTime);
		List<DeviceParamPo> list = this.deviceParamService.getParamsByKeyword(page, loginUser, categoryId, fieldName,
				keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("draw", dtPageInfo.getDraw());
		modelMap.put("recordsTotal", page.getTotals());
		modelMap.put("recordsFiltered", page.getTotals());
		modelMap.put("data", list);
		return modelMap;
	}

	@RequestMapping(value = "/params/add")
	@ResponseBody
	public ParamJsonResult<DeviceParamPo> add(DeviceParamPo po, HttpServletRequest request) {
		ParamJsonResult<DeviceParamPo> result = new ParamJsonResult<DeviceParamPo>(false, "");
		try {
			this.deviceParamService.add(po);
			this.setSuccessResult(result, "创建设备参数成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/params/remove")
	@ResponseBody
	public ParamJsonResult<DeviceParamPo> remove(Integer id, HttpServletRequest request) {
		ParamJsonResult<DeviceParamPo> result = new ParamJsonResult<DeviceParamPo>(false, "");
		try {
			this.deviceParamService.remove(id);
			result.setSuccess(this.deviceParamService.remove(id));
			this.setSuccessResult(result, "删除设备参数成功!");
			return result;
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/params/edit")
	@ResponseBody
	public ParamJsonResult<DeviceParamPo> edit(DeviceParamPo po, HttpServletRequest request) {
		ParamJsonResult<DeviceParamPo> result = new ParamJsonResult<DeviceParamPo>(false, "更新设备参数失败!");
		try {
			this.deviceParamService.edit(po, po.getId());
			this.setSuccessResult(result, "更新设备参数成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

}
