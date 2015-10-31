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
import com.wellheadstone.nemms.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.service.DeviceConnInfoService;
import com.wellheadstone.nemms.web.DataGridPager;

@Controller
@RequestMapping(value = "/device/connInfo")
public class DeviceConnInfoController extends AbstractController {

	@Resource
	private DeviceConnInfoService deviceConnInfoService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(HttpServletRequest req) {
		return "device/connInfo";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(DeviceConnInfoPo.UpdateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(),
				pager.getOrder());
		List<DeviceConnInfoPo> list = this.deviceConnInfoService.getByPage(pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public ParamJsonResult<DeviceConnInfoPo> add(DeviceConnInfoPo po, HttpServletRequest request) {
		ParamJsonResult<DeviceConnInfoPo> result = new ParamJsonResult<DeviceConnInfoPo>(false, "");
		try {
			this.deviceConnInfoService.add(po);
			this.setSuccessResult(result, "创建设备连接信息成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public ParamJsonResult<DeviceConnInfoPo> edit(DeviceConnInfoPo po, HttpServletRequest request) {
		ParamJsonResult<DeviceConnInfoPo> result = new ParamJsonResult<DeviceConnInfoPo>(false, "更新设备连接信息失败!");
		try {
			this.deviceConnInfoService.edit(po, po.getId());
			this.setSuccessResult(result, "更新设备连接信息成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public ParamJsonResult<DeviceConnInfoPo> remove(Integer id, HttpServletRequest request) {
		ParamJsonResult<DeviceConnInfoPo> result = new ParamJsonResult<DeviceConnInfoPo>(false, "");
		try {
			this.deviceConnInfoService.remove(id);
			result.setSuccess(this.deviceConnInfoService.remove(id));
			this.setSuccessResult(result, "删除设备连接记录成功!");
			return result;
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/get")
	@ResponseBody
	public ParamJsonResult<DeviceConnInfoPo> get(String siteUid, HttpServletRequest request) {
		ParamJsonResult<DeviceConnInfoPo> result = new ParamJsonResult<DeviceConnInfoPo>(false, "");
		try {
			result.setData(this.deviceConnInfoService.getBySiteUid(siteUid));
			result.setSuccess(true);
			this.setSuccessResult(result, "获取设备连接记录成功!");
			return result;
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}
}
