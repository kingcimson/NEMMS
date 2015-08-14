
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
		</select> 关键字:<input class="easyui-textbox" type="text" id="keyword" name="keyword" />
		 <a id="btn-search" href="#" class="easyui-linkbutton" iconCls="icon-search"> 搜索 </a>
		  <input id="module-action" type="hidden" name="action" value="" />
	</div>
	<div style="height: 95%; padding: 2px">
		<div id="module-treegrid"></div>
	</div>
	<div id="add-module-dlg"  title="添加模块">
		<form id="add-form" name="add-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>父模块:</td>
						<td colspan="3"> <input class="easyui-textbox" type="text" name="moduleId" id="moduleId"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>编码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="code" id="code" value="0x"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="name" id="name" value=""
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>Url:</td>
						<td><input class="easyui-textbox" type="text" name="url" id="url" value=""
								data-options="required:true"></input></td>

						<td>icon:</td>
						<td><input class="easyui-textbox" type="text" name="icon" id="icon" value=""
								data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>是否外链:</td>
						<td><select class="easyui-combobox" id="linkType" name="linkType"  style="width: 148px">
								<option selected="selected" value="0">否</option>
								<option value="1">是</option>
						</select></td>
						<td>Url Target:</td>
						<td><select class="easyui-combobox" id="target" name="target" style="width: 148px">
								<option selected="selected" value="0">_blank</option>
								<option value="1">_self</option>
						</select></td>
					</tr>
					<tr>
						<td>Url参数:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="params" name="params"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td colspan="3"><select class="easyui-combobox" id="status" name="status" style="width: 148px">
								<option selected="selected" value="0">启用</option>
								<option value="1">禁用</option>
						</select></td>
					</tr>
					<tr>
						<td>排序:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="sequence" name="sequence"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="comment" name="comment"
						 style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-module-dlg" title="编辑模块">
		<form id="edit-form" name="edit-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>父模块:</td>
						<td colspan="3"> <input class="easyui-textbox" type="text" name="moduleId" id="edit-moduleId"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>编码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="code" id="edit-code" value="0x"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="name" id="edit-name" value=""
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>Url:</td>
						<td><input class="easyui-textbox" type="text" name="url" id="edit-url" value=""
								data-options="required:true"></input></td>

						<td>icon:</td>
						<td><input class="easyui-textbox" type="text" name="icon" id="edit-icon" value=""
								data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>是否外链:</td>
						<td><select class="easyui-combobox" id="edit-linkType" name="linkType"  style="width: 148px">
								<option selected="selected" value="0">否</option>
								<option value="1">是</option>
						</select></td>
						<td>Url Target:</td>
						<td><select class="easyui-combobox" id="edit-target" name="target" style="width: 148px">
								<option selected="selected" value="0">_blank</option>
								<option value="1">_self</option>
						</select></td>
					</tr>
					<tr>
						<td>Url参数:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-params" name="params"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td colspan="3"><select class="easyui-combobox" id="edit-status" name="status" style="width: 148px">
								<option selected="selected" value="0">启用</option>
								<option value="1">禁用</option>
						</select></td>
					</tr>
					<tr>
						<td>排序:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-sequence" name="sequence"
								data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="edit-comment" name="comment"
						 style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>