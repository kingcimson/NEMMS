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
import com.wellheadstone.nemms.web.DataGridPager;
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

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> getEvents(DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(EventPo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(), pager.getOrder());
		List<EventPo> list = this.eventService.getByPage(pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/find")
	@ResponseBody
	public Map<String, Object> getEventsByKeyword(String fieldName, String keyword, DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(EventPo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(), pager.getOrder());
		List<EventPo> list = this.eventService.getEventsByKeyword(pageInfo, fieldName, keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);
		return modelMap;
	}

	@RequestMapping(value = "/remove")
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