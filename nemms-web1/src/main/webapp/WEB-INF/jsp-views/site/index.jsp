<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-站点管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<script src="<%=request.getContextPath()%>/assets/js/plugin/select2/select2.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/libs/socket.io-1.3.5.js"></script>
</head>
<body class="easyui-layout" id="site">
	<div data-options="region:'west',split:true" title="站点信息" style="width: 220px;">
		<div class="toolbar">
			<a data-options="iconCls:'icon-add'" class="easyui-linkbutton l-btn" href="#" onclick="$('#w').window('open')">添加</span></a>
			<a data-options="iconCls:'icon-reload'" class="easyui-linkbutton l-btn" href="#" id="">刷新</span></a>

		</div>
		<div class="easyui-panel" style="padding: 5px; border: none">
			<ul class="easyui-tree">
				<li><span>My Documents</span>
					<ul>
						<li data-options="state:'closed'"><span>Photos</span>
							<ul>
								<li><span>Friend</span></li>
								<li><span>Wife</span></li>
								<li><span>Company</span></li>
							</ul></li>
						<li><span>Program Files</span>
							<ul>
								<li>Intel</li>
								<li>Java</li>
								<li>Microsoft Office</li>
								<li>Games</li>
							</ul></li>
						<li>index.html</li>
						<li>about.html</li>
						<li>welcome.html</li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div data-options="region:'center'">

		<div class="toolbar">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-filter',plain:true">获取监控列表</span></a> <a class="easyui-linkbutton"
				data-options="iconCls:'icon-search',plain:true" href="#" id="">查看全部</span></a> <a class="easyui-linkbutton"
				data-options="iconCls:'icon-reload',plain:true" href="#" id="">刷新</span></a>
		</div>

		<div class="easyui-tabs" style="height: 60%">
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

		<div class="easyui-tabs">
			<div title="使用设备" style="padding: 0px">
				<table class="easyui-datagrid" style="height: 100%;"
					data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
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
			<div title="使用设备" style="padding: 0px">
				<table class="easyui-datagrid" style="height: 100%;"
					data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
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

	<div id="w" class="easyui-window" title="添加站点" data-options="iconCls:'icon-save',closed:true"
		style="width: 560px; height: 380px; padding: 10px;">
		<form id="ff" method="post">
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
						<td colspan="3"><input class="easyui-textbox" type="text" name="email" data-options="required:true"
							style="width: 380px"></input></td>

					</tr>
					<tr>

						<td>站点顺序:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
						<td>站点备注:</td>
						<td><input class="easyui-textbox" type="text" name="email" data-options="required:true"></input></td>
					</tr>
				</table>
			</center>
			<div style="text-align: center; padding: 5px">
				<a onclick="submitForm()" class="easyui-linkbutton l-btn l-btn-small" href="javascript:void(0)" group="" id=""><span
					class="l-btn-left"><span class="l-btn-text">保存</span></span></a> <a onclick="clearForm()"
					class="easyui-linkbutton l-btn l-btn-small" href="javascript:void(0)" group="" id=""><span class="l-btn-left"><span
						class="l-btn-text">取消</span></span></a>
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
