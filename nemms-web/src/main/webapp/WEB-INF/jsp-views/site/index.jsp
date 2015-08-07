<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-站点管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/js/libs/socket.io-1.3.5.js"></script>
<script src="<%=request.getContextPath()%>/assets/modules/site/js/sitemgr.js"></script>
</head>
<body class="easyui-layout" id="site">
	<!-- 左边tree -->
	<div id="west" data-options="region:'west',split:true" title="站点信息" style="width: 220px;">
		<div class="easyui-panel" style="padding: 5px; border: none">
			<ul id="site-tree"></ul>
		</div>
	</div>
	<div id="center" data-options="region:'center'">
		<div class="toolbar">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-filter',plain:true">获取监控列表</a> 
			<a class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查看全部</a> 
			<a class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
		</div>
		<div id="param-tabs" class="easyui-tabs" style="height: 60%">
			<div title="使用设备" style="padding: 20px">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
				</table>
			</div>
			<div title="网管参数" data-options="closable:true" style="padding: 20px">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
				</table>
			</div>
			<div title="警告参数" data-options="iconCls:'icon-help',closable:true" style="padding: 20px">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" />转化到软件模式射进社会审计方法是否：</td>
						<td align="left"><input name="" type="text" class="text"></td>
						<td><input name="" type="checkbox" value="" />设备管理：</td>
						<td align="left"><input name="" type="text" class="text"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="console-tabs" class="easyui-tabs">
			<div title="输出控制台" style="padding: 0px">
				<table class="easyui-datagrid" style="height: 100%;" data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'itemid',width:80">Item ID</th>
							<th data-options="field:'productid',width:100">Product</th>
							<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
							<th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
							<th data-options="field:'attr1',width:250">Attribute</th>
							<th data-options="field:'status',width:60,align:'center'">Status</th>
						</tr>
					</thead>
				</table>
			</div>
			<div title="当前连接设备" style="padding: 0px">
				<table class="easyui-datagrid" style="height: 100%;" data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'itemid',width:80">Item ID</th>
							<th data-options="field:'productid',width:100">Product</th>
							<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
							<th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
							<th data-options="field:'attr1',width:250">Attribute</th>
							<th data-options="field:'status',width:60,align:'center'">Status</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="add-site-dlg" title="添加站点">
		<form id="add-site-form" name="add-site-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="table1">
					<tr>
						<td>站点名称:</td>
						<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
						<td>站点编号:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>设备类型:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
						<td>AP协议类型:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
					</tr>
					<tr>
						<td>mcp协议类型:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
						<td>通讯协议类型:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
					</tr>
					<tr>
						<td>IP地址（UDP）:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
						<td>端口:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>设备厂商:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="email" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>站点顺序:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
						<td>站点备注:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-site-dlg" title="编辑站点" style="width: 560px; height: 380px; padding: 10px;">
		<form id="edit-site-form" name="edit-site-form" method="post">
		</form>
	</div>
	<div id="add-device-dlg" title="编辑站点" style="width: 560px; height: 380px; padding: 10px;">
		<form id="add-device-form" name="add-device-form" method="post">
		</form>
	</div>
	<div id="edit-device-dlg" title="编辑站点" style="width: 560px; height: 380px; padding: 10px;">
		<form id="edit-device-form" name="edit-device-form" method="post">
		</form>
	</div>
	<!-- 查找树节点弹框  -->
	<div id="search-site-dlg" title="查找站点(设备)">
		<div id="toolbar" class="toolbar">
			选项:<select class="easyui-combobox" id="field-name" name="fieldName" style="width: 120px">
				<option value="name">名称</option>
				<option value="uid">编号</option>
			</select> 关键字:<input class="easyui-textbox" type="text" id="keyword" name="keyword" />
			 <a id="btn-search-site" href="#" class="easyui-linkbutton" iconCls="icon-search"> 查找 </a>
		</div>
		<div style="height: 86%; padding: 2px">
			<div id="search-site-result"></div>
		</div>
	</div>
	<!-- tree右键菜单  -->
	<div id="site-tree-ctx-menu" class="easyui-menu" data-options="onClick:SiteMgr.siteTree.contextMenu.onSelect" style="width: 150px;">
		<div id="m-add-site" data-options="name:'addRp',iconCls:'icon-site'">新增站点</div>
		<div id="m-add-device" data-options="name:'info',iconCls:'icon-device'">新增设备</div>
		<div class="menu-sep"></div>
		<div id="m-edit" data-options="name:'edit',iconCls:'icon-edit'">修改</div>
		<div id="m-remove" data-options="name:'remove',iconCls:'icon-remove'">删除</div>
		<div id="m-search" data-options="name:'search',iconCls:'icon-search'">查找</div>
		<div class="menu-sep"></div>
		<div id="m-refresh" data-options="name:'refresh',iconCls:'icon-reload'">刷新</div>
	</div>
</body>
</html>
