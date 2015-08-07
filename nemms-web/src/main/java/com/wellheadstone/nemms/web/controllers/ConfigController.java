package com.wellheadstone.nemms.web.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.common.viewmodel.TreeNode;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.po.ConfigDictPo;
import com.wellheadstone.nemms.po.SitePo;
import com.wellheadstone.nemms.service.ConfigDictService;
import com.wellheadstone.nemms.web.DataGridPager;

@Controller
@RequestMapping(value = "/system/config")
public class ConfigController extends AbstractController {
	@Resource
	private ConfigDictService configDictService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index() {
		return "system/config";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public List<ConfigDictPo> list(Integer id) {
		if (id == null)
			id = 0;
		return this.configDictService.getDao().queryBy(id);
	}

	@RequestMapping(value = "/listChildren")
	@ResponseBody
	public List<TreeNode<ConfigDictPo>> listChildNodes(Integer id) {
		if (id == null)
			id = 0;

		List<ConfigDictPo> configDicts = this.configDictService.getDao().queryBy(id);
		List<TreeNode<ConfigDictPo>> treeNodes = new ArrayList<TreeNode<ConfigDictPo>>(configDicts.size());

		for (ConfigDictPo po : configDicts) {
			String configId = Integer.toString(po.getId());
			String pid = Integer.toString(po.getPid());
			String text = po.getName();
			String state = po.getHasChild() > 0 ? "closed" : "open";
			String icon = po.getHasChild() > 0 ? "icon-dict2" : "icon-item1";
			TreeNode<ConfigDictPo> vmMode = new TreeNode<ConfigDictPo>(configId, pid, text, state, icon, false, po);
			treeNodes.add(vmMode);
		}

		return treeNodes;
	}

	@RequestMapping(value = "/find")
	@ResponseBody
	public Map<String, Object> find(DataGridPager pager, String fieldName, String keyword,
			HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>(2);

		try {
			pager.setDefaultSort(SitePo.CreateTime);
			PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(),
					pager.getRows(), pager.getSort(), pager.getOrder());
			List<ConfigDictPo> list = this.configDictService.findByKeyword(pageInfo, fieldName, keyword);
			modelMap.put("total", pageInfo.getTotals());
			modelMap.put("rows", list);
		} catch (Exception ex) {
			this.logException(ex);
		}
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

	@RequestMapping(value = "/getDepth1Items")
	@ResponseBody
	public List<ConfigDictPo> getDepth1Items(String parentKey, HttpServletRequest request) {
		return this.configDictService.getDepth1Items(parentKey);
	}

	@RequestMapping(value = "/getDepth2Items")
	@ResponseBody
	public Map<String, List<ConfigDictPo>> getDepth2Items(String parentKey, HttpServletRequest request) {
		return this.configDictService.getDepth2Items(parentKey);
	}
}