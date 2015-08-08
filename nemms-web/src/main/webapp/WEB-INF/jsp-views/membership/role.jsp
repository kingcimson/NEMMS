
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-站点管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/role.js?v=<%=Math.random()%>"></script>
</head>
<body class="easyui-layout">
	<div id="toolbar" class="toolbar">
		角色名:<input class="easyui-textbox" type="text" id="Keyword" name="Keyword" />
		 <a id="search_user" href="#" class="easyui-linkbutton" iconCls="icon-search"> 搜索 </a>
		  <input id="modal-action" type="hidden" name="action" value="" />
	</div>
	<div style="height: 93%; padding: 2px">
		<div id="role-datagrid"></div>
	</div>
	<div id="add-role-dlg" class="easyui-dialog" title="添加角色" style="width: 680px; height: 530px; padding: 10px;">
		<form id="add-form" name="add-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>角色名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="role_name" id="role_name"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>角色代号:</td>
						<td><input class="easyui-textbox" type="text" name="role_code" id="role_code" value="0x"
							data-options="required:true"></input></td>
						<td>系统角色:</td>
						<td><select class="easyui-combobox" id="isSystem" name="isSystem"
							data-options="valueField:'value',textField:'name'" style="width: 148px">
								<option selected="selected" value="0">否</option>
								<option value="1">是</option>
						</select></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td><select class="easyui-combobox" id="status" name="status"
							data-options="valueField:'value',textField:'name'" style="width: 148px">
								<option selected="selected" value="1">启用</option>
								<option value="0">禁用</option>
						</select></td>
						<td>排序：</td>
						<td><input class="easyui-textbox" type="text" name="role_sequence" id="role_sequence" value="0x"
							data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>登陆密码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="password" name="password"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>权限:</td>
						<td colspan="3"><label class="checkbox"> <input type="checkbox" name="chkAll" id="chkAll"> <i></i>所有权限</label>
						</td>
					</tr>
					<tr>
						<td>可查看设备参数属性:</td>
						<td colspan="3" class="check01"><label class="checkbox">全选 <input type="checkbox"
								name="checkAllDeviceParamProps" id="checkAllDeviceParamProps"><i></i></label><br /> <label class="checkbox">编号<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_id" value="id" checked="checked"><i></i></label>
							<label class="checkbox">名称<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_name" value="name" checked="checked"><i></i></label> <label class="checkbox">类别<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_category_id" value="category_id"
								checked="checked"><i></i></label> <label class="checkbox">读写属性<input class="checkbox-item"
								type="checkbox" name="deviceParamProps" id="prop_mode" value="mode"><i></i></label><br /> <label
							class="checkbox">单位<input class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_unit"
								value="unit"><i></i></label> <label class="checkbox">传输比或系数<input class="checkbox-item" type="checkbox"
								name="deviceParamProps" id="prop_ratio" value="ratio"><i></i></label> <label class="checkbox">值数据类型<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_value_type" value="value_type"><i></i></label><br />
							<label class="checkbox">值数据长度<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_value_len" value="value_len"><i></i></label> <label class="checkbox">值数据最小长度<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_value_min_len" value="value_min_len"><i></i></label>
							<label class="checkbox">值数据最大长度<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_value_max_len" value="value_max_len"><i></i></label><br /> <label class="checkbox">参数最小值<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_min_value" value="min_value"><i></i></label>
							<label class="checkbox">参数最大值<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_max_value" value="max_value"><i></i></label> <label class="checkbox">告警级别<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_warn_level" value="warn_level"><i></i></label>

						</td>
					</tr>
					<tr>
						<td>描述:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="role_comment" id="role_comment"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-role-dlg" class="easyui-dialog" title="编辑角色" style="width: 680px; height: 500px; padding: 10px;">
		<form id="edit-form" name="edit-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>角色名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="role_name" id="role_name"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>角色代号:</td>
						<td><input class="easyui-textbox" type="text" name="role_code" id="role_code" value="0x"
							data-options="required:true"></input></td>
						<td>系统角色:</td>
						<td><select class="easyui-combobox" id="isSystem" name="isSystem"
							data-options="valueField:'value',textField:'name'" style="width: 148px">
								<option selected="selected" value="0">否</option>
								<option value="1">是</option>
						</select></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td><select class="easyui-combobox" id="status" name="status"
							data-options="valueField:'value',textField:'name'" style="width: 148px">
								<option selected="selected" value="1">启用</option>
								<option value="0">禁用</option>
						</select></td>
						<td>排序：</td>
						<td><input class="easyui-textbox" type="text" name="role_sequence" id="role_sequence" value="0x"
							data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>登陆密码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="password" name="password"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>权限:</td>
						<td colspan="3"><label class="checkbox"> <input type="checkbox" id="chkAll" name="chkAll"> <i></i>所有权限
							</label></td>
					</tr>
					<tr>
						<td valign="top">可查看设备参数属性:</td>
						<td colspan="3" class="check01"><label class="checkbox">全选 <input type="checkbox"
								name="checkAllDeviceParamProps" id="checkAllDeviceParamProps"><i></i></label><br /> <label class="checkbox">编号<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_id" value="id" checked="checked"><i></i></label>
							<label class="checkbox">名称<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_name" value="name" checked="checked"><i></i></label> <label class="checkbox">类别<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_category_id" value="category_id"
								checked="checked"><i></i></label> <label class="checkbox">读写属性<input class="checkbox-item"
								type="checkbox" name="deviceParamProps" id="prop_mode" value="mode"><i></i></label><br /> <label
							class="checkbox">单位<input class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_unit"
								value="unit"><i></i></label> <label class="checkbox">传输比或系数<input class="checkbox-item" type="checkbox"
								name="deviceParamProps" id="prop_ratio" value="ratio"><i></i></label> <label class="checkbox">值数据类型<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_value_type" value="value_type"><i></i></label><br />
							<label class="checkbox">值数据长度<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_value_len" value="value_len"><i></i></label> <label class="checkbox">值数据最小长度<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_value_min_len" value="value_min_len"><i></i></label>
							<label class="checkbox">值数据最大长度<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_value_max_len" value="value_max_len"><i></i></label><br /> <label class="checkbox">参数最小值<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_min_value" value="min_value"><i></i></label>
							<label class="checkbox">参数最大值<input class="checkbox-item" type="checkbox" name="deviceParamProps"
								id="prop_max_value" value="max_value"><i></i></label> <label class="checkbox">告警级别<input
								class="checkbox-item" type="checkbox" name="deviceParamProps" id="prop_warn_level" value="warn_level"><i></i></label>
						</td>
					</tr>
					<tr>
						<td>描述:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="role_comment" id="role_comment"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>