package com.wellheadstone.nemms.web.controllers;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wellheadstone.nemms.membership.MembershipFacade;
import com.wellheadstone.nemms.membership.po.ModulePo;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/home")
public class HomeController extends AbstractController {
	@Resource
	private MembershipFacade membershipFacade;

	@RequestMapping(value = { "", "/", "/index" })
	public String index(@CurrentUser UserPo loginUser, Model model, HttpServletRequest req) {
		List<ModulePo> modules = membershipFacade.getModules(loginUser.getRoles());
		model.addAttribute("menus", this.buildMenuItems(modules, req.getContextPath()));
		return "home/index";
	}

	private String buildMenuItems(List<ModulePo> modules, String contextPath) {
		List<ModulePo> rootModules = modules.stream()
				.filter(x -> x.getParentId() == 0 && x.getStatus() == 1)
				.sorted((x, y) -> x.getSequence() > y.getSequence() ? 1 : -1)
				.collect(Collectors.toList());

		StringBuilder menuBuilder = new StringBuilder();
		menuBuilder.append("<div style=\"padding: 2px 5px;\">\r\n");
		for (ModulePo module : rootModules) {
			String url = module.getLinkType() == 1 ? module.getUrl() : String.format("%s/%s", contextPath, module.getUrl());
			String subMenu = module.isLeaf() ? "plain:true" : String.format("menu:'#mm%1$s'", module.getModuleId());
			String button = module.isLeaf() ? "easyui-linkbutton" : "easyui-splitbutton";
			String onclick = module.isLeaf() ?
					String.format("onclick=\"addTab('%1$s','%2$s','%3$s')\"", module.getName(), url, module.getIcon()) : "";
			menuBuilder.append(String.format("<a href=\"#\" class=\"%1$s\" data-options=\"%2$s,iconCls:'%3$s'\" %4$s>%5$s</a>\r\n",
					button, subMenu, module.getIcon(), onclick, module.getName()));
		}
		menuBuilder.append(String.format(
				"<a href=\"%s/logout\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:'icon-cancel'\">退出</a>\r\n", contextPath));
		menuBuilder.append("</div>\r\n");

		for (ModulePo module : rootModules) {
			this.buildMenuItems(modules, module.getModuleId(), contextPath, menuBuilder);
		}
		return menuBuilder.toString();
	}

	private void buildMenuItems(List<ModulePo> modules, int parentId, String contextPath, StringBuilder menuBuilder) {
		List<ModulePo> childModules = modules.stream()
				.filter(x -> x.getParentId() == parentId && x.getStatus() == 1)
				.sorted((x, y) -> x.getSequence() > y.getSequence() ? 1 : -1)
				.collect(Collectors.toList());

		if (childModules.size() == 0) {
			return;
		}

		menuBuilder.append(String.format("<div id=\"mm%s\" style=\"width: 150px;\">\r\n", parentId));
		for (ModulePo module : childModules) {
			String url = module.getLinkType() == 1 ? module.getUrl() : String.format("%s/%s", contextPath, module.getUrl());
			menuBuilder.append(String.format("<div data-options=\"iconCls:'%1$s'\" "
					+ "onclick=\"addTab('%2$s','%3$s','%1$s')\">%2$s</div>\r\n", module.getIcon(), module.getName(), url));
			this.buildMenuItems(modules, module.getModuleId(), contextPath, menuBuilder);
		}
		menuBuilder.append("</div>\r\n");
	}
}
