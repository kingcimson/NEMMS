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
import com.wellheadstone.nemms.po.NmsStatusPo;
import com.wellheadstone.nemms.service.NmsStatusService;
import com.wellheadstone.nemms.web.DataGridPager;

@Controller
@RequestMapping(value = "/device/nmsstatus")
public class NmsStatusController extends AbstractController {

	@Resource
	private NmsStatusService nmsStatusService;

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(DataGridPager pager, HttpServletRequest request) {
		pager.setDefaultSort(NmsStatusPo.UpdateTime);
		PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(), pager.getRows(), pager.getSort(),
				pager.getOrder());
		List<NmsStatusPo> list = this.nmsStatusService.getByPage(pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public ParamJsonResult<NmsStatusPo> add(NmsStatusPo po, HttpServletRequest request) {
		ParamJsonResult<NmsStatusPo> result = new ParamJsonResult<NmsStatusPo>(false, "");
		try {
			this.nmsStatusService.add(po);
			this.setSuccessResult(result, "创建北向接口状态信息成功!");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public ParamJsonResult<NmsStatusPo> edit(NmsStatusPo po, HttpServletRequest request) {
		ParamJsonResult<NmsStatusPo> result = new ParamJsonResult<NmsStatusPo>(false, "更新北向接口状态信息失败!");
		try {
			this.nmsStatusService.edit(po, po.getId());
			this.setSuccessResult(result, "更新北向接口状态信息成功！");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public ParamJsonResult<NmsStatusPo> remove(Integer id, HttpServletRequest request) {
		ParamJsonResult<NmsStatusPo> result = new ParamJsonResult<NmsStatusPo>(false, "");
		try {
			this.nmsStatusService.remove(id);
			result.setSuccess(this.nmsStatusService.remove(id));
			this.setSuccessResult(result, "删除北向接口状态记录成功!");
			return result;
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}
}
