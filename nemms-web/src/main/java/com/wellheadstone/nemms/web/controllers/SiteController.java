package com.wellheadstone.nemms.web.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/site")
public class SiteController extends AbstractController {

	@RequestMapping(value = { "", "/", "/index" })
	public String index(@CurrentUser UserPo loginUser, Model model, HttpServletRequest req) {
		return "site/index";
	}

}
