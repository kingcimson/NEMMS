package com.wellheadstone.nemms.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.po.DeviceReportPo;
import com.wellheadstone.nemms.service.DeviceReportService;
import com.wellheadstone.nemms.web.DataGridPager;

@Controller
@RequestMapping(value = "/device/report")
public class DeviceReportController extends AbstractController {

	@Resource
	private DeviceReportService deviceReportService;

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(String siteUid, DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(DeviceReportPo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(),
				pager.getOrder());
		List<DeviceReportPo> list = this.deviceReportService.getByPage(siteUid, pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}
}
