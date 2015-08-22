var siteMgrPageUrl = XFrame.getContextPath() + '/device/site/';
$(function() {

	$('#west').panel({
		tools : [ {
			iconCls : 'icon-search',
			handler : SiteMgr.dialogs.searchSiteDlg.open
		}, {
			iconCls : 'icon-add',
			handler : SiteMgr.siteTree.addSiteNode
		}, {
			iconCls : 'icon-reload',
			handler : SiteMgr.siteTree.reload
		} ]
	});

	$('#site-tree').tree({
		checkbox : false,
		method : 'get',
		animate : true,
		dnd : true,
		url : siteMgrPageUrl + 'listChildNodes',
		onLoadSuccess : function(node, data) {
			$.messager.progress("close");
		},
		onClick : function(node) {
			$('#site-tree').tree('options').url = siteMgrPageUrl + 'listChildNodes';
			$('#site-tree').tree('expand', node.target);
			SiteMgr.paramTabs.displayParamList(node.attributes.uid);
		},
		onDblClick : function(node) {
			SiteMgr.siteTree.edit();
		},
		onBeforeLoad : function(node, param) {
			$.messager.progress({
				title : '请稍后...',
				text : '数据正在加载中...',
			});
		},
		onContextMenu : function(e, node) {
			e.preventDefault();
			$('#site-tree').tree('select', node.target);
			$('#site-tree-ctx-menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
	});

	$('#param-tabs').tabs({
		tools : [ {
			iconCls : 'icon-fullscreen',
			handler : function() {
				$('#fullscreen-param-tabs-dlg').dialog('open').dialog('center');
			}
		} ]
	});
	$('#console-tabs').tabs({
		tools : [ {
			iconCls : 'icon-fullscreen',
			handler : function() {
				$('#fullscreen-console-tabs-dlg').dialog('open').dialog('center');
			}
		} ]
	});

	// datagrids
	$('#console-datagrid').datagrid({
		fit : true,
		pagination : false,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		// pageSize : 10,
		toolbar : [ {
			iconCls : 'icon-clear1',
			handler : function() {
				EasyUIUtils.clearDatagrid('#console-datagrid');
			}
		}, '-', {
			iconCls : 'icon-reload',
			handler : function() {
				EasyUIUtils.reloadDatagrid('#console-datagrid');
			}
		} ],
		columns : [ [ {
			field : 'id',
			title : '标识',
			width : 50
		}, {
			field : 'name',
			title : '操作'
		}, {
			field : 'sendData',
			title : '发送内容',
			width : 150
		}, {
			field : 'recvData',
			title : '接收内容',
			width : 150
		}, {
			field : 'createUser',
			title : '操作用户',
			width : 50
		}, {
			field : 'createTime',
			title : '操作时间',
			width : 50
		} ] ],
		onDblClickRow : function(index, row) {
		}
	});

	$('#connected-device-datagrid').datagrid({
		method : 'get',
		fit : true,
		pagination : false,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		// pageSize : 10,
		toolbar : [ {
			iconCls : 'icon-clear1',
			handler : function() {
				EasyUIUtils.clearDatagrid('#connected-device-datagrid');
			}
		}, '-', {
			iconCls : 'icon-reload',
			handler : function() {
				EasyUIUtils.reloadDatagrid('#connected-device-datagrid');
			}
		} ],
		columns : [ [ {
			field : 'id',
			title : '标识',
			width : 50
		}, {
			field : 'uid',
			title : '站点/设备编号',
			width : 100
		}, {
			field : 'clientIP',
			title : '设备IP',
			width : 100
		}, {
			field : 'serverIP',
			title : '服务器IP',
			width : 100
		}, {
			field : 'serverPort',
			title : '服务器端口',
			width : 80
		}, {
			field : 'createTime',
			title : '建立连接时间',
			width : 100
		} ] ],
		onDblClickRow : function(index, row) {
		}
	});

	$('#schedule-task-datagrid').datagrid({
		fit : true,
		pagination : false,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		// pageSize : 10,
		toolbar : [ {
			iconCls : 'icon-reload',
			handler : function() {
				EasyUIUtils.reloadDatagrid('#console-datagrid');
			}
		} ],
		columns : [ [ {
			field : 'id',
			title : '标识',
			width : 50
		}, {
			field : 'name',
			title : '操作'
		}, {
			field : 'sendData',
			title : '发送内容',
			width : 150
		}, {
			field : 'recvData',
			title : '接收内容',
			width : 150
		}, {
			field : 'createUser',
			title : '操作用户',
			width : 50
		}, {
			field : 'createTime',
			title : '操作时间',
			width : 50
		} ] ],
		onDblClickRow : function(index, row) {
		}
	});

	$('#search-site-result').datagrid({
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
			field : 'uid',
			title : '编号',
			width : 70
		}, {
			field : 'path',
			title : '路径',
			width : 150
		} ] ],
		onDblClickRow : function(index, row) {
		}
	});

	// dialogs
	$('#add-site-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 380,
		iconCls : 'icon-add',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#add-site-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.siteTree.saveNode
		} ]
	});

	$('#edit-site-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 380,
		iconCls : 'icon-edit',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#edit-site-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.siteTree.saveNode
		} ]
	});

	$('#add-device-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 280,
		iconCls : 'icon-add',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#add-device-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.siteTree.saveNode
		} ]
	});

	$('#edit-device-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 280,
		iconCls : 'icon-edit',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#edit-device-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.siteTree.saveNode
		} ]
	});

	$('#search-site-dlg').dialog({
		closed : true,
		modal : true,
		width : window.screen.width - 550,
		height : window.screen.height - 350,
		maximizable : true,
		iconCls : 'icon-search',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#search-site-dlg").dialog('close');
			}
		} ]
	});

	$('#fullscreen-param-tabs-dlg').dialog({
		closed : true,
		modal : true,
		width : window.screen.width - 300,
		height : window.screen.height - 350,
		maximizable : true,
		iconCls : 'icon-item',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#fullscreen-param-tabs-dlg").dialog('close');
			}
		} ]
	});

	$('#fullscreen-console-tabs-dlg').dialog({
		closed : true,
		modal : true,
		width : window.screen.width - 300,
		height : window.screen.height - 350,
		maximizable : true,
		iconCls : 'icon-console',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#fullscreen-console-tabs-dlg").dialog('close');
			}
		} ]
	});

	// buttons
	$('#btn-search-site').bind('click', SiteMgr.siteTree.search);
	$('#btn-query-item').bind('click', SiteMgr.toolbar.queryAllItems);
	$('#btn-query-all').bind('click', SiteMgr.toolbar.queryAllValues);
	$('#btn-edit').bind('click', SiteMgr.toolbar.setup);
	$('#btn-cancel').bind('click', SiteMgr.toolbar.cancel);
	$('#btn-clear').bind('click', SiteMgr.toolbar.clear);

	// end
});

var SiteMgr = {
	dataDict : {},
	paramOption : {},
	categories : [],
	init : function() {
		SiteMgr.loadConfigItems();
	},
	loadConfigItems : function() {
		var url = XFrame.getContextPath() + '/system/dict/getDepth1Items'
		$.getJSON(url, {
			parentKey : "deviceType"
		}, function(data) {
			SiteMgr.dataDict["deviceType"] = data;
		});

		var url = XFrame.getContextPath() + '/system/dict/getDepth2Items'
		$.getJSON(url, {
			parentKey : "monitorParam"
		}, function(data) {
			SiteMgr.dataDict["apProtocol"] = data.apProtocol;
			SiteMgr.dataDict["mcpProtocol"] = data.mcpProtocol;
			SiteMgr.dataDict["protocol"] = data.protocol;
		});

		$.getJSON(XFrame.getContextPath() + '/system/dict/getDepth2Items', {
			parentKey : "paramOption"
		}, function(data) {
			SiteMgr.paramOption = data;
		});

		$.getJSON(XFrame.getContextPath() + '/system/dict/getDepth1Items', {
			parentKey : "deviceParamCategory"
		}, function(data) {
			SiteMgr.categories = data;
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var title = category.name + "参数";
				var id = "param-tab" + category.value;
				var listId = id + "-list";
				var content = "<div id=\"" + id + "\" style=\"padding: 10px;\">" + "<div style=\"height:500px\">"
						+ "<div class=\"easyui-datagrid\" id=\"" + listId + "\"></div>" + "</div>" + "</div>";
				$('#param-tabs').tabs('add', {
					title : title,
					content : content
				});
				
				$('#' + listId).datagrid({
					fit : true,
					pagination : false,
					rownumbers : true,
					fitColumns : true,
					singleSelect : false,
					columns : [ [ {
						field : 'ck',
						checkbox : true,
						width : 50
					}, {
						field : 'paramUid',
						title : '参数标识',
						width : 50
					}, {
						field : 'name',
						title : '名称',
						width : 200
					}, {
						field : 'valueType',
						title : '类型',
						width : 50
					}, {
						field : 'value',
						title : '值',
						width : 100,
						formatter : function(value, row, index) {
							if(row.mode == 'ro'){
								return value;
							}
							var id = "value" + index;
							if(row.htmlElem == "select"){
								var tmpl = '\
										<select id="{{id}}" name="{{id}}" style="width:150px">\
										{{each list}}\
											<option value="{{$value.value}}" {{if $value.value == currValue}}selected{{/if}}>{{$value.name}}</option>\
										{{/each}}\
										</select>';
								return template.compile(tmpl)({
									id : id,
									currValue : value,
									list : SiteMgr.paramOption[row.htmlElemKey] 
								});
							}
							var tmpl = '<input type="text" id="{{id}}" name="value" value="{{value}}" style="width:150px"/>';
							return template.compile(tmpl)({
								id : id,
								value : value
							});
						}
					}, {
						field : 'createTime',
						title : '更新时间',
						width : 80
					} ] ]
				});
			}
			$('#param-tabs').tabs('select', 0);
		});
	},
	initCombox : function(act) {
		var prefix = act == "addSite" ? "#" : "#edit-";
		var map = SiteMgr.dataDict;
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
			$(prefix + key).combobox('loadData', data);
		}
	},
	siteTree : {
		addSiteNode : function() {
			SiteMgr.dialogs.addSiteNodeDlg.open();
			$("#add-site-form").form('reset');
			$("#modal-action").val("addSite");
			SiteMgr.initCombox('addSite');
			$('#uid').textbox('setValue', "0x");
			$('#sequence').textbox('setValue', "10");
			$('#ipAddr').textbox('setValue', "127.0.0.1");
			$('#port').textbox('setValue', "8000");
		},
		addDeviceNode : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				SiteMgr.dialogs.addDeviceNodeDlg.open();
				$("#add-device-form").form('reset');
				$("#modal-action").val("addDevice");
				$("#device-pid").val(node.id);
				$('#device-sequence').textbox('setValue', "10");
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		edit : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var meta = node.attributes;
				if (meta.flag == 0) {
					SiteMgr.dialogs.editSiteNodeDlg.open();
					SiteMgr.siteTree.editSiteNode(meta);
				} else {
					SiteMgr.dialogs.editDeviceNodeDlg.open();
					SiteMgr.siteTree.editDeviceNode(meta);
				}
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		editSiteNode : function(meta) {
			$("#edit-site-form").form('reset');
			$("#modal-action").val("editSite");
			SiteMgr.initCombox('editSite');
			$("#edit-site-form").form('load', meta);
		},
		editDeviceNode : function(meta) {
			$("#edit-device-form").form('reset');
			$("#modal-action").val("editDevice");
			$("#edit-device-form").form('load', meta);
		},
		saveNode : function() {
			var act = $("#modal-action").val();
			var actUrl = "";
			var formId = "";
			var dlgId = "";

			if (act == "addSite") {
				actUrl = siteMgrPageUrl + "addSite";
				formId = "#add-site-form";
				dlgId = "#add-site-dlg";
			} else if (act == "editSite") {
				actUrl = siteMgrPageUrl + "editSite";
				formId = "#edit-site-form";
				dlgId = "#edit-site-dlg";
			} else if (act == "addDevice") {
				actUrl = siteMgrPageUrl + "addDevice";
				formId = "#add-device-form";
				dlgId = "#add-device-dlg";
			} else if (act == "editDevice") {
				actUrl = siteMgrPageUrl + "editDevice";
				formId = "#edit-device-form";
				dlgId = "#edit-device-dlg";
			}
			EasyUIUtils.saveWithCallback(dlgId, formId, actUrl, function() {
				SiteMgr.siteTree.reload();
			});
		},
		remove : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var postData = {
					id : node.id,
					pid : node.attributes.pid
				};
				var postUrl = siteMgrPageUrl + 'remove';
				EasyUIUtils.removeWithCallback(node, postUrl, postData, function(data) {
					SiteMgr.siteTree.reload();
				});
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		getSelectedTreeNode : function() {
			return $('#site-tree').tree('getSelected');
		},
		reload : function() {
			$('#site-tree').tree('reload');
		},
		search : function() {
			var fieldName = $('#field-name').combobox('getValue');
			var keyword = $('#keyword').val();
			var url = siteMgrPageUrl + 'search?fieldName=' + fieldName + '&keyword=' + keyword;
			return EasyUIUtils.loadToDatagrid('#search-site-result', url);
		},
		contextMenu : {
			onSelect : function(item) {
				if (item.name == "addSite") {
					return SiteMgr.siteTree.addSiteNode();
				}
				if (item.name == "addDevice") {
					return SiteMgr.siteTree.addDeviceNode();
				}
				if (item.name == "edit") {
					return SiteMgr.siteTree.edit();
				}
				if (item.name == "remove") {
					return SiteMgr.siteTree.remove();
				}
				if (item.name == "search") {
					return SiteMgr.dialogs.searchSiteDlg.open();
				}
				if (item.name == "refresh") {
					return SiteMgr.siteTree.reload();
				}
				return;
			}
		}
	// end
	},
	toolbar : {
		queryAllItems : function() {
		},
		queryAllValues : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var siteUid = node.attributes.uid;
				SiteMgr.paramTabs.displayParamList(siteUid);
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		setup : function() {

		},
		cancel : function() {

		},
		clear : function() {

		}
	// end
	},
	paramTabs : {
		displayParamList : function(siteUid) {
			$.getJSON(siteMgrPageUrl + 'queryAllValues', {
				siteUid : siteUid
			}, function(map) {
				SiteMgr.paramTabs.clear();
				for ( var key in map) {
					var listId = "#param-tab" + key + "-list";
					var data = map[key];
					$(listId).datagrid('loadData', data);
				}
			});	
		},
		clear:function(){
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var listId = "#param-tab" + category.value + "-list";			
				EasyUIUtils.clearDatagrid(listId);
			}
			$('#param-tabs').tabs('select', 0);
		}
	// end
	},
	consoleTabs : {

	// end
	},
	dialogs : {
		addSiteNodeDlg : {
			open : function() {
				$('#add-site-dlg').dialog('open').dialog('center');
			}
		},
		editSiteNodeDlg : {
			open : function() {
				$('#edit-site-dlg').dialog('open').dialog('center');
			}
		},
		addDeviceNodeDlg : {
			open : function() {
				$('#add-device-dlg').dialog('open').dialog('center');
			}
		},
		editDeviceNodeDlg : {
			open : function() {
				$('#edit-device-dlg').dialog('open').dialog('center');
			}
		},
		searchSiteDlg : {
			open : function() {
				$('#search-site-dlg').dialog('open').dialog('center');
				EasyUIUtils.clearDatagrid('#search-site-result');
			}
		}
	}
// end
};

SiteMgr.init();