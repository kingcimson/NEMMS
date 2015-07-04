var SiteMgr = {
	deviceTree : null,
	searchTreeNodeDt : null,
	comunicateDt : null,
	socket:null,
	pageUrl : XFrame.getContextPath() + '/site/',
	ajaxPost : function(data, url, success) {
		$.ajax({
			type : 'POST',
			url : url,
			data : data,
			dataType : "json",
			cache : false,
			beforeSend : function(data) {
			},
			success : success
		});
	},
	post : function(data, url, callback) {
		SiteMgr.ajaxPost(data, url, function(data) {
			$.smallBox({
				title : data.msg,
				color : "#739E72",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
			if (callback instanceof Function) {
				callback();
			}
		});
	},
	socketIO : {
		init : function(ip, port) {
			SiteMgr.socket = io.connect('http://' + ip + ':' + port);
			SiteMgr.socket.on('connect', function() {
				var rows = [];
				var row = SiteMgr.datatables.comunicateDt.createRow();
				row.recvContent = "Client has connected to the server!";
				rows.push(row);
				SiteMgr.datatables.comunicateDt.loadData(rows)
			});
			SiteMgr.socket.on('disconnect', function() {
				var rows = [];
				var row = SiteMgr.datatables.comunicateDt.createRow();
				row.recvContent = "The client has disconnected!";
				rows.push(row);
				SiteMgr.datatables.comunicateDt.loadData(rows)
			});
			SiteMgr.socket.on('findAll', function(data) {
				var rows = [];
				var row = SiteMgr.datatables.comunicateDt.createRow();
				row.recvContent = data.responseText;
				rows.push(row);
				SiteMgr.datatables.comunicateDt.loadData(rows)
			});
			SiteMgr.socket.on('getParams', function(data) {
				var rows = [];
				var row = SiteMgr.datatables.comunicateDt.createRow();
				row.recvContent = data.responseText;
				rows.push(row);
				SiteMgr.datatables.comunicateDt.loadData(rows)
			});
		},
		disconnect : function() {
			SiteMgr.socket.disconnect();
		},
		sendMsg : function(event, data) {
			SiteMgr.socket.emit(event, data);
		}
	},
	initTree : function() {
		var tree = new dhtmlXTreeObject("device-tree", "100%", "100%", 0);
		var menu = new dhtmlXMenuObject();
		menu.setIconsPath(XFrame.getContextPath() + "/assets/modules/common/icons/imgs/");
		menu.renderAsContextMenu();
		menu.attachEvent("onClick", function(menuItemId, type) {
			var meta = tree.getUserData(tree.contextID, 'meta');
			SiteMgr.tree.onCtxMenuEvent(menuItemId, meta);
		});
		menu.loadFromHTML("treeContextMenu", true, function() {
		});

		tree.setSkin('dhx_skyblue');
		tree.enableDragAndDrop(true);
		tree.enableContextMenu(menu);
		tree.setImagePath(XFrame.getContextPath() + "/assets/js/plugin/dhtmlxtree/imgs/dhxtree_skyblue/");
		tree.setXMLAutoLoading(SiteMgr.pageUrl + "listSites");
		tree.setDataMode("json");
		tree.setDragBehavior("child");
		tree.loadJSON(SiteMgr.pageUrl + "listSites");
		tree.setOnClickHandler(function onClick(id) {
			var meta = tree.getUserData(id, 'meta');
			SiteMgr.tree.onClickHandler(meta);
		});
		tree.attachEvent("onDrag", function(sId, tId, id, sObject) {
			SiteMgr.tree.dragTreeNode(sId,tId,sObject);
		});
		tree.attachEvent("onDblClick", function(id){
			var meta = tree.getUserData(id, 'meta');
			SiteMgr.dialog.editTreeNodeDlg.show(meta);
		});
		SiteMgr.deviceTree = tree;

	},
	initEventBind : function() {
		//站点树相关
		$('#btnTreeAdd').click(SiteMgr.dialog.addSiteNodeDlg.show);
		$("#btnTreeRefresh").click(SiteMgr.tree.refreshTree);
		//$('#btnTreeSearch').click(SiteMgr.dialog.searchTreeNodeDlg.show);
		//$('#search').click(SiteMgr.dialog.searchTreeNodeDlg.find);
		$('#add_site_submit').click(SiteMgr.tree.saveNode);
		$('#edit_site_submit').click(SiteMgr.tree.saveNode);
		$('#add_device_submit').click(SiteMgr.tree.saveNode);
		$('#edit_device_submit').click(SiteMgr.tree.saveNode);
		
		//设备参数相关
		$("#btnGetParamList").click(SiteMgr.device.getParamList);
		$("#btnFindAllParam").click(SiteMgr.device.findAllParam);
	},
	initComunicateDt : function() {
		var options = DataTablePaging.getNotAjaxOptions({
			colums : [ {
				data : "index"
			}, {
				data : "msgId"
			}, {
				data : "actType"
			}, {
				data : "destIP"
			}, {
				data : "msgType"
			}, {
				data : "sendTime"
			}, {
				data : "sendContent"
			}, {
				data : "sendStatus"
			}, {
				data : "recvTime"
			}, {
				data : "recvContent"
			}, {
				data : "recvStatus"
			}, {
				data : "recvMsgCount"
			} ]
		});
		SiteMgr.comunicateDt = $('#comunicateDt').DataTable(options);
		$('#comunicateDt tbody').on('dblclick', 'tr', function() {
			var data = SiteMgr.comunicateDt.row(this).data();
			var index = SiteMgr.comunicateDt.row(this).index();
			//$('#queryParamGridIndex').val(index);
			//$('#reportQueryParamForm').autofill(data);
		});
		$('#comunicateDt tbody').on('click', 'tr', function() {
			SiteMgr.comunicateDt.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		});
	},
	initSearchTreeNodeDt : function(){
		var options = DataTablePaging.getNotAjaxPagingOptions({
			pageLength:5,
			colums : [ {
				data : "id"
			}, {
				data : "name"
			}, {
				data : "uid"
			}, {
				data : "createUser"
			}, {
				data : "createTime"
			} ],
		});
		SiteMgr.searchTreeNodeDt = $('#searchTreeNodeDt').DataTable(options);
		$('#searchTreeNodeDt tbody').on('dblclick', 'tr', function() {
			var data = SiteMgr.searchTreeNodeDt.row(this).data();
			SiteMgr.deviceTree.selectItem(data.id,true,true);
		});
	},
	initTabs :function(){
	},
	loadConfigItems : function() {
		var url = XFrame.getContextPath() + '/system/config/getDeviceTypes'
		$.getJSON(url, null, function(data) {
			$('#site_deviceType').empty();
			$('#edit_site_deviceType').empty();
			$.each(data, function(i, item) {
				$('#site_deviceType').append("<option value='" + item.value + "'>" + item.name + "</option>");
				$('#edit_site_deviceType').append("<option value='" + item.value + "'>" + item.name + "</option>");
			});
		});
		
		var url = XFrame.getContextPath() + '/system/config/getConfigItems'
		$.getJSON(url, {
			parentKey : "monitorParam"
		}, function(data) {
			var map = {
					"apProtocol" : data.apProtocol,
					"mcpProtocol" : data.mcpProtocol,
					"protocol" : data.protocol,
				};
				
			for(var key in map){
				$('#site_'+key).empty();
				$('#edit_site_'+key).empty();
				$.each(map[key], function(i, item) {
					$('#site_'+key).append("<option value='" + item.value + "'>" + item.name + "</option>");
					$('#edit_site_'+key).append("<option value='" + item.value + "'>" + item.name + "</option>");
				});
			}
		});
	},
	init : function() {
		SiteMgr.loadConfigItems();
		SiteMgr.initTree();
		SiteMgr.initEventBind();
		SiteMgr.initComunicateDt();
		SiteMgr.initTabs();
	},
	getTreeUserData : function(id) {
		return SiteMgr.deviceTree.getUserData(id, 'meta');
	},
	showConfirmDlg : function(message) {
		$("#confirmMessage").text(message);
		$('#confirmModal').modal('show');
	},
	showMsg : function(msg) {
		$.smallBox({
			title : msg,
			color : "#739E72",
			iconSmall : "fa fa-times fadeInRight animated",
			timeout : 4000
		});
	},
	tabs : {
		clear : function() {
			//$('#reportConfigForm').resetForm();
			//$('#reportQueryParamForm').resetForm();
		},
		loadData : function(meta) {
			SiteMgr.tabs.clear();
		},
	},
	//
	// 树相关操作
	//
	tree : {
		addSiteNode : function() {
			$('#add_site_form').resetForm();
			$("#treeAction").val("addSite");
		},
		addDeviceNode : function(meta) {
			$('#add_device_form').resetForm();
			$("#treeAction").val("addDevice");
			$('#device_pid').val(meta.id);
		},
		editSiteNode : function(meta) {
			$('#edit_site_form').resetForm();
			$("#treeAction").val("editSite");
			$('#edit_site_form').autofill(meta);
		},
		editDeviceNode : function(meta) {
			$('#edit_device_form').resetForm();
			$("#treeAction").val("editDevice");
			$('#edit_device_form').autofill(meta);
		},
		saveNode : function() {
			var act = $("#treeAction").val();
			var actUrl = "";
			var formId = "";
			var modalId = "";

			if (act == "addSite") {
				actUrl = SiteMgr.pageUrl + "/addSite";
				formId = "#add_site_form";
				modalId = "#add_site_modal"
			} else if (act == "editSite") {
				actUrl = SiteMgr.pageUrl + "/editSite";
				formId = "#edit_site_form";
				modalId = "#edit_site_modal"
			} else if (act == "addDevice") {
				actUrl = SiteMgr.pageUrl + "/addDevice";
				formId = "#add_device_form";
				modalId = "#add_device_modal"
			} else if (act == "editDevice") {
				actUrl = SiteMgr.pageUrl + "/editDevice";
				formId = "#edit_device_form";
				modalId = "#edit_device_modal"
			}

			SiteMgr.post($(formId).serialize(), actUrl, function() {
				$(modalId).modal('hide');
				SiteMgr.tree.refreshTree();
			});
		},
		dragTreeNode : function(sId,tId,sObject){
			var data = {
				sourcePid : sObject.getUserData(sId, 'meta').pid,
				sourceId : sId,
				targetId : tId
			};
			SiteMgr.ajaxPost(data, SiteMgr.pageUrl + 'dragtreenode', function(){
				SiteMgr.tree.refreshTree();
			});
		},
		copyTreeNode : function(meta) {
			if (meta) {
				$('#copyNodeId').val(meta.id);
			} else {
				SiteMgr.showMsg("您没有选择任何节点");
			}
		},
		pasteTreeNode : function(meta) {
			if (meta) {
				var data ={
					sourceId : $('#copyNodeId').val(),
					targetId : meta.id	
				};
				SiteMgr.ajaxPost(data,SiteMgr.pageUrl + 'pastetreenode',function(result){
					console.log(result);
					if (result.success) {
						$('#copyNodeId').val(0);
						return SiteMgr.tree.updateTreeNode('add', result.data);
					}
					return SiteMgr.showMsg(result.msg);
				});
			} else {
				SiteMgr.showMsg("您没有选择任何节点");
			}
		},
		updateTreeNode : function(act, nodeData) {
			//console.log(act,nodeData);
		},
		removeTreeNode : function(meta) {
			var data = {
				id : meta.id,
				pid : meta.pid
			};
			SiteMgr.post(data, SiteMgr.pageUrl + 'remove');
			SiteMgr.tree.refreshTree();
		},
		refreshTree : function() {
			SiteMgr.deviceTree.deleteChildItems(0);
			SiteMgr.deviceTree.loadJSON(SiteMgr.pageUrl + "listSites");
			//SiteMgr.deviceTree.refreshItem("0");
		},
		onClickHandler : function(meta) {
			SiteMgr.tabs.clear();
		},
		onCtxMenuEvent : function(menuItemId, meta) {
			if (menuItemId == "addDevice") {
				return SiteMgr.dialog.addDeviceNodeDlg.show(meta);
			}
			if (menuItemId == "edit") {
				return SiteMgr.dialog.editTreeNodeDlg.show(meta);
			}
			if (menuItemId == "remove") {
				return SiteMgr.tree.removeTreeNode(meta);
			}
			if (menuItemId == "search") {
				return SiteMgr.dialog.searchTreeNodeDlg.show();
			}
			if (menuItemId == "refresh") {
				return SiteMgr.tree.refreshTree();
			}
			if (menuItemId == "copy") {
				return SiteMgr.tree.copyTreeNode(meta);
			}
			if (menuItemId == "paste") {
				return SiteMgr.tree.pasteTreeNode(meta);
			}
			if (menuItemId == "sitePro") {
				return SiteMgr.dialog.propertiesDlg.show(meta);
			}
			return;
		}
	},
	//
	//
	datatables : {
		comunicateDt : {
			getMetaRows : function() {
				var rows = [];
				SiteMgr.comunicateDt.rows().indexes().each(function(idx) {
					rows.push(SiteMgr.comunicateDt.row(idx).data())
				});
				return rows;
			},
			loadData : function(rows) {
				for ( var row in rows) {
					SiteMgr.comunicateDt.row.add(rows[row]).draw();
				}
			},
			createRow:function(){
				return {
					"index" : "1",
					"msgId" : "",
					"actType" : "",
					"destIP" : "",
					"msgType" : "",
					"sendTime" : "",
					"sendContent" : "",
					"sendStatus" : "",
					"recvTime" : "",
					"recvContent" : "",
					"recvStatus" : "",
					"recvMsgCount" : ""
				} 
			},
			clear : function() {
				SiteMgr.comunicateDt.clear().draw();
			},
			delRow : function() {
				var rows = SiteMgr.comunicateDt.rows('.selected').remove().draw();
			},
			upRow : function() {
				var index = SiteMgr.comunicateDt.row('.selected').index();
				SiteMgr.datatables.resortRows(index, 'up', SiteMgr.comunicateDt);
			},
			downRow : function() {
				var index = SiteMgr.comunicateDt.row('.selected').index();
				SiteMgr.datatables.resortRows(index, 'down', SiteMgr.comunicateDt);
			},
			renderDefaultValueColumn : function(data, type, row, meta) {
				return data || "";
			},
			renderDefaultTextColumn : function(data, type, row, meta) {
				return data || "";
			},
			renderDataSourceColumn : function(data, type, row, meta) {
				return data || "";
			},
			renderDataTypeColumn : function(data, type, row, meta) {
				return data || "string";
			},
			renderWidthColumn : function(data, type, row, meta) {
				return data || 100;
			},
			renderRequiredColumn : function(data, type, row, meta) {
				return data || false;
			},
			renderAutoCompleteColumn : function(data, type, row, meta) {
				return data || false;
			},
			renderContentColumn : function(data, type, row, meta) {
				return data || "";
			},
			renderOptionsColumn : function(data, type, row, meta) {
				var index = meta.row;
				return "<a href=\"javascript:SiteMgr.datatables.comunicateDt.delRow()\"><span class=\"glyphicon glyphicon-remove\"></span></a>";
			}
		},
		renderIndexColumn : function(data, type, row, meta) {
			if (typeof (meta.row) == "number") {
				return meta.row + 1;
			}
			return (meta.row[0] + 1);
		},
		resortRows : function(index, type, table) {
			var maxIndex = table.rows().data().length - 1;
			var moveIndex = ("up" == type) ? index - 1 : index + 1;
			if (moveIndex >= 0 && moveIndex <= maxIndex) {
				var currRow = table.row(index).data();
				var moveRow = table.row(moveIndex).data();
				table.row(index).data(moveRow);
				table.row(moveIndex).data(currRow);
				table.draw();
				SiteMgr.datatables.selectedRow(table, moveIndex);
			}
		},
		selectedRow : function(table, index) {
			table.$('tr.selected').removeClass('selected');
			table.$('tr:eq(' + index + ')').addClass('selected');
		}
	},
	// 弹窗
	dialog : {
		addSiteNodeDlg : {
			show : function() {
				$('#add_site_modal').modal("show");
				SiteMgr.tree.addSiteNode();
			}
		},
		editSiteNodeDlg : {
			show : function(meta) {
				$('#edit_site_modal').modal("show");
				SiteMgr.tree.editSiteNode(meta);
			}
		},
		addDeviceNodeDlg : {
			show : function(meta) {
				$('#add_device_modal').modal("show");
				SiteMgr.tree.addDeviceNode(meta);
			}
		},
		editDeviceNodeDlg : {
			show : function(meta) {
				$('#edit_device_modal').modal("show");
				SiteMgr.tree.editDeviceNode(meta);
			}
		},
		editTreeNodeDlg:{
			show : function(meta) {
				if(meta.flag == 0) {
					return SiteMgr.dialog.editSiteNodeDlg.show(meta);
				}
				return SiteMgr.dialog.editDeviceNodeDlg.show(meta);
			}
		},
		searchTreeNodeDlg : {
			show : function() {
				$('#searchTreeNodeDlg').modal("show");
				SiteMgr.initSearchTreeNodeDt();
			},
			find : function() {
				SiteMgr.searchTreeNodeDt.clear().draw();
				var fieldName = $('#fieldName').val();
				var keyword = $('#Keyword').val();
				var url = SiteMgr.pageUrl + 'search?fieldName=' + fieldName + '&keyword=' + keyword;
				SiteMgr.searchTreeNodeDt.ajax.url(url).load();
			}
		},
		propertiesDlg : {
			show : function(meta) {
				$('#propertiesDlg').modal("show");
				SiteMgr.dialog.propertiesDlg.loadData(meta);
			},
			loadData : function(meta) {
				for ( var propName in meta) {
					var id = "#reportProp_" + propName;
					var value = SiteMgr.utils.getPropertyValue(propName, meta);
					$(id).text(value);
				}
			}
		}
	},
	//
	// 设备参数查询
	//
	device:{
		findAllParam:function(){		
			var id =  SiteMgr.deviceTree.getSelectedItemId();
			if(!id){
				return SiteMgr.showMsg("请选择一个站点或设备");
			}
			
			var meta = SiteMgr.deviceTree.getUserData(id, 'meta');	
			var data ={siteId:meta.id};
			SiteMgr.socketIO.sendMsg("findAll", data)
		},
		getParamList:function(){
			var id =  SiteMgr.deviceTree.getSelectedItemId();
			if(!id){
				return SiteMgr.showMsg("请选择一个站点或设备");
			}
			
			var meta = SiteMgr.deviceTree.getUserData(id, 'meta');
			var data ={siteId:meta.id};
			console.log(meta);
			console.log(data);
			SiteMgr.socketIO.sendMsg("getParams", data)
		}
	},
	//
	// utils函数
	//
	utils : {
		getPropertyValue : function(name, object) {
			var value = object[name];
			if (name == "flag") {
				return SiteMgr.utils.getFlagName(value);
			}
			if (name == "layout") {
				return SiteMgr.utils.getLayoutName(value);
			}
			if (name == "hasChild") {
				return value ? "有" : "无";
			}
			if (name == "status") {
				return value == 1 ? "锁定" : "编辑";
			}
			return value;
		},
		getFlagName : function(flag) {
			if (flag == 0) {
				return "站点";
			}
			if (flag == 1) {
				return "设备";
			}
			return "其他";
		}
	}
};

$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push($.trim(this.value) || '');
		} else {
			o[this.name] = $.trim(this.value) || '';
		}
	});
	return o;
};