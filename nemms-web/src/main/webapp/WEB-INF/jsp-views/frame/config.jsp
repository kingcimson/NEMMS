<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (request.getProtocol().compareTo("HTTP/1.0") == 0) {
		response.setHeader("Pragma", "no-cache");
	} else if (request.getProtocol().compareTo("HTTP/1.1") == 0) {
		response.setHeader("Cache-Control", "no-cache");
	}
	response.setDateHeader("Expires", 0);
%>