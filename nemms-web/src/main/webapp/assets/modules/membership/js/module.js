var membershipModulePageUrl = XFrame.getContextPath() + '/membership/module/';

$(function() {
	$('#module-treegrid').treegrid({
				idField:'moduleId',
			    treeField:'name',
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
				},'-', {
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
							field : 'moduleId',
							title : 'ID',
							width : 50,
							sortable : true
						},
						{
							field : 'parentId',
							title : '父ID',
							width : 50,
							sortable : true
						},
						{
							field : 'name',
							title : '名称',
							width : 80,
							sortable : true,
						},
						{
							field : 'code',
							title : '编号',
							width : 50,
							sortable : true
						},
						{
							field : 'icon',
							title : '图标',
							width : 50,
							formatter : function(value, row, index) {
								var fileName = value.replace("icon-","");
								var imgSrc = XFrame.getContextPath() + '/assets/js/frames/easyui/themes/icons/'+fileName;
								return '<img src="'+imgSrc +'.png" alt="图标"/">'
							}
						},
						{
							field : 'url',
							title : 'URL',
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
							field : 'sequence',
							title : '顺序',
							width : 50,
							sortable : true
						},
						{
							field : 'comment',
							title : '说明',
							width : 50,
							sortable : true
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
				},
				onClickRow:function(row){
					
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
		iconCls : 'icon-edit1',
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

	// buttons
	$('#btn-search').bind('click', MembershipModule.find);
	
	// end
});

var MembershipModule = {
	execOptionAction : function(index, name) {
		$('#module-treegrid').datagrid('selectRow', index);
		if (name == "edit1") {
			return MembershipModule.edit();
		}
		if (name == "remove") {
			return MembershipModule.remove();
		}
	},
	add : function() {
		$('#add-module-dlg').dialog('open').dialog('center');
		$("#modal-action").val("add");
		$("#add-form").form('reset');
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
