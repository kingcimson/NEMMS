package com.wellheadstone.nemms.web.membership.controllers;

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
import com.wellheadstone.nemms.membership.po.EventPo;
import com.wellheadstone.nemms.web.DataTablePageInfo;
import com.wellheadstone.nemms.web.controllers.AbstractController;

@Controller
@RequestMapping(value = "/membership/event")
public class EventController extends AbstractController {
	@Resource
	private com.wellheadstone.nemms.membership.service.EventService eventService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index() {
		return "membership/event";
	}

	@RequestMapping(value = "/getevents")
	@ResponseBody
	public Map<String, Object> getEvents(DataTablePageInfo dtPageInfo, HttpServletRequest request) {
		PageInfo page = dtPageInfo.toPageInfo(request.getParameterMap(), EventPo.CreateTime);
		List<EventPo> list = this.eventService.getByPage(page);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("draw", dtPageInfo.getDraw());
		modelMap.put("recordsTotal", page.getTotals());
		modelMap.put("recordsFiltered", page.getTotals());
		modelMap.put("data", list);

		return modelMap;
	}

	@RequestMapping(value = "/geteventsbykeyword")
	@ResponseBody
	public Map<String, Object> getEventsByKeyword(DataTablePageInfo dtPageInfo, String fieldName, String keyword,
			HttpServletRequest request) {
		PageInfo page = dtPageInfo.toPageInfo(request.getParameterMap(), EventPo.CreateTime);
		List<EventPo> list = this.eventService.getEventsByKeyword(page, fieldName, keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("draw", dtPageInfo.getDraw());
		modelMap.put("recordsTotal", page.getTotals());
		modelMap.put("recordsFiltered", page.getTotals());
		modelMap.put("data", list);
		return modelMap;
	}

	@RequestMapping(value = "/removeById")
	@ResponseBody
	public ParamJsonResult<EventPo> remove(Integer id, HttpServletRequest request) {
		ParamJsonResult<EventPo> result = new ParamJsonResult<EventPo>(false, "删除日志失败！");

		try {
			this.eventService.remove(id);
			this.setSuccessResult(result, "删除日志成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/clear")
	@ResponseBody
	public ParamJsonResult<EventPo> clear() {
		ParamJsonResult<EventPo> result = new ParamJsonResult<EventPo>(false, "清空日志失败！");
		try {
			this.eventService.getDao().deleteAll();
			this.setSuccessResult(result, "清空日志成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}
}