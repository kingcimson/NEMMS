var siteMgrPageUrl = XFrame.getContextPath() + '/device/site/';
var connInfoPageUrl = XFrame.getContextPath() + '/device/connInfo/';
var schedulePageUrl = XFrame.getContextPath() + '/device/schedule/';
var settingsPageUrl = XFrame.getContextPath() + '/system/settings/';
var nmsstatusPageUrl = XFrame.getContextPath() + '/device/nmsstatus/';
var reportPageUrl = XFrame.getContextPath() + '/device/report/';
var dictPageUrl =XFrame.getContextPath() + '/system/dict/';

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
			var telnetEl = $('#m-telnet')[0]; 
			var addDevEl = $('#m-add-device')[0]; 
			if(node.attributes.flag == 0){
				$('#site-tree-ctx-menu').menu('enableItem',telnetEl);
				$('#site-tree-ctx-menu').menu('enableItem',addDevEl);
			}else{
				$('#site-tree-ctx-menu').menu('disableItem',telnetEl);
				$('#site-tree-ctx-menu').menu('disableItem',addDevEl);
			}
		}
	});

	$('#param-tabs').tabs({
		tools : [ {
			iconCls : 'icon-fullscreen',
			handler : function() {
				//$('#fullscreen-param-tabs-dlg').dialog('open').dialog('center');
			}
		} ]
	});
	$('#console-tabs').tabs({
		tools : [ {
			iconCls : 'icon-fullscreen',
			handler : function() {
				//$('#fullscreen-console-tabs-dlg').dialog('open').dialog('center');
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
			field : 'req',
			title : '发送',
			width : 100
		}, {
			field : 'res',
			title : '响应',
			width : 100
		}, {
			field : 'respFlag',
			title : '状态',
			width : 50,
			formatter : function(value, row, index) {
				return (value == 0 || value == 255) ? "正常" : "异常";
			}
		}, {
			field : 'createTime',
			title : '操作时间',
			width : 70
		} ] ],
		onDblClickRow : function(index, row) {
			$('#console-info-dlg').dialog('open').dialog('center');
			$('#console-detail-info-req').text(row.req);
			$('#console-detail-info-res').text(row.res);
		}
	});

	$('#connected-device-datagrid').datagrid({
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
			field : 'decUid',
			title : '站点/设备编号',
			width : 100,
			formatter : function(value, row, index) {
				return value + '('+ row.siteUid +')';
			}
		}, {
			field : 'deviceIp',
			title : '设备IP',
			width : 100
		}, {
			field : 'devicePort',
			title : '设备端口',
			width : 70
		}, {
			field : 'serverIp',
			title : '服务器IP',
			width : 100
		}, {
			field : 'serverPort',
			title : '服务器端口',
			width : 70
		}, {
			field : 'status',
			title : '状态',
			width : 50,
			formatter : function(value, row, index) {
				return value == "1" ? "正常" : "断开";
			}
		}, {
			field : 'updateTime',
			title : '连接更新时间',
			width : 100
		} ] ],
		onDblClickRow : function(index, row) {
			SiteMgr.siteTree.viewSiteNodeByUid(row.siteUid);
		}
	});

	$('#schedule-task-datagrid').datagrid({
		fit : true,
		pagination : false,
		rownumbers : true,
		fitColumns : true,
		singleSelect : true,
		url : schedulePageUrl + 'list',
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
		}, {
			field : 'serviceName',
			title : '服务名称',
			width : 80
		}, {
			field : 'serviceUrl',
			title : '服务URL',
			width : 100
		}, {
			field : 'serviceStatus',
			title : '服务状态',
			width : 50,
			formatter : function(value, row, index) {
				return value == "1" ? "正常" : "异常";
			}
		}, {
			field : 'updateTime',
			title : '更新时间',
			width : 80
		} ] ],
		onDblClickRow : function(index, row) {
		}
	});

	$('#device-report-datagrid').datagrid({
		method : 'get',
		fit : true,
		fitColumns : true,
		singleSelect : true,
		pagination : true,
		rownumbers : true,
		pageSize : 50,
		url : reportPageUrl + 'list',
		columns : [ [ {
				field : 'id',
				title : '标识',
				width : 50
			}, {
				field : 'siteUid',
				title : '站点/设备编号',
				width : 100
			}, {
				field : 'type',
				title : '告警类型',
				width : 80
			}, {
				field : 'content',
				title : '告警内容',
				width : 200
			}, {
				field : 'createTime',
				title : '创建时间',
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
		height : 420,
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
		height : 420,
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
		height : 420,
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
		maximizable : false,
		width : window.screen.width - 650,
		height : window.screen.height - 350,
		iconCls : 'icon-info',
		buttons : [ {
			text : '上一条',
			iconCls : 'icon-prev',
			handler : function() {
				var index = parseInt($('#current-row-index').val()) - 1;
				$('#console-datagrid').datagrid('selectRow', index);
				var row = $('#console-datagrid').datagrid('getSelected');
				if (row) {
					$('#current-row-index').val(index);
					$('#console-detail-info-req').text(row.req);
					$('#console-detail-info-res').text(row.res);
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
					$('#console-detail-info-req').text(row.req);
					$('#console-detail-info-res').text(row.res);
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
		height : 240,
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
		height : 240,
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
	
	$('#telnet-site-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 260,
		iconCls : 'icon-list',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#telnet-site-dlg").dialog('close');
			}
		}, {
			text : '确定',
			iconCls : 'icon-save',
			handler : SiteMgr.toolbar.telnet
		} ]
	});

	$('#device-report-dlg').dialog({
		closed : true,
		modal : true,
		width : window.screen.width - 300,
		height : window.screen.height - 350,
		maximizable : true,
		iconCls : 'icon-report',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#device-report-dlg").dialog('close');
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
	SiteMgr.initConsoleTabs();

	setInterval(function() {
		EasyUIUtils.loadToDatagrid('#connected-device-datagrid', connInfoPageUrl + 'list');
	}, 30000);
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
	initConsoleTabs : function() {
		var height = $('#console-tabs').height() - 30;
		$("div[id^='console-tab-']").css({
			"height" : height
		});
		$('#console-tab-1').css({
			"height" : height
		});
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

		$.getJSON(dictPageUrl + 'getDepth1Items', {
			parentKey : "deviceType"
		}, function(data) {
			SiteMgr.dataDict["deviceType"] = data;
		});

		$.getJSON(dictPageUrl + 'getDepth2Items', {
			parentKey : "monitorParam"
		}, function(data) {
			SiteMgr.dataDict["apProtocol"] = data.apProtocol;
			SiteMgr.dataDict["mcpProtocol"] = data.mcpProtocol;
			SiteMgr.dataDict["protocol"] = data.protocol;
		});

		$.getJSON(dictPageUrl + 'getDepth2Items', {
			parentKey : "paramOption"
		}, function(data) {
			SiteMgr.paramOption = data;
		});

		$.getJSON(dictPageUrl + 'getDepth1Items',{
			parentKey : "deviceParamCategory"},function(data) {
							SiteMgr.categories = data;
							var height = $('#param-tabs').height() - 30;
							for (var i = 0; i < SiteMgr.categories.length; i++) {
								var category = SiteMgr.categories[i];
								var title = category.name + "参数";
								var id = "param-tab" + category.value;
								var gridId = id + "-grid";
								var content = "<div id=\"" + id + "\" style=\"padding: 2px;\">"
										+ "<div style=\"height:" + height + "px\">"
										+ "<div class=\"easyui-datagrid\" id=\"" + gridId + "\"></div>" + "</div>"
										+ "</div>";
								$('#param-tabs').tabs('add', {
									title : title,
									content : content
								});

								$('#' + gridId).datagrid({
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
																					return item.value + "(" + item.name
																							+ ")";
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
		viewSiteNodeByUid : function(uid) {
			$.getJSON(siteMgrPageUrl + 'queryByUid', {
				uid : uid
			}, function(data) {
				SiteMgr.dialogs.viewSiteNodeDlg.open();
				SiteMgr.siteTree.viewSiteNode(data);
			});
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
		reloadSelected : function() {
			var node = $('#site-tree').tree('getSelected');
			if(node){
				$('#site-tree').tree('reload',node.target);
			}
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
				if (item.name == "telnet") {
					return SiteMgr.dialogs.telnetSiteDlg.open();
				}
				if (item.name == "report") {
					return SiteMgr.dialogs.deviceReportDlg.open();
				}
				return;
			}
		}
	// end
	},
	toolbar : {
		getParamList : function() {
			if (!SiteMgr.socketIO.isConnected()) {
				return;
			}
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var data = node.attributes;
				data.eventName = 'getParamList';
				SiteMgr.socket.emit(data.eventName, data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备!', 'info');
			}
		},
		queryAll : function() {
			if (!SiteMgr.socketIO.isConnected()) {
				return;
			}
			var node = $('#site-tree').tree('getSelected');
			var paramUidList = SiteMgr.toolbar.getAllParamUidList();
			if (node && paramUidList.length > 0) {
				var data = node.attributes;
				data.paramUids = paramUidList.join();
				data.eventName = 'queryAll';
				SiteMgr.socket.emit(data.eventName, data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定站点或设备是否存在查询参数!', 'info');
			}
		},
		querySelected : function() {
			if (!SiteMgr.socketIO.isConnected()) {
				return;
			}
			var node = $('#site-tree').tree('getSelected');
			var map = SiteMgr.toolbar.getSelectedParamUidList();
			if (node && map.paramUidList.length > 0) {
				var data = node.attributes;
				data.paramUids = map.paramUidList.join();
				data.rowIds = map.rowIdList.join();
				data.eventName = 'querySelected';
				SiteMgr.socket.emit(data.eventName, data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定是否选中参数!', 'info');
			}
		},
		setup : function() {
			if (!SiteMgr.socketIO.isConnected()) {
				return;
			}
			var node = $('#site-tree').tree('getSelected');
			var map = SiteMgr.toolbar.getSetupParamIdValueList();
			if (node && map.idValueList.length > 0) {
				var data = node.attributes;
				data.paramUids = JSON.stringify(map.idValueList);
				data.rowIds = map.rowIdList.join();
				data.eventName = 'settings';
				SiteMgr.socket.emit(data.eventName, data);
				EasyUIUtils.loading();
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定是否选中参数!', 'info');
			}
		},
		querySchedule : function() {
			var node = $('#site-tree').tree('getSelected');
			var map = SiteMgr.toolbar.getSelectedParamUidList();
			if (node && map.paramUidList.length > 0) {
			} else {
				$.messager.alert('警告', '请选中一个站点或设备,并确定是否选中参数!', 'info');
			}
		},
		cancel : function() {
			var node = $('#site-tree').tree('getSelected');
			if (node) {
				var tab = $('#param-tabs').tabs('getSelected');
				var index = $('#param-tabs').tabs('getTabIndex', tab);
				for (var i = 0; i < SiteMgr.categories.length; i++) {
					var category = SiteMgr.categories[i];
					var gridId = "#param-tab" + category.value + '-grid';
					var rows = $(gridId).datagrid('getRows');
					for (var j = 0; j < rows.length; j++) {
						var chkId = gridId + '-ck-' + j;
						if ($(chkId).prop("checked")) {
							$(chkId).prop("checked", false);
						}
					}
				}
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
			var map = {
				paramUidList : [],
				rowIdList : []
			};
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var gridId = "#param-tab" + category.value + '-grid';
				var rows = $(gridId).datagrid('getRows');
				for (var j = 0; j < rows.length; j++) {
					var deviceParam = rows[j];
					var chkId = gridId + '-ck-' + j;
					if ($(chkId).prop("checked")) {
						map.paramUidList.push(deviceParam.paramUid);
						map.rowIdList.push(chkId + "-" + deviceParam.paramUid);
					}
				}
			}
			return map;
		},
		getSetupParamIdValueList : function() {
			var map = {
				idValueList : [],
				rowIdList : []
			};
			for (var i = 0; i < SiteMgr.categories.length; i++) {
				var category = SiteMgr.categories[i];
				var gridId = "#param-tab" + category.value + '-grid';
				var rows = $(gridId).datagrid('getRows');
				for (var j = 0; j < rows.length; j++) {
					var deviceParam = rows[j];
					var chkId = gridId + '-ck-' + j;
					var valueId = gridId + '-value-' + j;
					if ($(chkId).prop("checked") && deviceParam.mode == 'rw') {
						map.idValueList.push({
							id : deviceParam.paramUid,
							value : $(valueId).val()
						});
						map.rowIdList.push(chkId + "-" + deviceParam.paramUid);
					}
				}
			}
			return map;
		},
		telnet:function(){
			if($('#telnet-site-form').form('validate')){
				if (!SiteMgr.socketIO.isConnected()) {
					return;
				}
				var node = $('#site-tree').tree('getSelected');
				if (node && node.attributes.flag == 0) {
					var data = node.attributes;
					data.eventName = 'telnet';
					data.telnetIP=$('#telnet-ip').textbox('getValue');
					data.telnetPort=$('#telnet-port').textbox('getValue');
					data.telnetUser=$('#telnet-user').textbox('getValue');
					data.telnetPwd=$('#telnet-pwd').textbox('getValue');
					data.telnetCmd=$('#telnet-cmd').textbox('getValue');
					SiteMgr.socket.emit(data.eventName, data);
					EasyUIUtils.loading();
					SiteMgr.dialogs.telnetSiteDlg.close();
				} else {
					$.messager.alert('警告', '请选中一个主单元!', 'info');
				}
			}
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
		getSelectedIndex : function() {
			var tab = $('#param-tabs').tabs('getSelected');
			return $('#param-tabs').tabs('getTabIndex', tab);
		},
		updateParamsValue : function(siteUid, paramUids, rowIds) {
			$.post(siteMgrPageUrl + 'queryValues', {
				"siteUid" : siteUid,
				"paramUids" : paramUids
			}, function(data) {
				var rowIdList = rowIds.split(',');
				for (var i = 0; i < rowIdList.length; i++) {
					var rowId = rowIdList[i];
					var meta = rowId.split('-');
					if (meta.length != 6) {
						continue;
					}
					var gridId = meta.slice(0, 3).join('-');
					var index = parseInt(meta[4]);
					var paramUid = meta[5];
					var row = data[paramUid];
					if (row) {
						SiteMgr.paramTabs.updateDatagridRow(gridId, index, row);
					}
				}
			});
		},
		updateDatagridRow : function(gridId, index, row) {
			$(gridId).datagrid('updateRow', {
				index : index,
				row : row
			});
			var chkId = gridId + "-ck-" + index;
			$(chkId).prop("checked", true);
		}
	// endss
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
		},
		telnetSiteDlg : {
			open : function(){
				$('#telnet-site-dlg').dialog('open').dialog('center');
				$('#telnet-site-form').form('clear');
				$('#telnet-port').textbox('setValue',23);
				$('#telnet-user').textbox('setValue','root');
				$('#telnet-pwd').textbox('setValue','');
				$('#telnet-cmd').textbox('setValue','fun display');
				
				var node = $('#site-tree').tree('getSelected');
				if(node){
					$.getJSON(connInfoPageUrl+'get',{"siteUid":node.attributes.uid },function(result){
						if(result.data){
							$('#telnet-ip').textbox('setValue',result.data.deviceIp);
						}
					});
				}
			},
			close:function(){
				$('#telnet-site-dlg').dialog('close');
			}
		},
		deviceReportDlg : {
			open : function(){
				$('#device-report-dlg').dialog('open').dialog('center');
				EasyUIUtils.clearDatagrid('##device-report-datagrid');
			}
		}
	},
	socketIO : {
		init : function(ip, port) {
			SiteMgr.socket = io.connect('http://' + ip + ':' + port);
			SiteMgr.socket.on('connect', function() {
				SiteMgr.console.output({
					name : "连接服务器",
					req : "请求连接服务器",
					res : "连接远程通讯服务器成功!",
					respFlag : 0,
					createTime : new Date().toLocaleString()
				});
			});
			SiteMgr.socket.on('disconnect', function() {
				SiteMgr.console.output({
					name : "断开服务器",
					req : "无",
					res : "断开远程通讯服务器成功!",
					respFlag : 0,
					createTime : new Date().toLocaleString()
				});
			});
			SiteMgr.socket.on('getParamList', function(data) {
				SiteMgr.console.output({
					name : "获取参数列表",
					req : data.requestText,
					res : data.responseText,
					respFlag : data.respFlag,
					createTime : new Date().toLocaleString()
				});
				if(data.eof){
				    SiteMgr.paramTabs.displayParamList(data.uid, 0);
				    EasyUIUtils.closeLoading();
				}
			});
			SiteMgr.socket.on('queryAll', function(data) {
				SiteMgr.console.output({
					name : "查询所有参数",
					req : data.requestText,
					res : data.responseText,
					respFlag : data.respFlag,
					createTime : new Date().toLocaleString()
				});
				if(data.eof){
				    SiteMgr.paramTabs.displayParamList(data.uid, 0);
				    EasyUIUtils.closeLoading();
				}
			});
			SiteMgr.socket.on('querySelected', function(data) {
				SiteMgr.console.output({
					name : "查询选中参数",
					req : data.requestText,
					res : data.responseText,
					respFlag : data.respFlag,
					createTime : new Date().toLocaleString()
				});
				if(data.eof){ 
				    SiteMgr.paramTabs.updateParamsValue(data.uid, data.paramUids, data.rowIds);
				    EasyUIUtils.closeLoading();
				}
			});
			SiteMgr.socket.on('settings', function(data) {
				SiteMgr.console.output({
					name : "设置参数",
					req : data.requestText,
					res : data.responseText,
					respFlag : data.respFlag,
					createTime : new Date().toLocaleString()
				});
				if(data.eof){ 
					var idValueList = $.parseJSON(data.paramUids);
					var paramUids = $.map(idValueList, function(e) {
						return e.id;
					}).join(',');
					SiteMgr.paramTabs.updateParamsValue(data.uid, paramUids, data.rowIds);
					EasyUIUtils.closeLoading();
				}
			});
			SiteMgr.socket.on('telnet', function(data) {
				SiteMgr.console.output({
					name : "获取站点设备列表",
					req : data.requestText,
					res : data.responseText,
					respFlag : data.respFlag,
					createTime : new Date().toLocaleString()
				});
				EasyUIUtils.closeLoading();
				SiteMgr.siteTree.reload();
			});
		},
		isConnected : function() {
			if (!SiteMgr.socket.connected) {
				$.messager.alert('警告', '没有连接到通讯服务器,请查看系统配置是否正确。', 'info');
			}
			return SiteMgr.socket.connected;
		}
	}
// end
};

SiteMgr.init();
