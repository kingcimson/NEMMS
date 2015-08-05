
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
</head>
<body class="easyui-layout">
	<table class="easyui-datagrid" title="设备参数" style=""
		data-options="iconCls:'icon-ok',singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get',toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80" sortable="true">ID</th>
				<th data-options="field:'productid',width:100" sortable="true">监控标识</th>
				<th data-options="field:'listprice',width:80" sortable="true">MCP协议</th>
				<th data-options="field:'unitcost',width:80" sortable="true">名称</th>
				<th data-options="field:'attr1',width:250" sortable="true">类别</th>
				<th data-options="field:'status',width:60" sortable="true">模式</th>
				<th data-options="field:'status',width:60" sortable="true">单位</th>
				<th data-options="field:'status',width:60" sortable="true">系数</th>
				<th data-options="field:'status',width:60" sortable="true">值类型</th>
				<th data-options="field:'status',width:60" sortable="true">值长度</th>
				<th data-options="field:'status',width:60" sortable="true">值最小长度</th>
				<th data-options="field:'status',width:60" sortable="true">值最大长度</th>
				<th data-options="field:'status',width:60" sortable="true">权限归属</th>
				<th data-options="field:'status',width:60" sortable="true">警告级别</th>
				<th data-options="field:'status',width:60" sortable="true">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding: 2px 5px;">
		类型 <select class="easyui-combobox" panelHeight="auto" style="width: 100px">
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
		<input name="" type="text">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search">搜索</a>&nbsp;<a onclick="$('#w').window('open')" href="#" class="easyui-linkbutton"
				iconCls="icon-add">添加</a>
	</div>
	<div class="easyui-panel">
		<div class="easyui-pagination" data-options="total:114"></div>
	</div>
	</div>
	<div id="w" class="easyui-window" title="添加" data-options="iconCls:'icon-save',closed:true" style="width: 560px; height: 500px; padding: 10px;">
		<form id="ff" method="post">
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
			<div style="text-align: center; padding: 5px">
				<a onclick="submitForm()" class="easyui-linkbutton l-btn l-btn-small" href="javascript:void(0)" group="" id=""><span class="l-btn-left"><span
						class="l-btn-text">保存</span></span></a> <a onclick="clearForm()" class="easyui-linkbutton l-btn l-btn-small" href="javascript:void(0)" group="" id=""><span
					class="l-btn-left"><span class="l-btn-text">取消</span></span></a>
			</div>
		</form>
		<script>
			function submitForm() {
				$('#ff').form('submit');
			}
			function clearForm() {
				$('#ff').form('clear');
			}
		</script>
</body>
</html>