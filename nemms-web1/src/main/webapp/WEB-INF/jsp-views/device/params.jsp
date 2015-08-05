
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-参数管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/js/libs/socket.io-1.3.5.js"></script>
<script src="<%=request.getContextPath()%>/assets/modules/device/js/params.js"></script>
</head>
<body class="easyui-layout">
	<div id="toolbar" class="toolbar">
		类型 :<select class="easyui-combobox" panelHeight="auto" style="width: 100px">
			<option value="java">全部</option>
			<option value="c">C</option>
			<option value="basic">Basic</option>
			<option value="perl">Perl</option>
			<option value="python">Python</option>
		</select> <select class="easyui-combobox" panelHeight="auto" style="width: 100px">
			<option value="java">名称</option>
			<option value="c">C</option>
			<option value="basic">Basic</option>
			<option value="perl">Perl</option>
			<option value="python">Python</option>
		</select> 关键字
		<input name="" type="text" />
		<a href="#" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	</div>
	<div id="param-datagrid"></div>
	<div id="add-param-dlg" class="easyui-window" title="添加" data-options="iconCls:'icon-save',closed:true"
		style="width: 560px; height: 500px; padding: 10px;">
		<form id="add_form" name="add_form" method="post">
			<center>
				<table cellpadding="5" style="margin: 30px auto" class="table1">
					<tr>
						<td>名称:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>监控标识:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
						<td>MCP协议类型:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
					</tr>
					<tr>
						<td>类别:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
						<td>模式:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
					</tr>
					<tr>
						<td>系数:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
						<td>单位:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
					</tr>
					<tr>
						<td>值类型:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
						<td>值长度:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>值最小长度:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
						<td>值最大长度:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>最小值:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
						<td>最大值:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>警告级别:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
						<td>权限归属:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
					</tr>
					<tr>
						<td>参考控件:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
						<td>参数配置项:</td>
						<td><select class="easyui-combobox" name="language">
								<option value="ar">Arabic</option>
								<option value="bg">Bulgarian</option>
						</select></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>