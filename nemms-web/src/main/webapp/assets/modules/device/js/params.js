var deviceParamPageUrl = XFrame.getContextPath() + '/device/params/';

$(function() {
	$('#param-datagrid').datagrid({
		method : 'get',
		fit : true,
		fitColumns : true,
		singleSelect : true,
		pagination : true,
		rownumbers : true,
		pageSize : 50,
		url : deviceParamPageUrl + 'list',
		toolbar: [{
			iconCls: 'icon-add',
			handler: function(){
				DeviceParam.add();
			}
		},'-',{
			iconCls: 'icon-edit1',
			handler: function(){
				DeviceParam.edit();
			}
		},'-',{
			iconCls: 'icon-copy',
			handler: function(){
				DeviceParam.copy();
			}
		},'-',{
			iconCls: 'icon-remove1',
			handler: function(){
				DeviceParam.remove();
			}
		},'-',{
			iconCls: 'icon-reload',
			handler: function(){
				EasyUIUtils.reloadDatagrid('#param-datagrid');
			}
		}],
		columns : [ [ {
			field : 'id',
			title : '记录ID',
			width : 50,
			sortable : true
		}, {
			field : 'paramId',
			title : '参数标识',
			width : 50,
			sortable : true
		}, {
			field : 'mcpId',
			title : 'MCP协议',
			width : 50,
			sortable : true,
			formatter : function(value, row, index) {	
				var result =$.grep(DeviceParam.mcpProtocolDict,function(item,i){
					return item.value == value 
				});
				return result.length ? result[0].name : "其他";
			}
		}, {
			field : 'name',
			title : '名称',
			width : 100,
			sortable : true
		}, {
			field : 'categoryId',
			title : '类别',
			width : 50,
			sortable : true,
			formatter : function(value, row, index) {
				var categories = DeviceParam.deviceParamDict.deviceParamCategory;
				var result =$.grep(categories,function(item,i){
					return item.value == value 
				});
				return result.length ? result[0].name : "其他";
			}
		}, {
			field : 'mode',
			title : '模式',
			width : 50,
			sortable : true,
			formatter : function(value, row, index) {
				var categories = DeviceParam.deviceParamDict.deviceParamMode;
				var result =$.grep(categories,function(item,i){
					return item.value == value 
				});
				return result.length ? result[0].name : "其他";
			}
		}, {
			field : 'unit',
			title : '单位',
			width : 50,
			sortable : true
		}, {
			field : 'ratio',
			title : '系数',
			width : 30,
			sortable : true
		}, {
			field : 'valueType',
			title : '值类型',
			width : 50,
			sortable : true,
			formatter : function(value, row, index) {	
				var result =$.grep(DeviceParam.deviceParamDict.deviceParamValueType,function(item,i){
					return item.value == value 
				});
				return result.length ? result[0].name : "其他";
			}
		}, {
			field : 'valueLen',
			title : '值长度',
			width : 50,
			sortable : true
		}, {
			field : 'valueMinLen',
			title : '值最小长度',
			width : 80,
			sortable : true
		}, {
			field : 'valueMaxLen',
			title : '值最大长度',
			width : 80,
			sortable : true
		}, {
			field : 'authorityRoles',
			title : '权限归属',
			width : 50,
			sortable : true
		}, {
			field : 'warnLevel',
			title : '告警级别',
			width : 100,
			sortable : true,
			formatter : function(value, row, index) {	
				var categories = DeviceParam.deviceParamDict.deviceParamWarnLevel;
				var result =$.grep(categories,function(item,i){
					return item.value == value 
				});
				return result.length ? result[0].name : "其他";
			}
		}, {
			field : 'options',
			title : '操作',
			width : 100,
			formatter : function(value, row, index) {
				var imgPath = XFrame.getContextPath() + '/assets/icons/';
				var icons = [ {
					"name" : "edit",
					"title" : "编辑"
				},{
					"name" : "copy",
					"title" : "复制"
				}, {
					"name" : "remove",
					"title" : "删除"
				} ];
				var buttons = [];
				for (var i = 0; i < icons.length; i++) {
					var tmpl = '<a href="#" title ="{{title}}" onclick="DeviceParam.execOptionAction(\'{{index}}\',\'{{name}}\')"><img src="{{imgSrc}}" alt="{{title}}"/"></a>';
					var data = {
							title : icons[i].title,
							name : icons[i].name,
							index : index,
							imgSrc : imgPath + icons[i].name + ".png"
					};						
					buttons.push(template.compile(tmpl)(data));
				}
				return buttons.join(' ');
			}
		} ] ],
		onDblClickRow : function(rowIndex, rowData){
			return DeviceParam.edit();
		}
	});
	
	//dialogs
	$('#add-param-dlg').dialog({
		closed : true,
		modal : true,
		width : 660,
		height : 450,
		iconCls:'icon-add',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#add-param-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : DeviceParam.save
		} ]
	});
	$('#edit-param-dlg').dialog({
		//width : window.screen.width - 280,
		//height : window.screen.height - 250,
		closed : true,
		modal : true,
		width : 660,
		height : 450,
		iconCls:'icon-edit',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#edit-param-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : DeviceParam.save
		} ]
	});

	DeviceParam.bindEvents();
	//end
});

var DeviceParam = {
		deviceParamDict : null,
		mcpProtocolDict:null,
		paramOptionDict:null,
		authorityRolesDict:null,
		init:function(){
			DeviceParam.loadConfigItems();
		},
		bindEvents:function(){
			$('#btn-search').bind('click',DeviceParam.find);
		},
		loadConfigItems : function() {
			var url = XFrame.getContextPath() + '/system/dict/getDepth2Items'
			$.getJSON(url, {
				parentKey : "deviceParam"
			}, function(data) {
				DeviceParam.deviceParamDict = data;
				$('#filter-category-id').combobox('clear');
				var data = [];
				data.push({
					"value" : 'all',
					"name" : '全部',
					"selected" : true
				});
				$.each(DeviceParam.deviceParamDict.deviceParamCategory, function(i, item) {
					data.push({
						"value" : item.value,
						"name" : item.name
					});
				});
				$('#filter-category-id').combobox('loadData',data);
			});
			
			$.getJSON(XFrame.getContextPath() + '/system/dict/getDepth1Items', {
				parentKey : "mcpProtocol"
			}, function(data) {
				DeviceParam.mcpProtocolDict = data;
			});
			
			$.getJSON(XFrame.getContextPath() + '/system/dict/getDepth1Items', {
				parentKey : "paramOption"
			}, function(data) {
				DeviceParam.paramOptionDict = data;
			});
			
			$.getJSON( XFrame.getContextPath() + '/membership/role/getRoleList',null,function(data){
				DeviceParam.authorityRolesDict = [];
				$.each(data, function(i, item) {
					DeviceParam.authorityRolesDict.push({
						"value" : item.id,
						"name" : item.name
					});
				});
			});
		},
		initCombox:function(act){
			var map = {
					"categoryId" : DeviceParam.deviceParamDict.deviceParamCategory,
					"mode" : DeviceParam.deviceParamDict.deviceParamMode,
					"valueType" : DeviceParam.deviceParamDict.deviceParamValueType,
					"warnLevel" : DeviceParam.deviceParamDict.deviceParamWarnLevel,
					"mcpId" : DeviceParam.mcpProtocolDict,
					"htmlElemKey" : DeviceParam.paramOptionDict,
					"authorityRoles" : DeviceParam.authorityRolesDict	
			};
			DeviceParam.fillCombox(act,map);
		},
		fillCombox:function(act,map){
			var prefix = act=="add" ? "#" : "#edit-";
			for ( var key in map) {
				$(prefix + key).combobox('clear');
				var data = [];
				var items = map[key];
				for (var i = 0; i < items.length; i++) {
					var item = items[i];
					data.push({
						"value" : item.value,
						"name" : item.name,
						"selected" : i == 0
					});
				}
				$(prefix + key).combobox('loadData',data);
			}
		},
		execOptionAction:function(index,name){
			$('#param-datagrid').datagrid('selectRow',index);
			if(name=="edit"){
				return DeviceParam.edit();
			}
			if(name=="copy"){
				return DeviceParam.copy();
			}
			if(name=="remove"){
				return DeviceParam.remove();
			}
		},
		add : function() {
			$('#add-param-dlg').dialog({
				iconCls : 'icon-add',
				title:'添加设备参数'
			});
			$('#add-param-dlg').dialog('open').dialog('center');
			$("#modal-action").val("add");
			$("#add-form").form('reset');
			DeviceParam.initCombox("add");
		},
		edit : function() {
			var row = $('#param-datagrid').datagrid('getSelected');
			if (row) {
				$('#edit-param-dlg').dialog('open').dialog('center');
				$("#modal-action").val("edit");
				$("#edit-form").form('reset');
				DeviceParam.initCombox("edit");
				$("#edit-form").form('load',row);
			} else {
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
		},
		copy : function() {
			var row = $('#param-datagrid').datagrid('getSelected');
			if (row) {
				$('#add-param-dlg').dialog({
					iconCls : 'icon-copy',
					title:'复制设备参数'
				});
				$('#add-param-dlg').dialog('open').dialog('center');
				$("#modal-action").val("add");
				$("#add-form").form('reset');
				DeviceParam.initCombox("add");
				$("#add-form").form('load',row);
			} else {
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
		},
		find : function() {
			var categoryId = $('#filter-category-id').combobox('getValue');
			var fieldName = $("#field-name").combobox('getValue');
			var keyword = $("#keyword").val();
			var url = deviceParamPageUrl + 'find?categoryId=' + categoryId+ '&fieldName=' + fieldName + '&keyword=' + keyword;
			EasyUIUtils.loadToDatagrid('#param-datagrid', url)
		},
		save : function() {
			var action = $('#modal-action').val();
			var formId = action == "edit" ? "#edit-form" : "#add-form";
			var dlgId = action == "edit" ? "#edit-param-dlg" : "#add-param-dlg";
			var gridUrl = deviceParamPageUrl + 'list';
			EasyUIUtils.saveWithActUrl(dlgId, formId, '#modal-action', '#param-datagrid', gridUrl, deviceParamPageUrl);
		},
		remove:function(){
			var row = $('#param-datagrid').datagrid('getSelected');
			if (!row) {
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
			var gridUrl = deviceParamPageUrl + 'list';
			var actUrl = deviceParamPageUrl + 'remove';
			return EasyUIUtils.removeWithActUrl('#param-datagrid', gridUrl, actUrl);
		}
};

DeviceParam.init();