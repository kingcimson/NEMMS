
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-模块管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/module.js?v=<%=Math.random()%>"></script>
</head>
<body class="easyui-layout">
	<div id="toolbar" class="toolbar">
	属性:<select class="easyui-combobox" id="field-name" name="fieldName" style="width: 100px">
			<option value="name">名称</option>
			<option value="code">代号</option>
			<option value="url">URL</option>
		</select>
		关键字:<input class="easyui-textbox" type="text" id="Keyword" name="Keyword" />
		 <a id="search_module" href="#" class="easyui-linkbutton" iconCls="icon-search"> 搜索 </a>
		  <input id="module-action" type="hidden" name="action" value="" />
	</div>
	<div style="height: 95%; padding: 2px">
		<div id="module-treegrid"></div>
	</div>
	<div id="add-module-dlg" class="easyui-dialog" title="添加操作" style="width: 660px; height: 400px; padding: 10px;">
		<form id="add-form" name="add-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>所属模块:</td>
						<td colspan="3"><label> <input class="easyui-textbox" type="text" name="moduleId" id="moduleId"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>操作代码:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" name="code" id="code" value="0x"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>操作名称:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" name="name" id="name" value=""
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>排序:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" id="sequence" name="sequence"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" id="comment" name="comment"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-role-dlg" class="easyui-dialog" title="编辑用户信息" style="width: 660px; height: 400px; padding: 10px;">
		<form id="edit-form" name="edit-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>所属模块:</td>
						<td colspan="3"><label> <input class="easyui-textbox" type="text" name="moduleId" id="edit-moduleId"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>操作代码:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" name="code" id="edit-code" value="0x"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>操作名称:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" name="name" id="edit-name" value=""
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>排序:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" id="sequence" name="edit-sequence"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><label><input class="easyui-textbox" type="text" id="comment" name="edit-comment"
								data-options="required:true" style="width: 380px"></label></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>