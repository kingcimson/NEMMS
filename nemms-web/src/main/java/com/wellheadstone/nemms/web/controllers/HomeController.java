package com.wellheadstone.nemms.web.controllers;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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
		model.addAttribute("menus", this.getMenus(modules, req.getContextPath()));
		return "home/index";
	}

	private String getMenus(List<ModulePo> modules, String contextPath) {
		List<ModulePo> rootModules = modules.stream()
				.filter(x -> x.getParentId() == 0 && x.getStatus() == 1)
				.sorted((x, y) -> x.getSequence() > y.getSequence() ? 1 : -1)
				.collect(Collectors.toList());

		StringBuilder menuBuilder = new StringBuilder();
		for (int index = 0; index < rootModules.size(); index++) {
			ModulePo module = rootModules.get(index);
			String url = module.getLinkType() == 1 ? module.getUrl() : String.format("%s/%s", contextPath,
					module.getUrl());
			String target = StringUtils.isBlank(module.getTarget()) ? "" : String.format("target=\"%s\"",
					module.getTarget());
			menuBuilder.append(String.format("<li class=\"menu%s\">\r\n", index == 0 ? " menu-dashborad" : ""));
			menuBuilder.append(String.format("	<a href=\"%s\" %s title=\"裕源大通网元监控与管理系统-%s\">\r\n", url, target,
					module.getName()));
			menuBuilder.append(String.format("		<i class=\"%s\"></i>\r\n", module.getIcon()));
			menuBuilder.append(String.format("		<span class=\"menu-item-parent\">%s</span>\r\n", module.getName()));
			menuBuilder.append("	</a>\r\n");
			this.getChildMenus(modules, module.getModuleId(), contextPath, menuBuilder);
			menuBuilder.append("</li>\r\n");
		}
		return menuBuilder.toString();
	}

	private void getChildMenus(List<ModulePo> modules, int parentId, String contextPath, StringBuilder menuBuilder) {
		List<ModulePo> childModules = modules.stream()
				.filter(x -> x.getParentId() == parentId && x.getStatus() == 1)
				.sorted((x, y) -> x.getSequence() > y.getSequence() ? 1 : -1)
				.collect(Collectors.toList());

		if (childModules.size() == 0) {
			return;
		}
		menuBuilder.append("<ul>\r\n");
		for (ModulePo module : childModules) {
			String url = module.getLinkType() == 1 ? module.getUrl() : String.format("%s/%s", contextPath,
					module.getUrl());
			String target = StringUtils.isBlank(module.getTarget()) ? "" : String.format("target=\"%s\"",
					module.getTarget());

			if (module.isLeaf()) {
				menuBuilder.append(String.format(
						"<li><a href=\"%1$s\" %2$s title=\"裕源大通网元监控与管理系统-%3$s\">%3$s</a></li>\r\n", url, target,
						module.getName()));
			}
			else {
				menuBuilder.append("<li class=\"menu\">\r\n");
				menuBuilder.append(String.format("	<a class=\"top-level-menu\" href=\"%s\" %s>\r\n", url, target));
				menuBuilder.append(String.format("		<i class=\"%s\"></i>\r\n", module.getIcon()));
				menuBuilder.append(String.format("		<span class=\"menu-item-parent\">%s</span>\r\n", module.getName()));
				menuBuilder.append("	</a>\r\n");
				this.getChildMenus(modules, module.getModuleId(), contextPath, menuBuilder);
				menuBuilder.append("</li>\r\n");
			}
		}
		menuBuilder.append("</ul>\r\n");
	}
}
