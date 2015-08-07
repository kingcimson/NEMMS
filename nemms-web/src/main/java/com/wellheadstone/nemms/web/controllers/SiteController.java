package com.wellheadstone.nemms.web.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.common.viewmodel.ParamJsonResult;
import com.wellheadstone.nemms.common.viewmodel.TreeNode;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.po.SitePo;
import com.wellheadstone.nemms.service.SiteService;
import com.wellheadstone.nemms.service.SiteTreeService;
import com.wellheadstone.nemms.web.DataGridPager;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/site")
public class SiteController extends AbstractController {
	@Resource
	private SiteService siteService;
	@Resource
	private SiteTreeService siteTreeService;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(@CurrentUser UserPo loginUser, Model model, HttpServletRequest req) {
		return "site/index";
	}

	@RequestMapping(value = "/listChildNodes")
	@ResponseBody
	public List<TreeNode<SitePo>> listChildNodes(Integer id, HttpServletRequest request) {
		if (id == null) {
			id = 0;
		}

		List<TreeNode<SitePo>> treeNodes = new ArrayList<TreeNode<SitePo>>();
		try {
			List<SitePo> sitePos = this.siteService.getByPid(id);
			for (SitePo po : sitePos) {
				treeNodes.add(this.createTreeNode(po));
			}
		} catch (Exception ex) {
			this.logException(ex);
		}
		return treeNodes;
	}

	@RequestMapping(value = "/addSite")
	@ResponseBody
	public ParamJsonResult<List<TreeNode<SitePo>>> addSite(SitePo po, @CurrentUser UserPo loginUser,
			HttpServletRequest request) {
		ParamJsonResult<List<TreeNode<SitePo>>> result =
				new ParamJsonResult<List<TreeNode<SitePo>>>(false, "");

		try {
			po.setCreateUser(loginUser.getAccount());
			po.setId(this.siteService.addSite(po));
			po = this.siteService.getById(po.getId());
			List<TreeNode<SitePo>> nodes = new ArrayList<TreeNode<SitePo>>();
			TreeNode<SitePo> treeNode = this.createTreeNode(po);
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
	public ParamJsonResult<TreeNode<SitePo>> editSite(SitePo po, HttpServletRequest request) {
		ParamJsonResult<TreeNode<SitePo>> result = new ParamJsonResult<TreeNode<SitePo>>(false, "");

		try {
			this.siteService.editSite(po);
			po = this.siteService.getById(po.getId());
			TreeNode<SitePo> treeNode = this.createTreeNode(po);
			result.setData(treeNode);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}
		return result;
	}

	@RequestMapping(value = "/addDevice")
	@ResponseBody
	public ParamJsonResult<List<TreeNode<SitePo>>> addDevice(SitePo po, @CurrentUser UserPo loginUser,
			HttpServletRequest request) {
		ParamJsonResult<List<TreeNode<SitePo>>> result = new ParamJsonResult<List<TreeNode<SitePo>>>(false, "");

		try {
			po.setCreateUser(loginUser.getAccount());
			po.setId(this.siteService.addSite(po));
			po = this.siteService.getById(po.getId());
			List<TreeNode<SitePo>> nodes = new ArrayList<TreeNode<SitePo>>();
			TreeNode<SitePo> treeNode = this.createTreeNode(po);
			nodes.add(treeNode);
			result.setData(nodes);
			this.setSuccessResult(result, "");
		} catch (Exception ex) {
			this.setExceptionResult(result, ex);
		}

		return result;
	}

	@RequestMapping(value = "/editDevice")
	@ResponseBody
	public ParamJsonResult<TreeNode<SitePo>> editDevice(SitePo po, HttpServletRequest request) {
		ParamJsonResult<TreeNode<SitePo>> result = new ParamJsonResult<TreeNode<SitePo>>(false, "");

		try {
			this.siteService.editDevice(po);
			TreeNode<SitePo> treeNode = this.createTreeNode(this.siteService.getById(po.getId()));
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
			pager.setDefaultSort(SitePo.CreateTime);
			PageInfo pageInfo = new PageInfo((pager.getPage() - 1) * pager.getRows(),
					pager.getRows(), pager.getSort(), pager.getOrder());
			List<SitePo> list = this.siteService.getByPage(fieldName, keyword, pageInfo);
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
		List<SitePo> list = this.siteService.getByPage(pageInfo);
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("total", pageInfo.getTotals());
		modelMap.put("rows", list);

		return modelMap;
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

	private TreeNode<SitePo> createTreeNode(SitePo po) {
		String id = Integer.toString(po.getId());
		String pid = Integer.toString(po.getPid());
		String text = po.getName();
		String state = po.getHasChild() ? "closed" : "open";
		String icon = po.getHasChild() ? "icon-site" : "icon-device";
		return new TreeNode<SitePo>(id, pid, text, state, icon, false, po);
	}

	@RequestMapping(value = "/listAllChildNodes")
	@ResponseBody
	public List<TreeNode<SitePo>> listAllChildNodes() {
		List<TreeNode<SitePo>> roots = new ArrayList<TreeNode<SitePo>>();

		try {
			List<SitePo> pos = this.siteService.getAll();
			for (SitePo po : pos) {
				if (po.getPid() == 0) {
					String configId = Integer.toString(po.getId());
					String text = po.getName();
					String state = po.getHasChild() ? "closed" : "open";
					TreeNode<SitePo> parentNode = new TreeNode<SitePo>(configId, text, state, null);
					this.loadChildNodes(pos, parentNode);
					roots.add(parentNode);
				}
			}
		} catch (Exception ex) {
			this.logException(ex);
		}

		return roots;
	}

	private void loadChildNodes(List<SitePo> pos, TreeNode<SitePo> parentNode) {
		int id = Integer.valueOf(parentNode.getId());
		for (SitePo po : pos) {
			if (po.getPid() == id) {
				String configId = Integer.toString(po.getId());
				String text = po.getName();
				String state = po.getHasChild() ? "closed" : "open";
				TreeNode<SitePo> childNode = new TreeNode<SitePo>(configId, text, state, null);
				this.loadChildNodes(pos, childNode);
				parentNode.getChildren().add(childNode);
			}
		}
	}
}
