package com.wellheadstone.nemms.web.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wellheadstone.nemms.po.UserPo;
import com.wellheadstone.nemms.web.CurrentUser;

@Controller
@RequestMapping(value = "/comunication")
public class ComunicationController extends AbstractController {

	@RequestMapping(value = { "", "/", "/index" })
	public String index(@CurrentUser UserPo loginUser, Model model, HttpServletRequest req) {
		return "comunication/index";
	}

}
