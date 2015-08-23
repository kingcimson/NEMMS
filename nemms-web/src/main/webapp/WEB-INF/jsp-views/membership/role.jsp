
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
	<div id="add-role-dlg" title="添加角色">
		<form id="add-form" name="add-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>角色名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="name" id="name" data-options="required:true"
							style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>角色代号:</td>
						<td><input class="easyui-textbox" type="text" name="code" id="code"
							data-options="required:true,validType:'code'"></input></td>
						<td>系统角色:</td>
						<td><select class="easyui-combobox" id="isSystem" name="isSystem"  style="width: 148px">
								<option selected="selected" value="0">否</option>
								<option value="1">是</option>
						</select></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td><select class="easyui-combobox" id="status" name="status" style="width: 148px">
								<option selected="selected" value="1">启用</option>
								<option value="0">禁用</option>
						</select></td>
						<td>排序：</td>
						<td><input class="easyui-textbox" type="text" name="sequence" id="sequence" value="10"
							data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>描述:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="comment" id="comment"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="edit-role-dlg" title="编辑角色">
		<form id="edit-form" name="edit-form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
					<tr>
						<td>角色名称:</td>
						<td colspan="3">
						<input class="easyui-textbox" type="text" name="name" id="edit-name"
							data-options="required:true" style="width: 380px"></input>
							<input id="edit-role-id" type="hidden" name="roleId" />
							</td>
					</tr>
					<tr>
						<td>角色代号:</td>
						<td><input class="easyui-textbox" type="text" name="code" id="edit-code"
							data-options="required:true,validType:code"></input></td>
						<td>系统角色:</td>
						<td><select class="easyui-combobox" id="edit-isSystem" name="isSystem" style="width: 148px">
								<option selected="selected" value="0">否</option>
								<option value="1">是</option>
						</select></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td><select class="easyui-combobox" id="edit-status" name="status"  style="width: 148px">
								<option selected="selected" value="1">启用</option>
								<option value="0">禁用</option>
						</select></td>
						<td>排序：</td>
						<td><input class="easyui-textbox" type="text" name="sequence" id="edit-sequence" value="10"
							data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>描述:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="comment" id="edit-comment"
							data-options="required:true" style="width: 380px"></input></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<div id="perm-tree-dlg" title="给角色授权">
		<form id="perm-tree-form" name="perm-tree-form" method="post">
			<div id="perm-tree-dlg-layout" class="easyui-layout" style="width:542px;height:381px;">
					<!-- 左边tree -->
					<div id="west" data-options="region:'west',split:true,collapsible:false" title="权限树" style="width: 250px;">
						<div id="perm-tree"></div>
					</div>
					<div id="center" data-options="region:'center'" title="可查看的设备参数属性">
						<div id="param-props" class="checkboxlist" style="padding: 5px; border: none;">
								<input type="checkbox" name="deviceParamProps" id="prop_id" value="id" checked="checked" />编号<br />
								<input type="checkbox" name="deviceParamProps" id="prop_name" value="name" checked="checked" />名称<br />
								<input type="checkbox" name="deviceParamProps" id="prop_category_id" value="category_id" checked="checked"/>类别<br />
								<input type="checkbox" name="deviceParamProps" id="prop_mode" value="mode"/>读写属性<br /> 
								<input type="checkbox" name="deviceParamProps" id="prop_unit" value="unit"/>单位 <br />
								<input type="checkbox" name="deviceParamProps" id="prop_ratio" value="ratio"/>传输比或系数<br />
								<input type="checkbox" name="deviceParamProps" id="prop_value_type" value="value_type"/>值数据类型<br />
								<input type="checkbox" name="deviceParamProps" id="prop_value_len" value="value_len"/>值数据长度<br />
								<input type="checkbox" name="deviceParamProps" id="prop_value_min_len" value="value_min_len"/>值数据最小长度<br />		
								<input type="checkbox" name="deviceParamProps" id="prop_value_max_len" value="value_max_len"/>值数据最大长度<br /> 
								<input type="checkbox" name="deviceParamProps" id="prop_min_value" value="min_value"/>参数最小值<br />		
								<input type="checkbox" name="deviceParamProps" id="prop_max_value" value="max_value"/>参数最大值<br /> 
								<input type="checkbox" name="deviceParamProps" id="prop_warn_level" value="warn_level"/>告警级别<br />
								<input id="operations" type="hidden" name="operations" />
								<input id="perm-role-id" type="hidden" name="roleId" />
							</div>
					</div>
					</div>	
		</form>	
			
	</div>
	
</body>
</html>