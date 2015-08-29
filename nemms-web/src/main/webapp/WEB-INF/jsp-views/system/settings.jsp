<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-系统配置</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/modules/system/js/settings.js?v=<%=Math.random()%>"></script>
</head>
<body class="easyui-layout">
	<div id="toolbar" class="toolbar">
		属性:<select class="easyui-combobox" id="field-name" name="fieldName" style="width: 100px">
			<option value="name">名称</option>
			<option value="key">配置项</option>
			<option value="value">配置值</option>
		</select> 关键字:<input class="easyui-textbox" type="text" id="keyword" name="keyword" /> 
		<a id="btn-search" href="#" class="easyui-linkbutton" iconCls="icon-search"> 搜索 </a> 
		<input id="modal-action" type="hidden" name="action" value="" />
	</div>
	<div style="height: 93%; padding: 2px">
		<div id="settings-datagrid"></div>
	</div>
	<div id="add-settings-dlg" title="添加配置项">
		<form id="add-form" name="add-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="name" name="name"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>配置项:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="key" name="key"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>配置值:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="value" name="value"
						 data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>顺序:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="sequence" id="sequence"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="comment" id="comment"  style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-settings-dlg"  title="编辑配置项信息">
		<form id="edit-form" name="edit-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
				<tr>
						<td>名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-name" name="name"
							data-options="required:true" style="width: 380px"></input>
							<input id="edit-id" type="hidden" name="id" /></td>
					</tr>
					<tr>
						<td>配置项:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-key" name="key"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>配置值:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-value" name="value"
						 data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>顺序:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-sequence" name="sequence" 
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-comment" name="comment" style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>