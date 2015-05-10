package com.wellheadstone.nemms.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.util.DhtmlXTreeUtils;
import com.wellheadstone.nemms.common.viewmodel.DhtmlXTreeNode;
import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.po.ConfigDictPo;
import com.wellheadstone.nemms.service.ConfigDictService;
import com.wellheadstone.nemms.web.DataTablePageInfo;

@Controller
@RequestMapping(value = "/system/config")
public class ConfigController extends AbstractController {
	@Resource
	private ConfigDictService configDictService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index() {
		return "system/config";
	}

	@RequestMapping(value = "/getConfigItems")
	@ResponseBody
	public Map<String, List<ConfigDictPo>> getConfigItems(String parentKey, HttpServletRequest request) {
		return this.configDictService.getConfigItems(parentKey);
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(Integer id, DataTablePageInfo dtPageInfo, HttpServletRequest request) {
		int configId = (id == null ? 0 : id);
		PageInfo page = dtPageInfo.toPageInfo(request.getParameterMap(), ConfigDictPo.CreateTime);
		List<ConfigDictPo> list = this.configDictService.getConfigWithPageById(page, configId);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("draw", dtPageInfo.getDraw());
		modelMap.put("recordsTotal", page.getTotals());
		modelMap.put("recordsFiltered", page.getTotals());
		modelMap.put("data", list);

		return modelMap;
	}

	@RequestMapping(value = "/listChildren")
	@ResponseBody
	public DhtmlXTreeNode listChildNodes(Integer id) {
		if (id == null)
			id = 0;
		List<ConfigDictPo> configDicts = this.configDictService.getDao().queryBy(id);
		List<DhtmlXTreeNode> nodes = configDicts.stream().map(x -> {
			DhtmlXTreeNode node = new DhtmlXTreeNode();
			node.setId(String.valueOf(x.getId()));
			node.setChild(x.getHasChild());
			node.setText(x.getName());
			node.setTooltip(x.getName());
			node.setUserdata("meta", x);
			return node;
		}).collect(Collectors.toList());
		return DhtmlXTreeUtils.getRootNode(String.valueOf(id), nodes);
	}

	@RequestMapping(value = "/find")
	@ResponseBody
	public Map<String, Object> find(DataTablePageInfo dtPageInfo, String fieldName, String keyword,
			HttpServletRequest request) {
		PageInfo page = dtPageInfo.toPageInfo(request.getParameterMap(), ConfigDictPo.CreateTime);
		List<ConfigDictPo> list = this.configDictService.findByKeyword(page, fieldName, keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("draw", dtPageInfo.getDraw());
		modelMap.put("recordsTotal", page.getTotals());
		modelMap.put("recordsFiltered", page.getTotals());
		modelMap.put("data", list);
		return modelMap;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public JsonResult add(ConfigDictPo po, HttpServletRequest request) {
		JsonResult result = new JsonResult(false, "创建系统配置项失败！");

		try {
			this.configDictService.add(po);
			this.setSuccessResult(result, String.format("创建系统配置项[%s]成功!", po.getKey()));
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public JsonResult remove(String id) {
		JsonResult result = new JsonResult(false, String.format("删除系统配置项[%s]成功!", id));
		try {
			this.configDictService.remove(id);
			this.setSuccessResult(result, String.format("删除系统配置项[%s]成功!", id));
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public JsonResult edit(ConfigDictPo po) {
		JsonResult result = new JsonResult(false, String.format("修改系统配置项[%s]成功!", po.getKey()));
		String[] args = new String[] {
				ConfigDictPo.Key, ConfigDictPo.Name, ConfigDictPo.Value,
				ConfigDictPo.Sequence, ConfigDictPo.Comment
		};

		try {
			this.configDictService.edit(po, po.getId(), args);
			this.setSuccessResult(result, String.format("修改系统配置项[%s]成功!", po.getKey()));
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}
}