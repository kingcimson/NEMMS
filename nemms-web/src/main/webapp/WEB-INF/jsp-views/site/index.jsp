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
<script src="<%=request.getContextPath()%>/assets/modules/site/js/sitemgr.js?v=<%=Math.random()%>"></script>
</head>
<body class="easyui-layout" id="body-layout">
	<!-- 左边tree -->
	<div id="west" data-options="region:'west',split:true" title="站点信息" style="width: 220px;">
		<div class="easyui-panel" style="padding: 5px; border: none">
			<ul id="site-tree"></ul>
			<input id="modal-action" type="hidden" name="action" value="" />
		</div>
	</div>
	<div id="center" data-options="region:'center'">
		<div class="toolbar">
			<a id="btn-query-item" class="easyui-linkbutton" data-options="iconCls:'icon-item',plain:true">获取参数列表</a>
			 <a id="btn-query-all" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询全部</a> 
			<a id="btn-query-selected" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">查询选中参数</a>
			<a id="btn-query-schedule" class="easyui-linkbutton" data-options="iconCls:'icon-timer',plain:true">定时查询</a>
			<a id="btn-edit" class="easyui-linkbutton" data-options="iconCls:'icon-edit1',plain:true">设置参数</a>
			 <a id="btn-cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel1',plain:true">取消设置</a>
			 <a id="btn-clear" class="easyui-linkbutton" data-options="iconCls:'icon-clear1',plain:true">清除全部</a>
		</div>
		<div id="param-tabs" class="easyui-tabs" style="width: 100%; height: 50%">
		</div>
		<div id="console-tabs" class="easyui-tabs" style="width: 100%; height: 40%">
			<div title="输出控制台" style="padding: 0px">
				<div style="height: 200px">
					<div id="console-datagrid"></div>
				</div>
			</div>
			<div title="当前连接设备" style="padding: 0px;">
				<div style="height: 95%">
					<div id="connected-device-datagrid"></div>
				</div>
			</div>
			<div title="定时任务" style="padding: 0px;">
				<div style="height: 95%">
					<div id="schedule-task-datagrid"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="add-site-dlg" title="添加站点">
		<form id="add-site-form" name="add-site-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>站点名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="name" name="name" data-options="required:true"
							style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>站点编号:</td>
						<td><input class="easyui-textbox" type="text" id="uid" name="uid" data-options="required:true"></input></td>
						<td>站点顺序:</td>
						<td><input class="easyui-textbox" type="text" id="sequence" name="sequence" data-options="required:true"
							style="width: 115px"></input></td>
					</tr>
					<tr>
						<td>设备类型:</td>
						<td><select class="easyui-combobox" id="deviceType" name="deviceType"
							data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>AP协议类型:</td>
						<td><select class="easyui-combobox" id="apProtocol" name="apProtocol"
							data-options="valueField:'value',textField:'name'" style="width: 115px"></select></td>
					</tr>
					<tr>
						<td>MCP协议类型:</td>
						<td><select class="easyui-combobox" id="mcpProtocol" name="mcpProtocol"
							data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>通讯协议类型:</td>
						<td><select class="easyui-combobox" id="protocol" name="protocol"
							data-options="valueField:'value',textField:'name'" style="width: 115px"></select></td>
					</tr>
					<tr>
						<td>UDP协议IP地址:</td>
						<td><input class="easyui-textbox" type="text" id="ipAddr" name="ipAddr" data-options="required:true"></input></td>
						<td>UDP协议端口:</td>
						<td><input class="easyui-textbox" type="text" id="port" name="port" data-options="required:true"
							style="width: 115px"></input></td>
					</tr>
					<tr>
						<td>设备厂商:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="manufactor" name="manufactor"
							style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>站点备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="comment" name="comment" style="width: 380px"></input>
							<input type="hidden" name="pid" id="pid" value="0"></input> <input type="hidden" name="flag" id="flag" value="0"></input>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-site-dlg" title="编辑站点">
		<form id="edit-site-form" name="edit-site-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>站点名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-name" name="name"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>站点编号:</td>
						<td><input class="easyui-textbox" type="text" id="edit-uid" name="uid" data-options="required:true"></input></td>
						<td>站点顺序:</td>
						<td><input class="easyui-textbox" type="text" id="edit-sequence" name="sequence" data-options="required:true"
							style="width: 115px"></input></td>
					</tr>
					<tr>
						<td>设备类型:</td>
						<td><select class="easyui-combobox" id="edit-deviceType" name="deviceType"
							data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>AP协议类型:</td>
						<td><select class="easyui-combobox" id="edit-apProtocol" name="apProtocol"
							data-options="valueField:'value',textField:'name'" style="width: 115px"></select></td>
					</tr>
					<tr>
						<td>MCP协议类型:</td>
						<td><select class="easyui-combobox" id="edit-mcpProtocol" name="mcpProtocol"
							data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>通讯协议类型:</td>
						<td><select class="easyui-combobox" id="edit-protocol" name="protocol"
							data-options="valueField:'value',textField:'name'" style="width: 115px"></select></td>
					</tr>
					<tr>
						<td>UDP协议IP地址:</td>
						<td><input class="easyui-textbox" type="text" id="edit-ipAddr" name="ipAddr" data-options="required:true"></input></td>
						<td>UDP协议端口:</td>
						<td><input class="easyui-textbox" type="text" id="edit-port" name="port" data-options="required:true"
							style="width: 115px"></input></td>
					</tr>
					<tr>
						<td>设备厂商:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-manufactor" name="manufactor"
							style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>站点备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-comment" name="comment"
							style="width: 380px"></input> <input type="hidden" name="id" id="edit-id"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="add-device-dlg" title="增加设备">
		<form id="add-device-form" name="add-device-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>设备名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="device-name" name="name"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>设备编号:</td>
						<td><input class="easyui-textbox" type="text" id="device-uid" name="uid" data-options="required:true"></input></td>
						<td>设备顺序:</td>
						<td><input class="easyui-textbox" type="text" id="device-sequence" name="sequence"
							data-options="required:true" style="width: 138px"></input></td>
					</tr>
					<tr>
						<td>设备备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="device-comment" name="comment"
							style="width: 380px"></input> <input type="hidden" name="pid" id="device-pid"></input> <input type="hidden"
							name="flag" id="device-flag" value="1"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-device-dlg" title="编辑设备">
		<form id="edit-device-form" name="edit-device-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>设备名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-device-name" name="name"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>设备编号:</td>
						<td><input class="easyui-textbox" type="text" id="edit-device-uid" name="uid" data-options="required:true"></input></td>
						<td>设备顺序:</td>
						<td><input class="easyui-textbox" type="text" id="edit-device-sequence" name="sequence"
							data-options="required:true" style="width: 138px"></input></td>
					</tr>
					<tr>
						<td>设备备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-device-comment" name="comment"
							style="width: 380px"></input> <input type="hidden" name="id" id="edit-device-id"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<!-- 查找树节点弹框  -->
	<div id="search-site-dlg" title="查找站点(设备)">
		<div id="toolbar" class="toolbar">
			选项:<select class="easyui-combobox" id="field-name" name="fieldName" style="width: 120px">
				<option value="name">名称</option>
				<option value="uid">编号</option>
			</select> 关键字:<input class="easyui-textbox" type="text" id="keyword" name="keyword" /> <a id="btn-search-site" href="#"
				class="easyui-linkbutton" iconCls="icon-search"> 查找 </a>
		</div>
		<div style="height: 86%; padding: 2px">
			<div id="search-site-result"></div>
		</div>
	</div>
	<div id="fullscreen-param-tabs-dlg" title="参数查询">
	</div>
	<div id="fullscreen-console-tabs-dlg" title="控制台">
	</div>
	<!-- tree右键菜单  -->
	<div id="site-tree-ctx-menu" class="easyui-menu" data-options="onClick:SiteMgr.siteTree.contextMenu.onSelect"
		style="width: 150px;">
		<div id="m-add-site" data-options="name:'addSite',iconCls:'icon-site'">新增站点</div>
		<div id="m-add-device" data-options="name:'addDevice',iconCls:'icon-device'">新增设备</div>
		<div class="menu-sep"></div>
		<div id="m-edit" data-options="name:'edit',iconCls:'icon-edit'">修改</div>
		<div id="m-remove" data-options="name:'remove',iconCls:'icon-remove'">删除</div>
		<div id="m-search" data-options="name:'search',iconCls:'icon-search'">查找</div>
		<div class="menu-sep"></div>
		<div id="m-refresh" data-options="name:'refresh',iconCls:'icon-reload'">刷新</div>
	</div>
</body>
</html>
