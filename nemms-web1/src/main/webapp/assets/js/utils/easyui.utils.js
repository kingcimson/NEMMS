var EasyUIUtils = {
	add : function(dlgId, formId, actId, rowId, title) {
		$(formId).form('clear');
		$(actId).val("add");
		$(rowId).val(0);
		$(dlgId).dialog('open').dialog('setTitle', title);
		$(dlgId).dialog('center');
	},
	edit : function(dlgId, formId, actId, gridId, rowId, title) {
		var row = $(gridId).datagrid('getSelected');
		EasyUIUtils.editWithData(dlgId, formId, actId, rowId, title, row);
	},
	editWithData : function(dlgId, formId, actId, rowId, title, data) {
		EasyUIUtils.editWithCallback(dlgId, formId, actId, rowId, title, data, function(data) {
		});
	},
	editWithCallback : function(dlgId, formId, actId, rowId, title, data, callback) {
		if (data) {
			$(formId).form('clear');
			$(actId).val("edit");
			$(rowId).val(data.id);
			$(dlgId).dialog('open').dialog('setTitle', title);
			$(dlgId).dialog('center');
			$(formId).form('load', data);
			callback(data);
		} else {
			EasyUIUtils.showMsg("请您先选择一个选项!");
		}
	},
	remove : function(gridId, gridUrl) {
		var row = $(gridId).datagrid('getSelected');
		EasyUIUtils.removeWithCallback(row, 'remove', {
			id : row.id
		}, function(data) {
			EasyUIUtils.loadToDatagrid(gridId, gridUrl);
		});
	},
	removeWithActUrl : function(gridId, gridUrl, actUrl) {
		var row = $(gridId).datagrid('getSelected');
		EasyUIUtils.removeWithCallback(row, actUrl, {
			id : row.id
		}, function(data) {
			EasyUIUtils.loadToDatagrid(gridId, gridUrl);
		});
	},
	removeWithCallback : function(data, postUrl, postData, callback) {
		if (!data) {
			return EasyUIUtils.showMsg("请您先选择要删除的记录!");
		}
		return $.messager.confirm('删除', '您确定要删除记录吗?', function(r) {
			if (r) {
				$.post(postUrl, postData, function(result) {
					if (result.success) {
						EasyUIUtils.showMsg(result.msg);
						callback(data);
					} else {
						$.messager.show({
							title : '错误',
							msg : result.msg
						});
					}
				}, 'json');
			}
		});
	},
	batchRemove : function(gridId, gridUrl) {
		var rows = $(gridId).datagrid('getChecked');
		var ids = $.map(rows, function(row) {
			return row.id;
		}).join();
		EasyUIUtils.removeWithCallback(rows, 'batchRemove', {
			id : ids
		}, function(data) {
			EasyUIUtils.loadToDatagrid(gridId, gridUrl);
		});
	},
	batchRemoveWithActUrl : function(gridId, gridUrl, actUrl) {
		var rows = $(gridId).datagrid('getChecked');
		var ids = $.map(rows, function(row) {
			return row.id;
		}).join();
		EasyUIUtils.removeWithCallback(rows, actUrl, {
			id : ids
		}, function(data) {
			EasyUIUtils.loadToDatagrid(gridId, gridUrl);
		});
	},
	save : function(dlgId, formId, actId, gridId, gridUrl) {
		var action = $(actId).val();
		EasyUIUtils.saveWithCallback(dlgId, formId, action, function() {
			EasyUIUtils.loadToDatagrid(gridId, gridUrl);
		});
	},
	saveWithActUrl : function(dlgId, formId, actId, gridId, gridUrl, actRootUrl) {
		var action = actRootUrl + $(actId).val();
		EasyUIUtils.saveWithCallback(dlgId, formId, action, function() {
			EasyUIUtils.loadToDatagrid(gridId, gridUrl);
		});
	},
	saveWithCallback : function(dlgId, formId, postUrl, callback) {
		$(formId).form('submit', {
			url : postUrl,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(data) {
				var result = $.parseJSON(data)
				if (result.success) {
					EasyUIUtils.showMsg(result.msg);
					callback();
					$(dlgId).dialog('close');
				} else {
					$.messager.show({
						title : '错误',
						msg : result.msg
					});
				}
			}
		});
	},
	loadToDatagrid : function(id, href) {
		var grid = $(id);
		grid.datagrid('clearSelections');
		grid.datagrid({
			url : href
		});
	},
	reloadDatagrid : function(id) {
		$(id).datagrid('reload');
	},
	clearDatagrid : function(id) {
		$(id).datagrid('loadData', {
			total : 0,
			rows : []
		});
	},
	parseJSON : function(json) {
		if (json == null || json == "") {
			return null;
		}
		return $.parseJSON(json);
	},
	showMsg : function(msg) {
		$.messager.show({
			title : '提示',
			msg : msg,
			timeout : 3000,
			showType : 'slide'
		});
	},
	showLongMsg : function(msg, time) {
		$.messager.show({
			title : '提示',
			msg : msg,
			timeout : time,
			showType : 'slide'
		});
	},
	numberFormatter : function(value) {
		return format("#,###.", value);
	},
	closeCurrentTab : function(id) {
		var tab = $(id).tabs('getSelected');
		var options = tab.panel('options');
		if (options.closable) {
			$(id).tabs('close', tab.panel('options').title);
		}
	},
	closeOthersTab : function(id) {
		var currentTab = $(id).tabs('getSelected');
		var currTitle = currentTab.panel('options').title;
		$('.tabs-inner span').each(function(i, n) {
			var title = $(n).text();
			var tab = $(id).tabs('getTab', title);
			if (tab) {
				var options = tab.panel('options');
				if (title != currTitle && options.closable) {
					$(id).tabs('close', title);
				}
			}
		});
	},
	closeAllTab : function(id) {
		$('.tabs-inner span').each(function(i, n) {
			var title = $(n).text();
			var tab = $(id).tabs('getTab', title);
			if (tab) {
				var options = tab.panel('options');
				if (options.closable) {
					$(id).tabs('close', title);
				}
			}
		});
	}
};