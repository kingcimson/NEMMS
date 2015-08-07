
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-站点管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>

</head>
<body class="easyui-layout">
   <div id="toolbar" class="toolbar">
		账号:<select class="easyui-combobox" id="fieldName" name="fieldName" data-options="valueField:'value',textField:'name'" panelHeight="auto" style="width: 100px">
        <option value="account">账号</option>
		<option value="name">姓名</option>
        </select> 
		 
		关键字:<input class="easyui-textbox" type="text" id="Keyword" name="Keyword"/>
		<a id="search_user" href="#" class="easyui-linkbutton" iconCls="icon-search"> 搜索  </a>
		<input id="modal-action" type="hidden" name="action" value="" />
	</div>
    <div style="height: 95%; padding: 2px">
		<div id="user-datagrid"></div>
	</div>
    
    
    
    
    
    
    <div id="add-user-dlg" class="easyui-dialog" title="添加用户" style="width:560px;height:500px;padding:10px;">
		<form id="add-form" name="add-form" method="post">
			<center>
               
            
				<table cellpadding="5" style="margin: 30px auto" class="form-table">
                
                
                
                   <tr>
						<td>用户账号:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="account" name="account" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>登陆密码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="password" name="password" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>确认密码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="repassword" name="repassword" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>真实姓名:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="name" name="name" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="telephone" id="telephone" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="email" id="email" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td colspan="3">
                        
                        
                        <label class="input"> <select  class="easyui-combobox" id="status" name="status">
											<option value="1">正常</option>
											<option value="2">暂停</option>
									</select>
									</label>
                        
                        </td>
					</tr>
					<tr>
						<td>所属角色:</td>
						<td colspan="3">
                         
                          <label class="input"> <select  class="easyui-combobox"  name="js">
											<option value="1">超级管理员</option>
											<option value="2">产品管理员</option>
                                            <option value="3">产品运营人员</option>
									</select>
						  </label>
                        </td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="comment" id="comment" data-options="required:true" style="width: 380px"></input></td>
					</tr>
                
                </table>
					
			</center>
		</form>
	</div>
	<div id="edit-user-dlg" class="easyui-dialog" title="编辑用户信息" style="width:560px;height:500px;padding:10px;">
		<form id="edit-form" name="edit-form" method="post">
			<center>
            
            
               
               
               <table cellpadding="5" style="margin: 30px auto" class="form-table">
                
                
                
                   <tr>
						<td>用户账号:</td>
						<td colspan="3">admin</td>
					</tr>
					<tr>
						<td>登陆密码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="password" name="password" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>确认密码:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="repassword" name="repassword" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>真实姓名:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" id="name" name="name" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="telephone" id="telephone" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="email" id="email" data-options="required:true" style="width: 380px"></input></td>
					</tr>
					<tr>
						<td>状态:</td>
						<td colspan="3">
                        
                        
                        <label class="input"> <select  class="easyui-combobox" id="status" name="status">
											<option value="1">正常</option>
											<option value="2">暂停</option>
									</select>
									</label>
                        
                        </td>
					</tr>
					<tr>
						<td>所属角色:</td>
						<td colspan="3">
                         
                          <label class="input"> <select  class="easyui-combobox"  name="js">
											<option value="1">超级管理员</option>
											<option value="2">产品管理员</option>
                                            <option value="3">产品运营人员</option>
									</select>
						  </label>
                        </td>
					</tr>
					<tr>
						<td>备注:</td>
						<td colspan="3"><input class="easyui-textbox" type="text" name="comment" id="comment" data-options="required:true" style="width: 380px"></input></td>
					</tr>
                
                </table>
               
               
               
               
               
               
               
               
               
               
			</center>
		</form>
	</div>
    
    
    
    
    
    
    
    
    
    
    
    
   
</body>
</html>