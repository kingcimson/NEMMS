<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (request.getProtocol().compareTo("HTTP/1.0") == 0) {
		response.setHeader("Pragma", "no-cache");
	} else if (request.getProtocol().compareTo("HTTP/1.1") == 0) {
		response.setHeader("Cache-Control", "no-cache");
	}
	response.setDateHeader("Expires", 0);
%>
<script>
	//设置jquery ajax全局设置
	$.ajaxSetup({
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		complete : function(xhr, textStatus) {
			var sessionStatus = xhr.getResponseHeader('sessionstatus');
			if (sessionStatus == 'timeout') {
				return window.location.reload();
			}
		}
	});

	//设置站点Context路径，即WebApp的路径
	var WebRequest = {
			setContextPath :function(path) {
				WebRequest._contextPath = path;
			},
			getContextPath : function() {
				return WebRequest._contextPath;
			}
	};
	WebRequest.setContextPath('<%=request.getContextPath()%>');
</script>