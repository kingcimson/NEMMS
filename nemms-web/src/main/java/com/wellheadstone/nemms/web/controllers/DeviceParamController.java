package com.wellheadstone.nemms.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.po.DeviceParamPo;
import com.wellheadstone.nemms.service.DeviceParamService;
import com.wellheadstone.nemms.web.DataGridPager;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/device/param")
public class DeviceParamController extends AbstractController {

	@Resource
	private DeviceParamService deviceParamService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(HttpServletRequest req) {
		return "device/param";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(@CurrentUser UserPo loginUser, DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(DeviceParamPo.Id);
		pager.setSort(DeviceParamPo.getColumnName(pager.getSort()));
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(), pager.getOrder());
		List<DeviceParamPo> list = this.deviceParamService.getParams(pageInfo, loginUser);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/find")
	@ResponseBody
	public Map<String, Object> getParamsByKeyword(@CurrentUser UserPo loginUser,
			String categoryId, String fieldName, String keyword, DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(DeviceParamPo.Id);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(), pager.getOrder());
		List<DeviceParamPo> list = this.deviceParamService.getParamsByKeyword(pageInfo, loginUser, categoryId, fieldName, keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/add")
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

	@RequestMapping(value = "/remove")
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

	@RequestMapping(value = "/edit")
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
