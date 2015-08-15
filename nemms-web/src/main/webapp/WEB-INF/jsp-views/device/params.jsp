<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-参数管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/modules/device/js/params.js?v=<%=Math.random()%>"></script>
</head>
<body class="easyui-layout">
	<div id="toolbar" class="toolbar">
		类型:<select class="easyui-combobox" id="filter-category-id" name="categoryId" data-options="valueField:'value',textField:'name'" panelHeight="auto" style="width: 100px"></select> 
		<select class="easyui-combobox" id="field-name" name="fieldName" panelHeight="auto" style="width: 120px">
			<option value="name">名称</option>
			<option value="param_uid">监控标识</option>
			<option value="mcp_id">MCP协议类型</option>
			<option value="mode">模式</option>
			<option value="value_type">值类型</option>
		</select> 
		关键字:<input class="easyui-textbox" type="text" id="keyword" name="keyword"/>
		<a id="btn-search" href="#" class="easyui-linkbutton" iconCls="icon-search"> 搜索  </a>
		<input id="modal-action" type="hidden" name="action" value="" />
	</div>
	<div style="height: 93%; padding: 2px">
		<div id="param-datagrid"></div>
	</div>
	<div id="add-param-dlg" class="easyui-dialog" title="添加设备参数">
		<form id="add-form" name="add-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="name" id="name" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>参数标识:</td>
						<td><input class="easyui-textbox" type="text" name="paramUid" id="paramUid" value="0x" data-options="required:true"></input></td>
						<td>MCP协议:</td>
						<td><select class="easyui-combobox" id="mcpId" name="mcpId" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
					<tr>
						<td>类别:</td>
						<td><select class="easyui-combobox" id="categoryId" name="categoryId" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>模式:</td>
						<td><select class="easyui-combobox" id="mode" name="mode" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
					<tr>
						<td>系数:</td>
						<td><input class="easyui-textbox" type="text" name="ratio" id="ratio" value="1.0" data-options="required:true"></input></td>
						<td>单位:</td>
						<td><input class="easyui-textbox" type="text" name="unit" id="unit" value="0" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>值类型:</td>
						<td><select class="easyui-combobox" id="valueType" name="valueType" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>值长度:</td>
						<td><input class="easyui-textbox" type="text" name="valueLen" id="valueLen" value="1" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>值最小长度:</td>
						<td><input class="easyui-textbox" type="text" name="valueMinLen" id="valueMinLen" value="1" data-options="required:true"></input></td>
						<td>值最大长度:</td>
						<td><input class="easyui-textbox" type="text" name="valueMaxLen" id="valueMaxLen" value="8" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>最小值:</td>
						<td><input class="easyui-textbox" type="text" name="minValue" id="minValue" value="0" data-options="required:true"></input></td>
						<td>最大值:</td>
						<td><input class="easyui-textbox" type="text" name="maxValue" id="maxValue" value="255" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>警告级别:</td>
						<td><select class="easyui-combobox" id="warnLevel" name="warnLevel" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>权限归属:</td>
						<td><select class="easyui-combobox" id="authorityRoles" name="authorityRoles" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
					<tr>
						<td>参考控件:</td>
						<td><select class="easyui-combobox" id="htmlElem" name="htmlElem" style="width: 148px">
								<option value="text">文本框</option>
								<option value="select">下拉框</option>
						</select></td>
						<td>参数配置项:</td>
						<td><select class="easyui-combobox" id="htmlElemKey" name="htmlElemKey" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-param-dlg" class="easyui-dialog" title="编辑设备参数">
		<form id="edit-form" name="edit-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>名称:<input name="id" type="hidden"/></td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="name" id="edit-name" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>参数标识:</td>
						<td><input class="easyui-textbox" type="text" name="paramUid" id="edit-paramUid" data-options="required:true"></input></td>
						<td>MCP协议:</td>
						<td><select class="easyui-combobox" id="edit-mcpId" name="mcpId" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
					<tr>
						<td>类别:</td>
						<td><select class="easyui-combobox" id="edit-categoryId" name="categoryId" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>模式:</td>
						<td><select class="easyui-combobox" id="edit-mode" name="mode" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
					<tr>
						<td>系数:</td>
						<td><input class="easyui-textbox" type="text" name="ratio" id="edit-ratio" data-options="required:true"></input></td>
						<td>单位:</td>
						<td><input class="easyui-textbox" type="text" name="unit" id="edit-unit" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>值类型:</td>
						<td><select class="easyui-combobox" id="edit-valueType" name="valueType" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>值长度:</td>
						<td><input class="easyui-textbox" type="text" name="valueLen" id="edit-valueLen" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>值最小长度:</td>
						<td><input class="easyui-textbox" type="text" name="valueMinLen" id="edit-valueMinLen" data-options="required:true"></input></td>
						<td>值最大长度:</td>
						<td><input class="easyui-textbox" type="text" name="valueMaxLen" id="edit-valueMaxLen" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>最小值:</td>
						<td><input class="easyui-textbox" type="text" name="minValue" id="edit-minValue" data-options="required:true"></input></td>
						<td>最大值:</td>
						<td><input class="easyui-textbox" type="text" name="maxValue" id="edit-maxValue" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>警告级别:</td>
						<td><select class="easyui-combobox" id="edit-warnLevel" name="warnLevel" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
						<td>权限归属:</td>
						<td><select class="easyui-combobox" id="edit-authorityRoles" name="authorityRoles" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
					<tr>
						<td>参考控件:</td>
						<td><select class="easyui-combobox" id="edit-htmlElem" name="htmlElem" style="width: 148px">
								<option value="text">文本框</option>
								<option value="select">下拉框</option>
						</select></td>
						<td>参数配置项:</td>
						<td><select class="easyui-combobox" id="edit-htmlElemKey" name="htmlElemKey" data-options="valueField:'value',textField:'name'" style="width: 148px"></select></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>