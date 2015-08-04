<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script>
	function addTab(title, url, iconCls) {
		if ($('#main-tab').tabs('exists', title)) {
			$('#main-tab').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
			$('#main-tab').tabs('add', {
				title : title,
				content : content,
				closable : true,
				iconCls : iconCls
			});
		}
	}
</script>
</head>
<body>
	<div class="easyui-layout" fit="true" style="">
		<div region="north" class="bg-header">
			<span class="name">admin 欢迎你回来</span>
			<div class="logo"></div>
			<div class="menus">${menus}</div>
		</div>
		<div region="center">
			<div id="main-tab" class="easyui-tabs" border="false" fit="true">
				<div title="首页">
					<p style="font-size: 20px; padding: 20px">
						你好,<font color="red">${user.name}</font>.欢迎进入裕源大通网元监控与管理系统！
					</p>
				</div>
			</div>
		</div>
		<div region="south" class="footer">
			<div id="footer-left">
				<div>网元设备监控与管理系统</div>
			</div>
			<div id="footer-right">Copyright © 2010-2015 北京裕源大通科技有限公司</div>
		</div>
	</div>
</body>
</html>
