package com.wellheadstone.nemms.web.controllers;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.lf5.LogLevel;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.wellheadstone.nemms.common.viewmodel.JsonResult;
import com.wellheadstone.nemms.membership.service.EventService;

@Controller
public abstract class AbstractController {
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private EventService eventService;

	protected AbstractController() {
	}

	protected String getSource() {
		return this.getClass().getName();
	}

	protected void setSuccessResult(JsonResult result, String msg) {
		result.setSuccess(true);
		result.setMsg(StringUtils.isBlank(msg) ? "操作成功！" : msg);
		this.logEvent(result.getMsg());
	}

	protected void setFailureResult(JsonResult result, String msg) {
		result.setSuccess(false);
		result.setMsg(StringUtils.isBlank(msg) ? "操作失败！" : msg);
		this.logEvent(result.getMsg());
	}

	protected void setExceptionResult(JsonResult result, Exception ex) {
		result.setSuccess(false);
		result.setMsg(this.logger.isDebugEnabled() ?
				String.format("系统异常, 原因:%s", ex.getMessage()) :
				(StringUtils.isBlank(result.getMsg()) ? "操作失败！" : result.getMsg()));
		this.logException(ex);
		this.logEvent(ex);
	}

	protected void logException(Exception ex) {
		this.logException("系统异常", ex);
	}

	protected void logException(String msg, Exception ex) {
		logger.error(msg, ex);
	}

	protected void logEvent(Exception ex) {
		try (StringWriter out = new StringWriter()) {
			PrintWriter printWriter = new PrintWriter(out);
			ex.printStackTrace(printWriter);
			this.logEvent(out.toString(), LogLevel.ERROR);
			printWriter.close();
		} catch (Exception e) {
			this.logException(e);
		}
	}

	protected void logEvent(String message) {
		this.logEvent(message, LogLevel.INFO);
	}

	protected void logEvent(String message, LogLevel level) {
		this.eventService.append(this.getSource(), message, -1, this.getCurrentAccount(), level);
	}

	protected void logExceptionEvent(Exception ex) {
		this.logExceptionEvent("", ex);
	}

	protected void logExceptionEvent(String msg, Exception ex) {
		this.logException(msg, ex);
		this.logEvent(ex);
	}

	protected String getCurrentAccount() {
		Object principal = SecurityUtils.getSubject().getPrincipal();
		return principal == null ? "anonymous" : (String) principal;
	}
}
