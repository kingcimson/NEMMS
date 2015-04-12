package com.wellheadstone.nemms.web.exception;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class DefaultExceptionHandler {

	@ExceptionHandler({ UnauthorizedException.class })
	@ResponseStatus(HttpStatus.UNAUTHORIZED)
	public ModelAndView processUnauthenticatedException(NativeWebRequest request, UnauthorizedException ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception", ex);
		mv.setViewName("error/unauthorized");
		return mv;
	}
}
