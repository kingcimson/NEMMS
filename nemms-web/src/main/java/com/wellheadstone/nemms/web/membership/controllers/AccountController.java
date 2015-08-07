package com.wellheadstone.nemms.web.membership.controllers;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.membership.MembershipFacade;
import com.wellheadstone.nemms.membership.po.UserPo;
import com.wellheadstone.nemms.web.controllers.AbstractController;
import com.wellheadstone.nemms.web.membership.CurrentUser;

@Controller
@RequestMapping(value = "/")
public class AccountController extends AbstractController {
	@Resource
	private MembershipFacade membershipFacade;

	@RequestMapping(value = { "", "/", "/index" })
	public String index() {
		return "/membership/login";
	}

	@RequestMapping(value = "/login")
	public String login() {
		return "/membership/login";
	}

	@RequestMapping(value = "/logout")
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "/membership/login";
	}

	@RequestMapping(value = "/profile")
	public String profile(@CurrentUser UserPo loginUser, Model model) {
		model.addAttribute("roleNames", membershipFacade.getRoleNames(loginUser.getRoles()));
		return "membership/profile";
	}

	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult authenticate(String account, String password, boolean rememberMe) {
		JsonResult result = new JsonResult(false, "用户名/密码错误!");
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(account, password);
			token.setRememberMe(rememberMe);
			Subject subject = SecurityUtils.getSubject();
			subject.login(token);
			this.setSuccessResult(result, "登录成功!");
		} catch (IncorrectCredentialsException | UnknownAccountException ex) {
			result.setMsg("用户名/密码错误!");
			this.setExceptionResult(result, ex);
		} catch (Exception ex) {
			if (ex.getClass().getSimpleName().equals("LockedAccountException")) {
				result.setMsg("您的账号已经被锁定!");
			} else if (ex.getClass().getSimpleName().equals("ExcessiveAttemptsException")) {
				result.setMsg("您重试密码超过20次,账号已被锁定!");
			}
			this.setExceptionResult(result, ex);
		}
		return result;
	}
}
