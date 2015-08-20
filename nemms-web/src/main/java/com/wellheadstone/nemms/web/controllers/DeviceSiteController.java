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
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.common.viewmodel.TreeNode;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.po.DeviceSiteParamPo;
import com.wellheadstone.nemms.po.DeviceSitePo;
import com.wellheadstone.nemms.service.DeviceDataService;
import com.wellheadstone.nemms.service.DeviceSiteService;
import com.wellheadstone.nemms.service.DeviceSiteTreeService;
import com.wellheadstone.nemms.web.DataGridPager;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/device/site")
public class DeviceSiteController extends AbstractController {
	@Resource
	private DeviceSiteService siteService;
	@Resource
	private DeviceSiteTreeService siteTreeService;
	@Resource
	private DeviceDataService deviceMonitorService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(HttpServletRequest req) {
		return "device/site";
	}

	@RequestMapping(value = "/listChildNodes")
	@ResponseBody
	public List<TreeNode<DeviceSitePo>> listChildNodes(Integer id, HttpServletRequest request) {
		if (id == null) {
			id = 0;
		}

		List<TreeNode<DeviceSitePo>> treeNodes = new ArrayList<TreeNode<DeviceSitePo>>();
		try {
			List<DeviceSitePo> sitePos = this.siteService.getByPid(id);
			for (DeviceSitePo po : sitePos) {
				treeNodes.add(this.createTreeNode(po));
			}
		} catch (Exception ex) {
			this.logException(ex);
		}
		return treeNodes;
	}

	@RequestMapping(value = "/addSite")
	@ResponseBody
	public ParamJsonResult<List<TreeNode<DeviceSitePo>>> addSite(DeviceSitePo po, @CurrentUser UserPo loginUser,
			HttpServletRequest request) {
		ParamJsonResult<List<TreeNode<DeviceSitePo>>> result =
				new ParamJsonResult<List<TreeNode<DeviceSitePo>>>(false, "");

		try {
			po.setCreateUser(loginUser.getAccount());
			po.setId(this.siteService.addSite(po));
			po = this.siteService.getById(po.getId());
			List<TreeNode<DeviceSitePo>> nodes = new ArrayList<TreeNode<DeviceSitePo>>();
			TreeNode<DeviceSitePo> treeNode = this.createTreeNode(po);
			nodes.add(treeNode);
			result.setData(nodes);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/editSite")
	@ResponseBody
	public ParamJsonResult<TreeNode<DeviceSitePo>> editSite(DeviceSitePo po, HttpServletRequest request) {
		ParamJsonResult<TreeNode<DeviceSitePo>> result = new ParamJsonResult<TreeNode<DeviceSitePo>>(false, "");

		try {
			this.siteService.editSite(po);
			po = this.siteService.getById(po.getId());
			TreeNode<DeviceSitePo> treeNode = this.createTreeNode(po);
			result.setData(treeNode);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/addDevice")
	@ResponseBody
	public ParamJsonResult<TreeNode<DeviceSitePo>> addDevice(DeviceSitePo po, @CurrentUser UserPo loginUser,
			HttpServletRequest request) {
		ParamJsonResult<TreeNode<DeviceSitePo>> result = new ParamJsonResult<TreeNode<DeviceSitePo>>(false, "");

		try {
			DeviceSitePo parentPo = this.siteService.getById(po.getPid());
			po.setUid(parentPo.getUid() + po.getUid());
			po.setDeviceType(parentPo.getDeviceType());
			po.setApProtocol(parentPo.getApProtocol());
			po.setMcpProtocol(parentPo.getMcpProtocol());
			po.setProtocol(parentPo.getProtocol());
			po.setIpAddr(parentPo.getIpAddr());
			po.setPort(parentPo.getPort());
			po.setCreateUser(loginUser.getAccount());
			po.setId(this.siteService.addSite(po));
			po = this.siteService.getById(po.getId());
			TreeNode<DeviceSitePo> treeNode = this.createTreeNode(po);
			result.setData(treeNode);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/editDevice")
	@ResponseBody
	public ParamJsonResult<TreeNode<DeviceSitePo>> editDevice(DeviceSitePo po, HttpServletRequest request) {
		ParamJsonResult<TreeNode<DeviceSitePo>> result = new ParamJsonResult<TreeNode<DeviceSitePo>>(false, "");

		try {
			this.siteService.editDevice(po);
			TreeNode<DeviceSitePo> treeNode = this.createTreeNode(this.siteService.getById(po.getId()));
			result.setData(treeNode);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/remove")
	@ResponseBody
	public JsonResult remove(Integer id, Integer pid, HttpServletRequest request) {
		JsonResult result = new JsonResult(false, "");

		try {
			if (!this.siteService.hasChild(id)) {
				this.siteService.remove(id, pid);
				this.setSuccessResult(result, "");
			} else {
				this.setFailureResult(result, "操作失败！当前节点还有子节点，请先删除子节点！");
			}
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/search")
	@ResponseBody
	public Map<String, Object> search(DataGridPager pager, String fieldName, String keyword,
			HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>(2);

		try {
			pager.setDefaultSort(DeviceSitePo.CreateTime);
			PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(),
					pager.getRows(), pager.getSort(), pager.getOrder());
			List<DeviceSitePo> list = this.siteService.getByPage(fieldName, keyword, pageInfo);
			modelMap.put("total", pageInfo.getTotals());
			modelMap.put("rows", list);
		} catch (Exception ex) {
			this.logException(ex);
		}
		return modelMap;
	}

	@RequestMapping(value = "/query")
	@ResponseBody
	public Map<String, Object> query(Integer page, Integer rows, HttpServletRequest request) {
		if (page == null)
			page = 1;
		if (rows == null)
			rows = 30;

		PageInfo pageInfo = new PageInfo((page - 1) * rows, rows);
		List<DeviceSitePo> list = this.siteService.getByPage(pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
	}

	@RequestMapping(value = "/queryAllValues")
	@ResponseBody
	public Map<Integer, List<DeviceSiteParamPo>> queryAllValues(String siteUid, @CurrentUser UserPo loginUser,
			HttpServletRequest request) {
		siteUid = siteUid == null ? "" : siteUid;
		return this.deviceMonitorService.queryAllValuesForMap(siteUid);
	}

	@RequestMapping(value = "/dragTreeNode")
	@ResponseBody
	public JsonResult dragTreeNode(Integer sourceId, Integer targetId, Integer sourcePid, HttpServletRequest request) {
		JsonResult result = new JsonResult(false, "");

		try {
			this.siteTreeService.dragNode(sourceId, targetId, sourcePid);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/cloneTreeNode")
	@ResponseBody
	public JsonResult cloneTreeNode(Integer sourceId, Integer targetId, Integer dsId, HttpServletRequest request) {
		JsonResult result = new JsonResult(false, "");

		if (sourceId == null || sourceId <= 0 || targetId == null || targetId < 0) {
			result.setMsg("提交的参数数据出错！");
			return result;
		}

		if (dsId == null) {
			dsId = 0;
		}

		try {
			this.siteTreeService.cloneNode(sourceId, targetId, dsId);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	private TreeNode<DeviceSitePo> createTreeNode(DeviceSitePo po) {
		String id = Integer.toString(po.getId());
		String pid = Integer.toString(po.getPid());
		String text = po.getName();
		String state = po.getHasChild() ? "closed" : "open";
		String icon = po.getPid() == 0 ? "icon-site" : "icon-device";
		return new TreeNode<DeviceSitePo>(id, pid, text, state, icon, false, po);
	}

	@RequestMapping(value = "/listAllChildNodes")
	@ResponseBody
	public List<TreeNode<DeviceSitePo>> listAllChildNodes() {
		List<TreeNode<DeviceSitePo>> roots = new ArrayList<TreeNode<DeviceSitePo>>();

		try {
			List<DeviceSitePo> pos = this.siteService.getAll();
			for (DeviceSitePo po : pos) {
				if (po.getPid() == 0) {
					String configId = Integer.toString(po.getId());
					String text = po.getName();
					String state = po.getHasChild() ? "closed" : "open";
					TreeNode<DeviceSitePo> parentNode = new TreeNode<DeviceSitePo>(configId, text, state, null);
					this.loadChildNodes(pos, parentNode);
					roots.add(parentNode);
				}
			}
		} catch (Exception ex) {
			this.logException(ex);
		}

		return roots;
	}

	private void loadChildNodes(List<DeviceSitePo> pos, TreeNode<DeviceSitePo> parentNode) {
		int id = Integer.valueOf(parentNode.getId());
		for (DeviceSitePo po : pos) {
			if (po.getPid() == id) {
				String configId = Integer.toString(po.getId());
				String text = po.getName();
				String state = po.getHasChild() ? "closed" : "open";
				TreeNode<DeviceSitePo> childNode = new TreeNode<DeviceSitePo>(configId, text, state, null);
				this.loadChildNodes(pos, childNode);
				parentNode.getChildren().add(childNode);
			}
		}
	}
}
