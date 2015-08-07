var membershipOptPageUrl = XFrame.getContextPath() + '/membership/operation/';

$(function() {
	// 左边字典树
	$('#west').panel({
		tools : [
					{
						iconCls : 'icon-search',
						handler : MembershipOpt.searchNodeDlg.open
					},
					{
						iconCls : 'icon-add',
						handler : MembershipOpt.add
					},
					{
						iconCls : 'icon-reload',
						handler : function() {
							$('#module-tree').tree('reload');
							EasyUIUtils.loadToDatagrid('#opt-datagrid',
									membershipOptPageUrl + 'list?id=0');
						}
					} ]
		});

	$('#module-tree').tree({
		checkbox : false,
		method : 'get',
		url : membershipOptPageUrl + 'listChildren',
		onClick : function(node) {
			$('#module-tree').tree('expand', node.target);
			$('#module-tree').tree('options').url = membershipOptPageUrl + 'listChildren';
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

	// 配置字典grid
	$('#opt-datagrid').datagrid({
		url : membershipOptPageUrl + 'list',
		method : 'get',
		idField : 'id',
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
			width : 100
		}, {
			field : 'key',
			title : '键',
			width : 100
		}, {
			field : 'value',
			title : '值',
			width : 100
		}, {
			field : 'sequence',
			title : '顺序',
			width : 50
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
	
	$('#search-node-result').datagrid({
		method : 'get',
		fit : true,
		pagination : true,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		pageSize : 10,
		columns : [ [ {
			field : 'id',
			title : '标识',
			width : 50
		}, {
			field : 'pid',
			title : '父标识',
			hidden : true
		}, {
			field : 'name',
			title : '名称',
			width : 150
		}, {
			field : 'key',
			title : '对应键',
			width : 100
		}, {
			field : 'value',
			title : '对应值',
			width : 100
		} ] ],
		onDblClickRow : function(index, row) {
		}
	});

	$('#opt-dlg').dialog({
		closed : true,
		modal : true,
		width : 500,
		height : 350,
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
	
	$('#search-node-dlg').dialog({
		closed : true,
		modal : true,
		width : window.screen.width - 550,
		height : window.screen.height - 350,
		maximizable:true,
		iconCls:'icon-search',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#search-node-dlg").dialog('close');
			}
		} ]
	});
	
	$('#btn-search').bind('click',MembershipOpt.searchNodeDlg.find);
});

var MembershipOpt = {
		treeContextMenu : function(item) {
			if (item.name == "add") {
				return MembershipOpt.add();
			}
			if (item.name == "edit") {
				return MembershipOpt.edit();
			}
			if (item.name == "remove") {
				return MembershipOpt.remove();
			}
			if (item.name == "find") {
				return MembershipOpt.searchNodeDlg.open();
			}
			return;
		},
		add : function() {
			var name = "根节点";
			var id = "0";
			var node = $('#module-tree').tree('getSelected');

			if (node) {
				var configNode = node.attributes;
				name = configNode.name;
				id = configNode.id;
			}
			EasyUIUtils.add('#configDictDlg', '#configDictForm', '#configDictAction',
							'#configDictId', '新增[' + name + ']配置字典的子项');
			$("#configDictPid").val(id);
			$("#configDictPNameDiv").show();
			$("#configDictPName").html(name);
			$("#sequence").textbox('setValue',10);
		},
		edit : function() {
			$("#configDictPNameDiv").hide();
			var row = $('#configDictGrid').datagrid('getSelected');
			var node = $('#module-tree').tree('getSelected');
			node = node ? node.attributes : null;
			row = row || node;
			EasyUIUtils.editWithData('#configDictDlg', '#configDictForm',
					'#configDictAction', '#configDictId', '修改[' + row.name + ']配置字典项', row);
		},
		remove : function() {
			var row = $('#configDictGrid').datagrid('getSelected');
			var node = $('#module-tree').tree('getSelected');
			node = node ? node.attributes : null;
			row = row || node;

			EasyUIUtils.removeWithCallback(row, configDictPageUrl + 'remove', {
				id : row ? row.id : 0
			}, function(data) {
				MembershipOpt.refreshNode(data.pid);
				EasyUIUtils.loadToDatagrid('#configDictGrid', configDictPageUrl
						+ 'list?id=' + data.pid);
			});
		},
		save : function() {
			var pid = $("#configDictPid").val();
			var url = configDictPageUrl + 'list?id=' + pid;
			var actUrl = configDictPageUrl + $('#configDictAction').val();
			EasyUIUtils.saveWithCallback('#configDictDlg', '#configDictForm',
					actUrl, function() {
						MembershipOpt.refreshNode(pid);
						EasyUIUtils.loadToDatagrid('#configDictGrid', url);
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
		},
		searchNodeDlg:{
			open:function(){
				$('#search-node-dlg').dialog('open').dialog('center');
				EasyUIUtils.clearDatagrid('#search-node-result');
			},
			find :function() {
				var fieldName = $('#field-name').combobox('getValue');
				var keyword = $('#keyword').val();
				var url = configDictPageUrl + 'find?fieldName=' + fieldName + '&keyword=' + keyword;
				return EasyUIUtils.loadToDatagrid('#search-node-result', url);
			},
		}
	};