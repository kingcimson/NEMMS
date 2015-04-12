package com.wellheadstone.nemms.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/error")
public class ErrorController extends AbstractController {

	@RequestMapping(value = { "/404" })
	public String error404() {
		return "/error/404";
	}

	@RequestMapping(value = "/405")
	public String error405() {
		return "/error/405";
	}

	@RequestMapping(value = "/500")
	public String error500() {
		return "/error/500";
	}

	@RequestMapping(value = "/unauthorized")
	public String unauthorized() {
		return "/error/unauthorized";
	}
}
