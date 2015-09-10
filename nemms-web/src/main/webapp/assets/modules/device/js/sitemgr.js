var siteMgrPageUrl = XFrame.getContextPath() + '/device/site/';
var connInfoPageUrl = XFrame.getContextPath() + '/device/connInfo/';
var schedulePageUrl = XFrame.getContextPath() + '/device/schedule/';
var settingsPageUrl = XFrame.getContextPath() + '/system/settings/';
var nmsstatusPageUrl = XFrame.getContextPath() + '/device/nmsstatus/';

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
			EasyUIUtils.closeLoading();
		},
		onClick : function(node) {
			$('#site-tree').tree('options').url = siteMgrPageUrl + 'listChildNodes';
			$('#site-tree').tree('expand', node.target);
			SiteMgr.paramTabs.displayParamList(node.attributes.uid, 0);
		},
		onDblClick : function(node) {
			SiteMgr.siteTree.view();
		},
		onBeforeLoad : function(node, param) {
			EasyUIUtils.loading();
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
		} ],
		columns : [ [ {
			field : 'name',
			title : '操作',
			width : 60
		}, {
			field : 'content',
			title : '说明',
			width : 300
		}, {
			field : 'createTime',
			title : '操作时间',
			width : 70
		} ] ],
		onDblClickRow : function(index, row) {
		    $('#console-info-dlg').dialog('open').dialog('center');
		    $('#console-detail-info').text(row.content);
		}
	});

	$('#connected-device-datagrid').datagrid({
		method : 'get',
		fit : true,
		pagination : false,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		url : connInfoPageUrl + 'list',
		toolbar : [ {
			iconCls : 'icon-add',
			handler : function() {
				SiteMgr.conn.add();
			}
		}, '-', {
			iconCls : 'icon-edit1',
			handler : function() {
				SiteMgr.conn.edit();
			}
		}, '-', {
			iconCls : 'icon-remove',
			handler : function() {
				SiteMgr.conn.remove();
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
			field : 'siteUid',
			title : '站点/设备编号',
			width : 100
		}, {
			field : 'clientIp',
			title : '设备IP',
			width : 100
		}, {
			field : 'serverIp',
			title : '服务器IP',
			width : 100
		}, {
			field : 'serverPort',
			title : '服务器端口',
			width : 80
		}, {
			field : 'status',
			title : '状态',
			width : 80,
			formatter : function(value, row, index) {
				return value == "1" ? "正常" : "断开";
			}
		}, {
			field : 'startTime',
			title : '建立连接时间',
			width : 100
		} ] ],
		onDblClickRow : function(index, row) {
			SiteMgr.conn.edit();
		}
	});

	$('#schedule-task-datagrid').datagrid({
		fit : true,
		pagination : false,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		url : schedulePageUrl + 'list',
		// pageSize : 10,
		toolbar : [ {
			iconCls : 'icon-edit1',
			handler : function() {
				SiteMgr.schedule.edit();
			}
		}, '-', {
			iconCls : 'icon-remove',
			handler : function() {
				SiteMgr.schedule.remove();
			}
		}, '-', {
			iconCls : 'icon-reload',
			handler : function() {
				EasyUIUtils.reloadDatagrid('#schedule-task-datagrid');
			}
		} ],
		columns : [ [ {
			field : 'id',
			title : '标识',
			width : 50
		}, {
			field : 'peroid',
			title : '频率',
			width : 50
		}, {
			field : 'interval',
			title : '间隔',
			width : 50
		}, {
			field : 'startTime',
			title : '开始时间',
			width : 80
		}, {
			field : 'times',
			title : '次数',
			width : 50
		}, {
			field : 'comment',
			title : '说明',
			width : 80
		} ] ],
		onDblClickRow : function(index, row) {
			SiteMgr.schedule.view();
		}
	});
	
	$('#nbi-datagrid').datagrid({
		fit : true,
		pagination : false,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		// pageSize : 10,
		url : nmsstatusPageUrl + 'list',
		toolbar : [ {
			iconCls : 'icon-reload',
			handler : function() {
				EasyUIUtils.reloadDatagrid('#nbi-datagrid');
			}
		} ],
		columns : [ [ {
			field : 'id',
			title : '标识',
			width : 50
		}, {
			field : 'nmsName',
			title : 'nms名称',
			width : 80
		},{
			field : 'serviceName',
			title : '服务名称',
			width : 80
		},{
			field : 'serviceUrl',
			title : '服务URL',
			width : 100
		},{
			field : 'serviceStatus',
			title : '服务状态',
			width : 50,
			formatter : function(value, row, index) {
				return value == "1" ? "正常" : "异常";
			}
		},{
			field : 'updateTime',
			title : '列新时间',
			width : 80
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
		width : 600,
		height : 450,
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
		width : 600,
		height : 450,
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

	$('#view-site-dlg').dialog({
		closed : true,
		modal : true,
		width : 600,
		height : 450,
		iconCls : 'icon-item1',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#view-site-dlg").dialog('close');
			}
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

	$('#view-device-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 280,
		iconCls : 'icon-item1',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#view-device-dlg").dialog('close');
			}
		} ]
	});
	
	$('#console-info-dlg').dialog({
		closed : true,
		modal : false,
		maximizable:true,
		width : window.screen.width - 650,
		height : window.screen.height - 350,
		iconCls:'icon-info',
		buttons : [ {
			text : '上一条',
			iconCls : 'icon-prev',
			handler : function() {
			    var index = parseInt($('#current-row-index').val()) - 1;
				$('#console-datagrid').datagrid('selectRow', index);
				var row = $('#console-datagrid').datagrid('getSelected');
				if (row) {
					$('#current-row-index').val(index);
					$('#console-detail-info').text(row.content);
				} else {
					$('#console-datagrid').datagrid('selectRow', index + 1);
					$.messager.alert('失败', '当前已到第一条记录!', 'error');
				}
			}
		}, {
			text : '下一条',
			iconCls : 'icon-next',
			handler : function() {
			    var index = parseInt($('#current-row-index').val()) + 1;
				$('#console-datagrid').datagrid('selectRow', index);
				var row = $('#console-datagrid').datagrid('getSelected');
				if (row) {
					$('#current-row-index').val(index);
					$('#console-detail-info').text(row.content);
				} else {
					$('#console-datagrid').datagrid('selectRow', index - 1);
					$.messager.alert('失败', '当前已到最后一条记录', 'error');
				}
			}
		}, {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#console-info-dlg").dialog('close');
			}
		} ]
	});

	$('#add-conn-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 210,
		iconCls : 'icon-add',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#add-conn-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.conn.save
		} ]
	});

	$('#edit-conn-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 210,
		iconCls : 'icon-edit1',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#edit-conn-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.conn.save
		} ]
	});

	$('#add-schedule-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 280,
		iconCls : 'icon-add',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#add-schedule-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.schedule.save
		} ]
	});

	$('#edit-schedule-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 280,
		iconCls : 'icon-edit1',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#edit-schedule-dlg").dialog('close');
			}
		}, {
			text : '保存',
			iconCls : 'icon-save',
			handler : SiteMgr.schedule.save
		} ]
	});

	$('#view-schedule-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 280,
		iconCls : 'icon-item1',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#view-schedule-dlg").dialog('close');
			}
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
	$('#btn-get-param-list').bind('click', SiteMgr.toolbar.getParamList);
	$('#btn-query-all').bind('click', SiteMgr.toolbar.queryAll);
	$('#btn-query-selected').bind('click', SiteMgr.toolbar.querySelected);
	$('#btn-query-schedule').bind('click', SiteMgr.toolbar.querySchedule);
	$('#btn-setup').bind('click', SiteMgr.toolbar.setup);
	$('#btn-cancel').bind('click', SiteMgr.toolbar.cancel);
	$('#btn-clear').bind('click', SiteMgr.toolbar.clear);

	// end
});

var SiteMgr = {
	dataDict : {},
	paramOption : {},
	settings : {},
	categories : [],
	socket : null,
	init : function() {
		SiteMgr.loadConfigItems();
	},
	getConfigItemName : function(key, value) {
		if (key == "mcpMode") {
			return value == "0" ? "每包确认方式" : "多问一答方式";
		}
		var items = SiteMgr.dataDict[key];
		for (var i = 0; i < items.length; i++) {
			if (items[i].value == value) {
				return items[i].name;
			}
		}
		return "其他";
	},
	loadConfigItems : function() {
		$.getJSON(settingsPageUrl + 'getSettings', function(data) {
			SiteMgr.settings = data;
			var ip = SiteMgr.settings.WebSocketIP;
			var port = SiteMgr.settings.WebSocketPort;
			SiteMgr.socketIO.init(ip, port);
		});

		$.getJSON(XFrame.getContextPath() + '/system/dict/getDepth1Items', {
			parentKey : "deviceType"
		}, function(data) {
			SiteMgr.dataDict["deviceType"] = data;
		});

		$.getJSON(XFrame.getContextPath() + '/system/dict/getDepth2Items', {
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

		$.getJSON(XFrame.getContextPath() + '/system/dict/getDepth1Items',{
							parentKey : "deviceParamCategory"
						},
						function(data) {
							SiteMgr.categories = data;
							var height = $('#param-tabs').height()-30;
							for (var i = 0; i < SiteMgr.categories.length; i++) {
								var category = SiteMgr.categories[i];
								var title = category.name + "参数";
								var id = "param-tab" + category.value;
								var gridId = id + "-grid";
								var content = "<div id=\"" + id + "\" style=\"padding: 2px;\">"
										+ "<div style=\"height:"+ height +"px\">" + "<div class=\"easyui-datagrid\" id=\""
										+ gridId + "\"></div>" + "</div>" + "</div>";
								$('#param-tabs').tabs('add', {
									title : title,
									content : content
								});

								$('#' + gridId).datagrid(
												{
													fit : true,
													pagination : false,
													rownumbers : true,
													fitColumns : true,
													singleSelect : true,
													remoteSort : false,
													columns : [ [
															{
																field : 'ck',
																width : 15,
																title : '选择',
																name : gridId + '-ck',
																formatter : function(value, row, index) {
																	var chkId = $(this).get(0).name + '-' + index;
																	var tmpl = '<input type="checkbox" id={{id}} name="{{id}}"/>';
																	return template.compile(tmpl)({
																		id : chkId,
																		value : value
																	});
																}
															},
															{
																field : 'paramUid',
																title : '参数标识',
																width : 50,
																sortable : true
															},
															{
																field : 'name',
																title : '名称',
																width : 150,
																sortable : true
															},
															{
																field : 'value',
																title : '值',
																width : 150,
																sortable : true,
																name : gridId + '-value',
																formatter : function(value, row, index) {
																	if (row.mode == 'ro') {
																		if (row.htmlElem == "select") {
																			var items = SiteMgr.paramOption[row.htmlElemKey];
																			for (var i = 0; i < items.length; i++) {
																				var item = items[i];
																				if (item.value == value) {
																					return item.value + "(" + item.name + ")";
																				}
																			}
																			return value;
																		}
																		return value;
																	}

																	var valueId = $(this).get(0).name + '-' + index;
																	if (row.htmlElem == "select") {
																		var tmpl = '\
                    								<select id={{id}} name="{{id}}" style="width:150px">\
                    								{{each list}}\
                    									<option value="{{$value.value}}" {{if $value.value == currValue}}selected{{/if}}>{{$value.name}}</option>\
                    								{{/each}}\
                    								</select>';
																		return template.compile(tmpl)({
																			id : valueId,
																			currValue : value,
																			list : SiteMgr.paramOption[row.htmlElemKey]
																		});
																	}
																	var tmpl = '<input type="text" id="{{id}}" name="value" value="{{value}}" style="width:150px"/>';
																	return template.compile(tmpl)({
																		id : valueId,
																		value : value
																	});
																}
															}, {
																field : 'createTime',
																title : '更新时间',
																width : 100,
																sortable : true
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
			$('#apMaxLen').textbox('setValue', "1024");
			$('#nc').textbox('setValue', "1");
			$('#tot1').textbox('setValue', "60");
			$('#tg').textbox('setValue', "1000");
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
		view : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var meta = node.attributes;
				if (meta.flag == 0) {
					SiteMgr.dialogs.viewSiteNodeDlg.open();
					SiteMgr.siteTree.viewSiteNode(meta);
				} else {
					SiteMgr.dialogs.viewDeviceNodeDlg.open();
					SiteMgr.siteTree.viewDeviceNode(meta);
				}
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		viewSiteNode : function(meta) {
			var comboxKeys = [ "deviceType", "apProtocol", "mcpProtocol", "protocol", "mcpMode" ];
			for ( var key in meta) {
				var id = '#view-' + key;
				var value = (meta[key]);
				if ($.inArray(key, comboxKeys) >= 0) {
					value = SiteMgr.getConfigItemName(key, value);
				}
				$(id).text(value);
			}
		},
		viewDeviceNode : function(meta) {
			for ( var key in meta) {
				$('#view-device-' + key).text(meta[key]);
			}
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
			SiteMgr.paramTabs.clear();
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
		getParamList : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var data = node.attributes;
				SiteMgr.socket.emit('getParamList', data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		queryAll : function() {
			var node = $('#site-tree').tree('getSelected');
			var paramUidList = SiteMgr.toolbar.getAllParamUidList();
			if (node && paramUidList.length > 0) {
				var data = node.attributes;
				data.paramUids = paramUidList.join();
				SiteMgr.socket.emit('queryAll', data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定站点或设备是否存在查询参数!', 'info');
			}
		},
		querySelected : function() {
			var node = $('#site-tree').tree('getSelected');
			var paramUidList = SiteMgr.toolbar.getSelectedParamUidList();
			if (node && paramUidList.length > 0) {
				var data = node.attributes;
				data.paramUids = paramUidList.join();
				SiteMgr.socket.emit('querySelected', data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定是否选中参数!', 'info');
			}
		},
		querySchedule : function() {
			var node = $('#site-tree').tree('getSelected');
			var paramUidList = SiteMgr.toolbar.getSelectedParamUidList();
			if (node && paramUidList.length > 0) {
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定是否选中参数!', 'info');
			}
		},
		setup : function() {
			var node = $('#site-tree').tree('getSelected');
			var idValueList = SiteMgr.toolbar.getSetupParamIdValueList();
			if (node && idValueList.length > 0) {
				var data = node.attributes;
				data.paramUids = JSON.stringify(idValueList);
				SiteMgr.socket.emit('settings', data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定是否选中参数!', 'info');
			}
		},
		cancel : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var tab = $('#param-tabs').tabs('getSelected');
				var index = $('#param-tabs').tabs('getTabIndex', tab);
				var siteUid = node.attributes.uid;
				SiteMgr.paramTabs.displayParamList(siteUid, index);
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		clear : function() {
			SiteMgr.paramTabs.clear();
		},
		getAllParamUidList : function() {
			var paramUidList = [];
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var gridId = "#param-tab" + category.value + '-grid';
				var rows = $(gridId).datagrid('getRows');
				for (var j = 0; j < rows.length; j++) {
					var deviceParam = rows[j];
					paramUidList.push(deviceParam.paramUid);
				}
			}
			return paramUidList;
		},
		getSelectedParamUidList : function() {
			var paramUidList = [];
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var gridId = "#param-tab" + category.value + '-grid';
				var rows = $(gridId).datagrid('getRows');
				for (var j = 0; j < rows.length; j++) {
					var deviceParam = rows[j];
					var chkId = gridId + '-ck-' + j;
					if ($(chkId).prop("checked")) {
						paramUidList.push(deviceParam.paramUid);
					}
				}
			}
			return paramUidList;
		},
		getSetupParamIdValueList : function() {
			var idValueList = [];
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var gridId = "#param-tab" + category.value + '-grid';
				var rows = $(gridId).datagrid('getRows');
				for (var j = 0; j < rows.length; j++) {
					var deviceParam = rows[j];
					var chkId = gridId + '-ck-' + j;
					var valueId = gridId + '-value-' + j;
					if ($(chkId).prop("checked") && deviceParam.mode == 'rw') {
					    idValueList.push({
						    id : deviceParam.paramUid,
						    value : $(valueId).val()
						});
					}
				}
			}
			return  idValueList;
		}
	// end
	},
	console : {
		output : function(row) {
			$('#console-datagrid').datagrid('appendRow', row);
		}
	// end
	},
	conn : {
		add : function() {
			SiteMgr.dialogs.addConnDlg.open();
			$("#modal-action").val("add");
			$("#add-conn-form").form('reset');
		},
		edit : function() {
			var row = $('#connected-device-datagrid').datagrid('getSelected');
			if (row) {
				SiteMgr.dialogs.editConnDlg.open();
				$("#modal-action").val("edit");
				$("#edit-conn-form").form('reset');
				$("#edit-conn-form").form('load', row);
			} else {
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
		},
		remove : function() {
			var row = $('#connected-device-datagrid').datagrid('getSelected');
			if (!row) {
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
			var gridUrl = connInfoPageUrl + 'list';
			var actUrl = connInfoPageUrl + 'remove';
			return EasyUIUtils.removeWithActUrl('#connected-device-datagrid', gridUrl, actUrl);
		},
		save : function() {
			var action = $('#modal-action').val();
			var formId = action == "edit" ? "#edit-conn-form" : "#add-conn-form";
			var dlgId = action == "edit" ? "#edit-conn-dlg" : "#add-conn-dlg";
			var gridUrl = connInfoPageUrl + 'list';
			EasyUIUtils.saveWithActUrl(dlgId, formId, '#modal-action', '#connected-device-datagrid', gridUrl,
					connInfoPageUrl);
		}
	},
	schedule : {
		add : function() {
			SiteMgr.dialogs.addScheduleDlg.open();
			$("#modal-action").val("add");
			$("#add-schedule-form").form('reset');
		},
		edit : function() {
			var row = $('#schedule-task-datagrid').datagrid('getSelected');
			if (row) {
				SiteMgr.dialogs.editScheduleDlg.open();
				$("#modal-action").val("edit");
				$("#edit-schedule-form").form('reset');
				$("#edit-schedule-form").form('load', row);
			} else {
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
		},
		remove : function() {
			var row = $('#schedule-task-datagrid').datagrid('getSelected');
			if (!row) {
				$.messager.alert('警告', '请选中一条记录!', 'info');
			}
			var gridUrl = schedulePageUrl + 'list';
			var actUrl = schedulePageUrl + 'remove';
			return EasyUIUtils.removeWithActUrl('#schedule-task-datagrid', gridUrl, actUrl);
		},
		view : function() {
			SiteMgr.dialogs.viewScheduleDlg.open();
		},
		save : function() {
			var action = $('#modal-action').val();
			var formId = action == "edit" ? "#edit-schedule-form" : "#add-schedule-form";
			var dlgId = action == "edit" ? "#edit-schedule-dlg" : "#add-schedule-dlg";
			var gridUrl = schedulePageUrl + 'list';
			EasyUIUtils.saveWithActUrl(dlgId, formId, '#modal-action', '#schedule-task-datagrid', gridUrl,
					schedulePageUrl);
		}
	},
	paramTabs : {
		displayParamList : function(siteUid, defaultTabIndex) {
			$.getJSON(siteMgrPageUrl + 'queryAllValues', {
				siteUid : siteUid
			}, function(map) {
				SiteMgr.paramTabs.clear();
				for ( var key in map) {
					var gridId = "#param-tab" + key + "-grid";
					var data = map[key];
					$(gridId).datagrid('loadData', data);
				}
				SiteMgr.paramTabs.select(defaultTabIndex);
			});
		},
		clear : function() {
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var gridId = "#param-tab" + category.value + "-grid";
				EasyUIUtils.clearDatagrid(gridId);
			}
			SiteMgr.paramTabs.select(0);
		},
		select : function(index) {
			$('#param-tabs').tabs('select', index);
		},
		getSelectedIndex:function(){
			var tab = $('#param-tabs').tabs('getSelected');
			return $('#param-tabs').tabs('getTabIndex',tab);
		},
		selectDatagridRows : function(paramUids) {
        	    for (var i = 0; i < SiteMgr.categories.length; i++) {
        		var category = SiteMgr.categories[i];
        		var gridId = "#param-tab" + category.value + '-grid';
        		var rows = $(gridId).datagrid('getRows');
        		for (var j = 0; j < rows.length; j++) {
        		    var deviceParam = rows[j];
        		    var chkId = gridId + '-ck-' + j;
        		    if ($.inArray(deviceParam.paramUid, paramUids) >= 0) {
        			$(chkId).prop("checked", true);
        			$(gridId).datagrid('selectRow', j);
        		    }
        		}
        	    }
		}
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
		viewSiteNodeDlg : {
			open : function() {
				$('#view-site-dlg').dialog('open').dialog('center');
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
		viewDeviceNodeDlg : {
			open : function() {
				$('#view-device-dlg').dialog('open').dialog('center');
			}
		},
		addConnDlg : {
			open : function() {
				$('#add-conn-dlg').dialog('open').dialog('center');
			}
		},
		editConnDlg : {
			open : function() {
				$('#edit-conn-dlg').dialog('open').dialog('center');
			}
		},
		addScheduleDlg : {
			open : function() {
				$('#add-schedule-dlg').dialog('open').dialog('center');
			}
		},
		editScheduleDlg : {
			open : function() {
				$('#edit-schedule-dlg').dialog('open').dialog('center');
			}
		},
		viewScheduleDlg : {
			open : function() {
				$('#view-schedule-dlg').dialog('open').dialog('center');
			}
		},
		searchSiteDlg : {
			open : function() {
				$('#search-site-dlg').dialog('open').dialog('center');
				EasyUIUtils.clearDatagrid('#search-site-result');
			}
		}
	},
	socketIO : {
		init : function(ip, port) {
			SiteMgr.socket = io.connect('http://' + ip + ':' + port);
			SiteMgr.socket.on('connect', function() {
				SiteMgr.console.output({
					name : "连接服务器",
					content : "连接远程通讯服务器成功!",
					createTime : new Date().toLocaleString()
				});
			});
			SiteMgr.socket.on('disconnect', function() {
				SiteMgr.console.output({
					name : "断开服务器",
					content : "断开远程通讯服务器成功!",
					createTime : new Date().toLocaleString()
				});
			});
			SiteMgr.socket.on('getParamList', function(data) {
				SiteMgr.console.output({
					name : "获取查询列表",
					content : "发送:" + data.requestText,
					createTime : new Date().toLocaleString()
				});
				setTimeout(function(){
				    SiteMgr.paramTabs.displayParamList(data.uid, 0);
				    EasyUIUtils.closeLoading();
				},5000);
			});
			SiteMgr.socket.on('queryAll', function(data) {
				SiteMgr.console.output({
					name : "查询所有参数",
					content : "发送:" + data.requestText,
					createTime : new Date().toLocaleString()
				});
				setTimeout(function(){
				    SiteMgr.paramTabs.displayParamList(data.uid, 0);
				    EasyUIUtils.closeLoading();
				},5000);
			});
			SiteMgr.socket.on('querySelected', function(data) {
				SiteMgr.console.output({
					name : "查询选中参数",
					content : "发送:" + data.requestText,
					createTime : new Date().toLocaleString()
				});
				setTimeout(function(){    
					var index = SiteMgr.paramTabs.getSelectedIndex();
					SiteMgr.paramTabs.displayParamList(data.uid, index);
					SiteMgr.paramTabs.selectDatagridRows(data.paramUids.split(','))
					EasyUIUtils.closeLoading();
				},5000);
			});
			SiteMgr.socket.on('settings', function(data) {
				SiteMgrs.console.output({
					name : "设置参数",
					content : "发送:" + data.requestText,
					createTime : new Date().toLocaleString()
				});
				setTimeout(function(){
					var index = SiteMgr.paramTabs.getSelectedIndex();
					SiteMgr.paramTabs.displayParamList(data.uid, index);
					EasyUIUtils.closeLoading();
				},5000);
			});
		}
	}
// end
};

SiteMgr.init();