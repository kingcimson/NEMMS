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
		if ($('#main-tabs').tabs('exists', title)) {
			$('#main-tabs').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
			$('#main-tabs').tabs('add', {
				title : title,
				content : content,
				closable : true,
				iconCls : iconCls
			});
		}
	}
	
	function onTabCtxMenuClick(item) {
		if (item.name == "current") {
			return EasyUIUtils.closeCurrentTab('#main-tabs');
		}
		if (item.name == "others") {
			return EasyUIUtils.closeOthersTab('#main-tabs');
		}
		if (item.name == "all") {
			return EasyUIUtils.closeAllTab('#main-tabs');
		}
		return;
	}
	
	$(function(){
		// 初始化tab相关事件
		$('#main-tabs').tabs({
			onContextMenu : function(e, title, index) {
				e.preventDefault();
				$('#main-tab-ctx-menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
	});
</script>
</head>
<body>
	<div class="easyui-layout" fit="true">
		<div region="north" class="bg-header">
			<span class="name">${user.name},欢迎你回来!</span>
			<div class="logo"></div>
			<div class="menus">${menus}</div>
		</div>
		<div region="center">
			<div id="main-tabs" class="easyui-tabs" border="false" fit="true">
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
	<!-- tabs右键菜单  -->
	<div id="main-tab-ctx-menu" class="easyui-menu" data-options="onClick:onTabCtxMenuClick" style="width: 120px;">
		<div id="m-current" data-options="name:'current',iconCls:'icon-cancel'">关闭当前页</div>
		<div id="m-others" data-options="name:'others',iconCls:''">关闭其他页</div>
		<div id="m-all" data-options="name:'all',iconCls:''">关闭所有页</div>
	</div>
</body>
</html>
