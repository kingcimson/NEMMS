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
import com.wellheadstone.nemms.po.DeviceSchedulePo;
import com.wellheadstone.nemms.service.DeviceScheduleService;
import com.wellheadstone.nemms.web.DataGridPager;

@Controller
@RequestMapping(value = "/device/schedule")
public class DeviceScheduleController extends AbstractController {

	@Resource
	private DeviceScheduleService deviceScheduleService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(HttpServletRequest req) {
		return "device/schedule";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(DeviceSchedulePo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(), pager.getOrder());
		List<DeviceSchedulePo> list = this.deviceScheduleService.getByPage(pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public ParamJsonResult<DeviceSchedulePo> add(DeviceSchedulePo po, HttpServletRequest request) {
		ParamJsonResult<DeviceSchedulePo> result = new ParamJsonResult<DeviceSchedulePo>(false, "");
		try {
			this.deviceScheduleService.add(po);
			this.setSuccessResult(result, "创建定时任务成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public ParamJsonResult<DeviceSchedulePo> edit(DeviceSchedulePo po, HttpServletRequest request) {
		ParamJsonResult<DeviceSchedulePo> result = new ParamJsonResult<DeviceSchedulePo>(false, "更新定时任务失败!");
		try {
			this.deviceScheduleService.edit(po, po.getId());
			this.setSuccessResult(result, "更新定时任务成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public ParamJsonResult<DeviceSchedulePo> remove(Integer id, HttpServletRequest request) {
		ParamJsonResult<DeviceSchedulePo> result = new ParamJsonResult<DeviceSchedulePo>(false, "");
		try {
			this.deviceScheduleService.remove(id);
			result.setSuccess(this.deviceScheduleService.remove(id));
			this.setSuccessResult(result, "删除定时任务成功!");
			return result;
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}
}
