
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>北京裕源大通网元监控与管理系统-站点管理</title>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/skins/terrace/dhtmlxtree.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/select2/select2.css">
<script src="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/select2/select2.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/libs/socket.io-1.3.5.js"></script>
</head>


<body class="easyui-layout">

                 <table id="dg" class="easyui-datagrid"  style="width:100%;height:100%"
			data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: 'datagrid_data1.json',
				method: 'get',
				onClickCell: onClickCell
			">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">ID</th>
				<th data-options="field:'productid',width:100,
						formatter:function(value,row){
							return row.productname;
						},
						editor:{
							type:'combobox',
							options:{
								valueField:'productid',
								textField:'productname',
								method:'get',
								url:'products.json',
								required:true
							}
						}">账号</th>
				<th data-options="field:'listprice',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}">姓名</th>
				<th data-options="field:'unitcost',width:80,align:'right',editor:'numberbox'">电话</th>
				<th data-options="field:'attr1',width:250,editor:'textbox'">邮箱</th>
				<th data-options="field:'status',width:60,align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">状态</th>
                <th data-options="field:'date',width:60,align:'center'">创建时间</th>
                <th data-options="field:'operate',width:60,align:'center'">操作</th>
			</tr>
		</thead>
	</table>
               <div id="tb" style="padding:2px 5px;">
		
		 账号
		<select class="easyui-combobox" panelHeight="auto" style="width:100px">
			<option value="java">dd</option>
			<option value="c">C</option>
			<option value="basic">Basic</option>
			<option value="perl">Perl</option>
			<option value="python">Python</option>
		</select>
        关键字<input name="" type="text">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search">搜索</a>&nbsp;<a href="#" onclick="$('#w').window('open')" class="easyui-linkbutton" iconCls="icon-add">添加</a>
	</div>
			<div class="easyui-panel" >
		      <div class="easyui-pagination" data-options="total:114"></div>
	         </div>
            
           
            
		</div>
	
  
  
  
  
  
  
  
   <div id="w" class="easyui-window" title="添加用户" data-options="iconCls:'icon-save',closed:true" style="width:560px;height:500px;padding:10px;">
		
        
        
        
        <form id="ff" method="post">
          <center>
	    	<table cellpadding="5" style="margin:30px auto"  class="table1">
	    		<tr>
	    			<td>用户账号:</td>
	    			<td colspan="3"><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width:380px"></input></td>
                    
	    		</tr>
	    		<tr>
	    			<td>登陆密码:</td>
	    			<td colspan="3"><input class="easyui-textbox" type="text" name="password" data-options="required:true" style="width:380px"></input></td>
                 </tr>
                 <tr>    
	                 <td>确认密码:</td>
	    			<td colspan="3"><input class="easyui-textbox" type="text" name="password1" data-options="required:true" style="width:380px"></input></td>
        		</tr>
                <tr>
	    			<td>真实姓名:</td>
	    			<td colspan="3"><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width:380px"></input></td>
               </tr>
               <tr>   
	             <td>电话:</td>
	    			<td colspan="3"><input class="easyui-textbox" type="text" name="tel" data-options="required:true" style="width:380px"></input></td>
        		</tr>
                
                 <tr>
	    			<td>Email:</td>
	    			<td colspan="3"><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width:380px"></input></td>
                    </tr>
                    <tr>
	                 <td>状态:</td>
	    			<td colspan="3">
                      <select class="easyui-combobox" name="language">
                        <option value="ar">Arabic</option>
                        <option value="bg">Bulgarian</option>
                      </select>
                    
                    </td>
        		</tr>
                
                 <tr>
	                 <td>所属角色:</td>
	    			<td colspan="3">
                      <input name="" type="checkbox" value="">超级管理员
                      <input name="" type="checkbox" value="">超级管理员
                      <input name="" type="checkbox" value="">超级管理员
                    
                    </td>
        		</tr>
                
                
                 <tr>
	    			
	                 <td>备注:</td>
	    			<td colspan="3">
                      <input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width:380px"></input>
                    
                    </td>
                   
        		</tr>
              
                
	    		
	    	</table>
            </center>
            <div style="text-align:center;padding:5px">
	    	<a onclick="submitForm()" class="easyui-linkbutton l-btn l-btn-small" href="javascript:void(0)" group="" id=""><span class="l-btn-left"><span class="l-btn-text">保存</span></span></a>
	    	<a onclick="clearForm()" class="easyui-linkbutton l-btn l-btn-small" href="javascript:void(0)" group="" id=""><span class="l-btn-left"><span class="l-btn-text">取消</span></span></a>
	    </div>
	    </form>
        
        
        
        
        

    
     <script>
		function submitForm(){
			$('#ff').form('submit');
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>  
  
  
        
       
		<script type="text/javascript">
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true}
			if ($('#dg').datagrid('validateRow', editIndex)){
				var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
				var productname = $(ed.target).combobox('getText');
				$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
				$('#dg').datagrid('endEdit', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function onClickCell(index, field){
			if (editIndex != index){
				if (endEditing()){
					$('#dg').datagrid('selectRow', index)
							.datagrid('beginEdit', index);
					var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
					($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
					editIndex = index;
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
		function append(){
			if (endEditing()){
				$('#dg').datagrid('appendRow',{status:'P'});
				editIndex = $('#dg').datagrid('getRows').length-1;
				$('#dg').datagrid('selectRow', editIndex)
						.datagrid('beginEdit', editIndex);
			}
		}
		function removeit(){
			if (editIndex == undefined){return}
			$('#dg').datagrid('cancelEdit', editIndex)
					.datagrid('deleteRow', editIndex);
			editIndex = undefined;
		}
		function accept(){
			if (endEditing()){
				$('#dg').datagrid('acceptChanges');
			}
		}
		function reject(){
			$('#dg').datagrid('rejectChanges');
			editIndex = undefined;
		}
		function getChanges(){
			var rows = $('#dg').datagrid('getChanges');
			alert(rows.length+' rows are changed!');
		}
	</script>

</body>
</html>