var membershipRolePageUrl = XFrame.getContextPath() + '/membership/role/';

$(function() {
	$('#role-datagrid').datagrid({
				method : 'get',
				fit : true,
				fitColumns : true,
				singleSelect : true,
				pagination : true,
				rownumbers : true,
				pageSize : 50,
				url : membershipRolePageUrl + 'list',
				toolbar : [ {
					iconCls : 'icon-add',
					handler : function() {
						MembershipRole.add();
					}
				}, '-', {
					iconCls : 'icon-edit1',
					handler : function() {
						MembershipRole.edit();
					}
				}, '-', {
					iconCls : 'icon-pwd',
					handler : function() {
						MembershipRole.resetPwd();
					}
				}, '-', {
					iconCls : 'icon-remove1',
					handler : function() {
						MembershipRole.remove();
					}
				}, '-', {
					iconCls : 'icon-reload',
					handler : function() {
						EasyUIUtils.reloadDatagrid('#role-datagrid');
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
											+ 'onclick="MembershipRole.execOptionAction(\'{{index}}\',\'{{name}}\')">'
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
					return MembershipRole.edit(rowIndex, rowData);
				}
			});

	// dialogs
	$('#add-role-dlg').dialog({
		closed : true,
		modal : false,
		width : 560,
		height : 450,
		iconCls : 'icon-add',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#add-role-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : MembershipRole.save
		} ]
	});

	$('#edit-role-dlg').dialog({
		closed : true,
		modal : false,
		width : 560,
		height : 400,
		iconCls : 'icon-edit',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#edit-role-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : MembershipRole.save
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
			handler : MembershipRole.save
		} ]
	});
	// buttons
	$('#btn-search').bind('click', MembershipRole.find);

	MembershipRole.init();

	// end
});

var MembershipRole = {
	roleDict : {},
	init : function() {
		MembershipRole.loadRoleList();
	},
	loadRoleList : function() {
		$.getJSON(XFrame.getContextPath() + '/membership/role/getRoleList', function(data) {
			MembershipRole.roleDict = data;
		});
	},
	execOptionAction : function(index, name) {
		$('#role-datagrid').datagrid('selectRow', index);
		if (name == "edit") {
			return MembershipRole.edit();
		}
		if (name == "remove") {
			return MembershipRole.remove();
		}
		if (name == "pwd") {
			return MembershipRole.resetPwd();
		}
	},
	fillRoleCombox : function(act,values) {
		var id = act == "add" ? "#add-combox-roles" : "#edit-combox-roles";
		$(id).combobox('clear');
		var data = [];
		var items = MembershipRole.roleDict;
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
		$('#add-role-dlg').dialog('open').dialog('center');
		$("#modal-action").val("add");
		$("#add-form").form('reset');
		MembershipRole.fillRoleCombox("add",[]);
	},
	edit : function() {
		var row = $('#role-datagrid').datagrid('getSelected');
		if (row) {
			$('#edit-role-dlg').dialog('open').dialog('center');
			$("#modal-action").val("edit");
			$("#edit-form").form('reset');
			$("#edit-account").text(row.account);
			var roleIds = row.roles || "";
			MembershipRole.fillRoleCombox("edit", roleIds.split(','));
			$("#edit-form").form('load', row);
		} else {
			$.messager.alert('警告', '请选中一条记录!', 'info');
		}
	},
	resetPwd : function() {
		var row = $('#role-datagrid').datagrid('getSelected');
		if (row) {
			$('#reset-pwd-dlg').dialog('open').dialog('center');
			$("#modal-action").val("resetPwd");
			$("#reset-pwd-form").form('clear');
			$("#reset-roleId").val(row.userId);
			$("#reset-account").text(row.account);
		} else {
			$.messager.alert('警告', '请选中一条记录!', 'info');
		}
	},
	find : function() {
		var fieldName = $("#field-name").combobox('getValue');
		var keyword = $("#keyword").val();
		var url = membershipRolePageUrl + 'find?fieldName=' + fieldName + '&keyword=' + keyword;
		EasyUIUtils.loadToDatagrid('#role-datagrid', url)
	},
	remove : function() {
		var gridUrl = membershipRolePageUrl + 'list';
		var actUrl = membershipRolePageUrl + 'remove';
		return EasyUIUtils.removeWithIdFieldName('#role-datagrid', gridUrl, actUrl, "userId");
	},
	save : function() {
		var action = $('#modal-action').val();
		if (action == "resetPwd") {
			var url = membershipRolePageUrl + 'updateUserPasswordById';
			EasyUIUtils.saveWithCallback('#reset-pwd-dlg', '#reset-pwd-form', url, function() {
			});
		} else {
			var formId = action == "edit" ? "#edit-form" : "#add-form";
			var dlgId = action == "edit" ? "#edit-role-dlg" : "#add-role-dlg";
			var comboxRoleId = action == "edit" ? "#edit-combox-roles" : "#add-combox-roles";
			var roleId = action == "edit" ? "#edit-roles" : "#add-roles";
			var roles =  $(comboxRoleId).combobox('getValues');
			$(roleId).val(roles);
			var gridUrl = membershipRolePageUrl + 'list';
			return EasyUIUtils.saveWithActUrl(dlgId, formId, '#modal-action', '#role-datagrid', gridUrl,
					membershipRolePageUrl);
		}
	},
};