var membershipOperationPageUrl = XFrame.getContextPath() + '/membership/operation/';

$(function() {
	// 左边字典树
	$('#west').panel({
		tools : [
					{
						iconCls : 'icon-search',
						handler : MembershipOperation.searchNodeDlg.open
					},
					{
						iconCls : 'icon-add',
						handler : MembershipOperation.add
					},
					{
						iconCls : 'icon-reload',
						handler : function() {
							$('#MembershipOperationTree').tree('reload');
							EasyUIUtils.loadToDatagrid('#MembershipOperationGrid',
									membershipOperationPageUrl + 'list?id=0');
						}
					} ]
		});

	$('#MembershipOperationTree').tree({
		checkbox : false,
		method : 'get',
		url : membershipOperationPageUrl + 'listChildren',
		onClick : function(node) {
			$('#MembershipOperationTree').tree('expand', node.target);
			$('#MembershipOperationTree').tree('options').url = membershipOperationPageUrl + 'listChildren';
			EasyUIUtils.loadToDatagrid('#MembershipOperationGrid',membershipOperationPageUrl + 'list?id=' + node.id);
		},
		onContextMenu : function(e, node) {
			e.preventDefault();
			$('#MembershipOperationTree').tree('select', node.target);
			$('#tree_ctx_menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
	});

	// 配置字典grid
	$('#MembershipOperationGrid').datagrid({
		url : membershipOperationPageUrl + 'list',
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
			handler : MembershipOperation.add
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : MembershipOperation.edit
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : MembershipOperation.remove
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
			MembershipOperation.edit();
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

	$('#MembershipOperationDlg').dialog({
		closed : true,
		modal : true,
		width : 500,
		height : 350,
		iconCls:'icon-save',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#MembershipOperationDlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : MembershipOperation.save
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
	
	$('#btn-search').bind('click',MembershipOperation.searchNodeDlg.find);
});