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
import com.wellheadstone.nemms.po.ConfigSettingsPo;
import com.wellheadstone.nemms.service.ConfigSettingsService;
import com.wellheadstone.nemms.web.DataGridPager;

@Controller
@RequestMapping(value = "/system/settings")
public class ConfigSettingsController extends AbstractController {

	@Resource
	private ConfigSettingsService settingsService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(HttpServletRequest req) {
		return "system/settings";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(ConfigSettingsPo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(),
				pager.getOrder());
		List<ConfigSettingsPo> list = this.settingsService.getByPage(pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/find")
	@ResponseBody
	public Map<String, Object> find(DataGridPager pager, String fieldName, String keyword, HttpServletRequest request) {
		pager.setDefaultSort(ConfigSettingsPo.CreateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(),
				pager.getRows(), pager.getSort(), pager.getOrder());
		List<ConfigSettingsPo> list = this.settingsService.getByKeyword(pageInfo, fieldName, keyword);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);
		return modelMap;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public ParamJsonResult<ConfigSettingsPo> add(ConfigSettingsPo po, HttpServletRequest request) {
		ParamJsonResult<ConfigSettingsPo> result = new ParamJsonResult<ConfigSettingsPo>(false, "");
		try {
			this.settingsService.add(po);
			this.setSuccessResult(result, "创建系统配置信息成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public ParamJsonResult<ConfigSettingsPo> edit(ConfigSettingsPo po, HttpServletRequest request) {
		ParamJsonResult<ConfigSettingsPo> result = new ParamJsonResult<ConfigSettingsPo>(false, "更新系统配置信息失败!");
		try {
			this.settingsService.edit(po, po.getId());
			this.setSuccessResult(result, "更新系统配置信息成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public ParamJsonResult<ConfigSettingsPo> remove(Integer id, HttpServletRequest request) {
		ParamJsonResult<ConfigSettingsPo> result = new ParamJsonResult<ConfigSettingsPo>(false, "");
		try {
			this.settingsService.remove(id);
			result.setSuccess(this.settingsService.remove(id));
			this.setSuccessResult(result, "删除系统配置记录成功!");
			return result;
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/getSettings")
	@ResponseBody
	public Map<String, String> getSettings(HttpServletRequest request) {
		return this.settingsService.getSettings();
	}
}