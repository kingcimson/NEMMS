<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统</title>
<link rel="shortcut icon" href="/nemms-web1/assets/images/favicon.ico" />
<link rel="stylesheet" href="/nemms-web1/assets/js/frames/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" href="/nemms-web1/assets/js/frames/easyui/themes/icon.css" />
<link rel="stylesheet" href="/nemms-web1/assets/css/main.css" />
<script src="/nemms-web1/assets/js/frames/jquery.min.js"></script>
<script src="/nemms-web1/assets/js/frames/easyui/jquery.easyui.min.js"></script>
<script src="/nemms-web1/assets/js/frames/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="/nemms-web1/assets/js/plugins/jquery.extension.js"></script>
<script src="/nemms-web1/assets/js/plugins/artTemplate.js"></script>
<!-- 设置Context路径，即WebApp的路径 -->
<script type="text/javascript">
	var XFrame = {
		setContextPath : function(path) {
			XFrame._contextPath = path;
		},
		getContextPath : function() {
			return XFrame._contextPath;
		}
	};

	XFrame.setContextPath('/nemms-web1');
	$.ajaxSetup({
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		complete : function(xhr, textStatus) {
			var sessionStatus = xhr.getResponseHeader('sessionstatus');
			if (sessionStatus == 'timeout') {
				return window.location.reload();
			}
		}
	});
</script>
<script>
	function addTab(title, url) {
		if ($('#main-tab').tabs('exists', title)) {
			$('#main-tab').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
			$('#main-tab').tabs('add', {
				title : title,
				content : content,
				closable : true
			});
		}
	}
</script>
</head>
<body>
	<div class="easyui-layout" fit="true" style="height: 250px;">
		<div region="north" style="height: 32px;">
			<div style="padding: 2px 5px;">
				<a href="#" class="easyui-splitbutton" data-options="menu:'#mm4',iconCls:'fa fa-lg fa-fw fa-eye'"
					onclick="addTab('站点管理','/nemms-web1/site/index','fa fa-lg fa-fw fa-eye')">站点管理</a> <a href="#" class="easyui-splitbutton"
					data-options="menu:'#mm3',iconCls:'fa fa-lg fa-fw fa-tags'" onclick="addTab('设备参数','/nemms-web1/device/params','fa fa-lg fa-fw fa-tags')">设备参数</a>
				<a href="#" class="easyui-splitbutton" data-options="menu:'#mm7',iconCls:'fa fa-lg fa-fw fa-user'"
					onclick="addTab('用户权限','/nemms-web1/membership/user','fa fa-lg fa-fw fa-user')">用户权限</a> <a href="#" class="easyui-splitbutton"
					data-options="menu:'#mm32',iconCls:'fa fa-lg fa-fw fa-cog'" onclick="addTab('系统管理','/nemms-web1/system/config','fa fa-lg fa-fw fa-cog')">系统管理</a>
				<a href="/nemms-web1/logout" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">退出系统</a>
			</div>
			<div id="mm7" style="width: 150px;">
				<div data-options="iconCls:''" onclick="addTab('用户管理','/nemms-web1/membership/user','')">用户管理</div>
				<div data-options="iconCls:''" onclick="addTab('角色管理','/nemms-web1/membership/role','')">角色管理</div>
				<div data-options="iconCls:''" onclick="addTab('操作管理','/nemms-web1/membership/operation','')">操作管理</div>
				<div data-options="iconCls:''" onclick="addTab('模块管理','/nemms-web1/membership/module','')">模块管理</div>
				<div data-options="iconCls:''" onclick="addTab('用户日志','/nemms-web1/membership/event','')">用户日志</div>
			</div>
			<div id="mm32" style="width: 150px;">
				<div data-options="iconCls:'fa fa-lg fa-fw fa-cog'" onclick="addTab('配置管理','/nemms-web1/system/config','fa fa-lg fa-fw fa-cog')">配置管理</div>
			</div>
		</div>
		<div region="center">
			<div id="main-tab" class="easyui-tabs" border="false" fit="true">
				<div title="首页">
					<p style="font-size: 20px; padding: 20px">
						你好,<font color="red">Tom Deng</font>.欢迎进入裕源大通网元监控与管理系统！
					</p>
				</div>
			</div>
		</div>
		<div region="south">
			<div id="footer">
				<div>Copyright © 2010-2015 北京裕源大通</div>
			</div>
		</div>
	</div>
</body>
</html>
