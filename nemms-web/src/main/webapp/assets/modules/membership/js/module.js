var membershipModulePageUrl = XFrame.getContextPath() + '/membership/module/';

$(function() {
	$('#module-treegrid').treegrid({
				method : 'get',
				fit : true,
				fitColumns : true,
				singleSelect : true,
				pagination : true,
				rownumbers : true,
				pageSize : 50,
				url : membershipModulePageUrl + 'list',
				toolbar : [ {
					iconCls : 'icon-add',
					handler : function() {
						MembershipModule.add();
					}
				}, '-', {
					iconCls : 'icon-edit1',
					handler : function() {
						MembershipModule.edit();
					}
				}, '-', {
					iconCls : 'icon-pwd',
					handler : function() {
						MembershipModule.resetPwd();
					}
				}, '-', {
					iconCls : 'icon-remove1',
					handler : function() {
						MembershipModule.remove();
					}
				}, '-', {
					iconCls : 'icon-reload',
					handler : function() {
						EasyUIUtils.reloadDatagrid('#module-treegrid');
					}
				} ],
				columns : [ [
						{
							field : 'userId',
							title : '用户ID',
							width : 50,
							sortable : true
						},
						{
							field : 'account',
							title : '账号',
							width : 100,
							sortable : true
						},
						{
							field : 'name',
							title : '姓名',
							width : 80,
							sortable : true,
						},
						{
							field : 'telephone',
							title : '电话',
							width : 50,
							sortable : true
						},
						{
							field : 'email',
							title : '邮箱',
							width : 80,
							sortable : true
						},
						{
							field : 'status',
							title : '状态',
							width : 50,
							sortable : true,
							formatter : function(value, row, index) {
								return value == 1 ? "正常" : "暂停";
							}
						},
						{
							field : 'createTime',
							title : '创建时间',
							width : 50,
							sortable : true
						},
						{
							field : 'options',
							title : '操作',
							width : 100,
							formatter : function(value, row, index) {
								var imgPath = XFrame.getContextPath() + '/assets/icons/';
								var icons = [ {
									"name" : "edit",
									"title" : "编辑"
								}, {
									"name" : "pwd",
									"title" : "修改密码"
								}, {
									"name" : "remove",
									"title" : "删除"
								} ];
								var buttons = [];
								for (var i = 0; i < icons.length; i++) {
									var tmpl = '<a href="#" title ="{{title}}" '
											+ 'onclick="MembershipModule.execOptionAction(\'{{index}}\',\'{{name}}\')">'
											+ '<img src="{{imgSrc}}" alt="{{title}}"/"></a>';
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
				onDblClickRow : function(rowIndex, rowData) {
					return MembershipModule.edit(rowIndex, rowData);
				}
			});

	// dialogs
	$('#add-module-dlg').dialog({
		closed : true,
		modal : false,
		width : 560,
		height : 450,
		iconCls : 'icon-add',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#add-module-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : MembershipModule.save
		} ]
	});

	$('#edit-module-dlg').dialog({
		closed : true,
		modal : false,
		width : 560,
		height : 400,
		iconCls : 'icon-edit',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#edit-module-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : MembershipModule.save
		} ]
	});

	$('#reset-pwd-dlg').dialog({
		closed : true,
		modal : false,
		width : 560,
		height : 250,
		iconCls : 'icon-pwd',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#reset-pwd-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : MembershipModule.save
		} ]
	});
	// buttons
	$('#btn-search').bind('click', MembershipModule.find);

	MembershipModule.init();

	// end
});

var MembershipModule = {
	roleDict : {},
	init : function() {
		MembershipModule.loadRoleList();
	},
	loadRoleList : function() {
		$.getJSON(XFrame.getContextPath() + '/membership/role/getRoleList', function(data) {
			MembershipModule.roleDict = data;
		});
	},
	execOptionAction : function(index, name) {
		$('#module-treegrid').datagrid('selectRow', index);
		if (name == "edit") {
			return MembershipModule.edit();
		}
		if (name == "remove") {
			return MembershipModule.remove();
		}
		if (name == "pwd") {
			return MembershipModule.resetPwd();
		}
	},
	fillRoleCombox : function(act,values) {
		var id = act == "add" ? "#add-combox-roles" : "#edit-combox-roles";
		$(id).combobox('clear');
		var data = [];
		var items = MembershipModule.roleDict;
		for (var i = 0; i < items.length; i++) {
			var item = items[i];
			data.push({
				"value" : item.id,
				"name" : item.name,
				"selected" : i == 0
			});
		}
		$(id).combobox('loadData', data);
		if(act == "edit"){
			$(id).combobox('setValues',values);
		}
	},
	add : function() {
		$('#add-module-dlg').dialog('open').dialog('center');
		$("#modal-action").val("add");
		$("#add-form").form('reset');
		MembershipModule.fillRoleCombox("add",[]);
	},
	edit : function() {
		var row = $('#module-treegrid').datagrid('getSelected');
		if (row) {
			$('#edit-module-dlg').dialog('open').dialog('center');
			$("#modal-action").val("edit");
			$("#edit-form").form('reset');
			$("#edit-account").text(row.account);
			var roleIds = row.roles || "";
			MembershipModule.fillRoleCombox("edit", roleIds.split(','));
			$("#edit-form").form('load', row);
		} else {
			$.messager.alert('警告', '请选中一条记录!', 'info');
		}
	},
	resetPwd : function() {
		var row = $('#module-treegrid').datagrid('getSelected');
		if (row) {
			$('#reset-pwd-dlg').dialog('open').dialog('center');
			$("#modal-action").val("resetPwd");
			$("#reset-pwd-form").form('clear');
			$("#reset-moduleId").val(row.userId);
			$("#reset-account").text(row.account);
		} else {
			$.messager.alert('警告', '请选中一条记录!', 'info');
		}
	},
	find : function() {
		var fieldName = $("#field-name").combobox('getValue');
		var keyword = $("#keyword").val();
		var url = membershipModulePageUrl + 'find?fieldName=' + fieldName + '&keyword=' + keyword;
		EasyUIUtils.loadToDatagrid('#module-treegrid', url)
	},
	remove : function() {
		var gridUrl = membershipModulePageUrl + 'list';
		var actUrl = membershipModulePageUrl + 'remove';
		return EasyUIUtils.removeWithIdFieldName('#module-treegrid', gridUrl, actUrl, "userId");
	},
	save : function() {
		var action = $('#modal-action').val();
		if (action == "resetPwd") {
			var url = membershipModulePageUrl + 'updateUserPasswordById';
			EasyUIUtils.saveWithCallback('#reset-pwd-dlg', '#reset-pwd-form', url, function() {
			});
		} else {
			var formId = action == "edit" ? "#edit-form" : "#add-form";
			var dlgId = action == "edit" ? "#edit-module-dlg" : "#add-module-dlg";
			var comboxRoleId = action == "edit" ? "#edit-combox-roles" : "#add-combox-roles";
			var roleId = action == "edit" ? "#edit-roles" : "#add-roles";
			var roles =  $(comboxRoleId).combobox('getValues');
			$(roleId).val(roles);
			var gridUrl = membershipModulePageUrl + 'list';
			return EasyUIUtils.saveWithActUrl(dlgId, formId, '#modal-action', '#module-treegrid', gridUrl,
					membershipModulePageUrl);
		}
	},
};
