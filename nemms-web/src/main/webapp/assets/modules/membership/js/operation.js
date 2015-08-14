var membershipOptPageUrl = XFrame.getContextPath() + '/membership/operation/';

$(function() {
	// 左边模块树
	$('#west').panel({
		tools : [
					{
						iconCls : 'icon-add',
						handler : MembershipOpt.add
					},
					{
						iconCls : 'icon-reload',
						handler : function() {
							$('#module-tree').tree('reload');
							EasyUIUtils.clearDatagrid('#opt-datagrid');
						}
					} ]
		});

	$('#module-tree').tree({
		checkbox : false,
		method : 'get',
		url : XFrame.getContextPath() + '/membership/module/getChildren',
		onClick : function(node) {
			$('#module-tree').tree('expand', node.target);
			$('#module-tree').tree('options').url = XFrame.getContextPath() + '/membership/module/getChildren';
			EasyUIUtils.loadToDatagrid('#opt-datagrid',membershipOptPageUrl + 'list?id=' + node.id);
		},
		onContextMenu : function(e, node) {
			e.preventDefault();
			$('#module-tree').tree('select', node.target);
			$('#tree_ctx_menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
	});

	// 权限grid
	$('#opt-datagrid').datagrid({
		url : membershipOptPageUrl + 'list',
		method : 'get',
		pageSize : 50,
		fit : true,
		pagination : true,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		toolbar : [ {
			text : '增加',
			iconCls : 'icon-add',
			handler : MembershipOpt.add
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit1',
			handler : MembershipOpt.edit
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : MembershipOpt.remove
		} ],
		columns : [ [ {
			field : 'id',
			title : '标识',
			width : 50
		}, {
			field : 'name',
			title : '名称',
			width : 80,
			sortable : true
		},
		{
			field : 'code',
			title : '代号',
			width : 120,
			sortable : true,
		}, {
			field : 'sequence',
			title : '顺序',
			width : 50
		}, {
			field : 'comment',
			title : '说明',
			width : 100
		}, {
			field : 'createTime',
			title : '创建时间',
			width : 100
		}, {
			field : 'updateTime',
			title : '更新时间',
			width : 100
		} ] ],
		onDblClickRow : function(index, row) {
			MembershipOpt.edit();
		}
	});
	
	$('#opt-dlg').dialog({
		closed : true,
		modal : true,
		width : 500,
		height : 300,
		iconCls:'icon-save',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#opt-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : MembershipOpt.save
		} ]
	});
});

var MembershipOpt = {
		treeContextMenu : function(item) {
			if (item.name == "add") {
				return MembershipOpt.add();
			}
			return;
		},
		add : function() {
			var node = $('#module-tree').tree('getSelected');
			if (node) {
				EasyUIUtils.add('#opt-dlg', '#opt-form', '#optAction',
						'#optId', '新增[' + node.text + ']模块的权限');
				$('#moduleId').val(node.id);
				$("#code").textbox('setValue',node.attributes.code+":");
				$("#sequence").textbox('setValue',10);
			}
			else{
				$.messager.alert('警告', '请选中指定的模块!', 'info');
			}
		},
		edit : function() {
			var row = $('#opt-datagrid').datagrid('getSelected');
			if(row){
				EasyUIUtils.editWithData('#opt-dlg', '#opt-form',
						'#optAction', '#optId', '修改[' + row.name + ']权限', row);
				$("#opt-form").form('reset');
				$("#opt-form").form('load', row);
			}
			else{
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
		},
		remove : function() {
			var row = $('#opt-datagrid').datagrid('getSelected');
			EasyUIUtils.removeWithCallback(row, membershipOptPageUrl + 'remove', {
				id : row ? row.operationId : 0
			}, function(data) {
				MembershipOpt.refreshNode(data.moduleId);
				EasyUIUtils.loadToDatagrid('#opt-datagrid', membershipOptPageUrl
						+ 'list?id=' + data.moduleId);
			});
		},
		save : function() {
			var moduleId = $('#moduleId').val();
			var url = membershipOptPageUrl + 'list?id=' + moduleId;
			var actUrl = membershipOptPageUrl + $('#optAction').val();
			EasyUIUtils.saveWithCallback('#opt-dlg', '#opt-form',
					actUrl, function() {
						MembershipOpt.refreshNode(moduleId);
						EasyUIUtils.loadToDatagrid('#opt-datagrid', url);
					});
		},
		refreshNode : function(pid) {
			if (pid == "0") {
				$('#module-tree').tree('reload');
			} else {
				var node = $('#module-tree').tree('find', pid);
				$('#module-tree').tree('select', node.target);
				$('#module-tree').tree('reload', node.target);
			}
		}
	};