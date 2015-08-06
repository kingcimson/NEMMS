<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-日志管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/event.js?v=<%=Math.random()%>"></script>
</head>
<body class="easyui-layout">
	<div id="toolbar" class="toolbar">
		<select class="easyui-combobox" id="field-name" name="fieldName" style="width: 120px">
			<option value="account">操作用户</option>
			<option value="level">日志级别</option>
			<option value="message">日志内容</option>
		</select> 
		关键字:<input class="easyui-textbox" type="text" id="keyword" name="keyword"/>
		<a id="btn-search" href="#" class="easyui-linkbutton" iconCls="icon-search"> 搜索  </a>
		<a id="btn-clear" href="#" class="easyui-linkbutton" iconCls="icon-clear"> 清空所有日志  </a>
	</div>
	<div style="height: 93%; padding: 2px">
		<div id="event-datagrid"></div>
		<input id="current-row-index" name="current-row-index" type="hidden" value="0" />
	</div>
	<div id="detail-info-dlg" class="easyui-dialog" title="日志详细信息">
		<span id="detail-info" class="name"></span>
	</div>
</body>
</html>