var SiteMgr = {
	deviceTree : null,
	sqlColumnDt : null,
	queryParamDt : null,
	searchTreeNodeDt : null,
	viewHistorySqlDt : null,
	sqlEditor : null,
	viewSqlEditor : null,
	viewHistorySqlEditor : null,
	pageUrl : XFrame.getContextPath() + '/report/designer/',
	dsListUrl : XFrame.getContextPath() + '/report/ds/list',
	sqlColumnOptions : [ {
		name : "optional",
		text : "可选",
		type : 1
	}, {
		name : "percent",
		text : "百分比",
		type : 1
	}, {
		name : "displayInMail",
		text : "邮件显示",
		type : 1
	}, {
		name : "footings",
		text : "合计",
		type : 1
	}, {
		name : "extensions",
		text : "小计",
		type : 3
	}, {
		name : "expression",
		text : "表达式",
		type : 4
	} , {
		name : "memo",
		text : "备注",
		type : 2
	} , {
		name : "format",
		text : "格式",
		type : 2
	} ],
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
	initTree : function() {
		var tree = new dhtmlXTreeObject("report-tree", "100%", "100%", 0);
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
		//tree.setXMLAutoLoading(SiteMgr.pageUrl + "listnodes");
		tree.setDataMode("json");
		tree.setDragBehavior("child");
		tree.loadJSON(SiteMgr.pageUrl + "listnodes");
		tree.setOnClickHandler(function onClick(id) {
			var meta = tree.getUserData(id, 'meta');
			SiteMgr.tree.onClickHandler(meta);
		});
		tree.attachEvent("onDrag", function(sId, tId, id, sObject) {
			SiteMgr.tree.dragTreeNode(sId,tId,sObject);
		});
		SiteMgr.deviceTree = tree;

	},
	initEditor : function() {
		SiteMgr.sqlEditor = CodeMirror.fromTextArea(document.getElementById("reportSqlText"), {
			mode : 'text/x-mysql',
			theme : 'rubyblue',
			indentWithTabs : true,
			smartIndent : true,
			lineNumbers : true,
			styleActiveLine : true,
			matchBrackets : true,
			autofocus : true,
			extraKeys : {
				"F11" : function(cm) {
					cm.setOption("fullScreen", !cm.getOption("fullScreen"));
				},
				"Esc" : function(cm) {
					if (cm.getOption("fullScreen")){cm.setOption("fullScreen", false);}
				},
				"Tab" : "autocomplete"
			}
		});
		SiteMgr.sqlEditor.on("change", function(cm, obj) {
			if (obj.origin == "setValue") {
				$('#reportIsChange').val(0);
			} else {
				$('#reportIsChange').val(1);
			}
		});
		SiteMgr.datatables.setSqlEditorStatus();

		SiteMgr.viewSqlEditor = CodeMirror.fromTextArea(document.getElementById("viewSqlText"), {
			mode : 'text/x-mysql',
			theme : 'rubyblue',
			indentWithTabs : true,
			smartIndent : true,
			lineNumbers : true,
			matchBrackets : true,
			autofocus : true
		});

		SiteMgr.viewHistorySqlEditor = CodeMirror.fromTextArea(document.getElementById("viewHistorySqlText"), {
			mode : 'text/x-mysql',
			theme : 'rubyblue',
			indentWithTabs : true,
			smartIndent : true,
			lineNumbers : true,
			matchBrackets : true,
			autofocus : true,
			extraKeys : {
				"F11" : function(cm) {
					cm.setOption("fullScreen", !cm.getOption("fullScreen"));
				},
				"Esc" : function(cm) {
					if (cm.getOption("fullScreen")){cm.setOption("fullScreen", false);}
				}
			}
		});
	},
	initEventBind : function() {
		$('#reportStatus').change(SiteMgr.datatables.setSqlEditorStatus);
		$('#btnTreeSearch').click(SiteMgr.dialog.searchTreeNodeDlg.show);
		$('#search').click(SiteMgr.dialog.searchTreeNodeDlg.find);
		$('#btnTreeAdd').click(SiteMgr.dialog.addTreeNodeDlg.show);
		$("#btnTreeRefresh").click(SiteMgr.tree.refreshTree);
		$('#btnExecSql').click(SiteMgr.editor.executeSql);
		$('#btnNewReport').click(SiteMgr.config.save);
		$('#btnEditReport').click(SiteMgr.config.edit);
		$('#btnSaveExpr').click(SiteMgr.datatables.sqlColumnDt.saveExpression);
		$('#btnSaveMemo').click(SiteMgr.datatables.sqlColumnDt.saveMemo);
		$('#btnSaveFormat').click(SiteMgr.datatables.sqlColumnDt.saveFormat);
		$('#btnViewSqlText').click(SiteMgr.dialog.viewSqlTextDlg.show);
		$('#btnViewHistorySqlText').click(SiteMgr.dialog.viewHistorySqlTextDlg.show);
		$('#btnFullScreenEditSql').click(SiteMgr.editor.fullScreenSqlEditor);
		$('#btnSqlColumnDtUp').click(SiteMgr.datatables.sqlColumnDt.upRow);
		$('#btnSqlColumnDtDown').click(SiteMgr.datatables.sqlColumnDt.downRow);
		$('#btnQueryParamDtUp').click(SiteMgr.datatables.queryParamDt.upRow);
		$('#btnQueryParamDtDown').click(SiteMgr.datatables.queryParamDt.downRow);
		$('#btnAddQueryPara').click(SiteMgr.config.setQueryParam);
		$('#btnEditQueryPara').click(SiteMgr.config.editQueryParam);
		$('#btnSaveQueryParam').click(SiteMgr.config.saveQueryParam);
		$('#btnSqlColumnDtAddRow').click(SiteMgr.datatables.sqlColumnDt.addRow);
		$('#btnSqlColumnDtRemoveRow').click(SiteMgr.datatables.sqlColumnDt.delRow);
		$('#btnViewHistorySqlTextDlgCl').click(SiteMgr.dialog.viewHistorySqlTextDlg.close);
		$('#btnViewReport').click(SiteMgr.config.previewReport);
	},
	initSqlColumnDt : function() {
		var options = DataTablePaging.getNotAjaxOptions({
			colums : [ {
				data : "index"
			}, {
				data : "name"
			}, {
				data : "text"
			}, {
				data : "type"
			}, {
				data : "dataType"
			}, {
				data : "width"
			}, {
				data : "decimals"
			}, {
				data : "sortType"
			} ],
			columsdefs : [ {
				"targets" : [ 0 ],
				"data" : "index",
				"render" : SiteMgr.datatables.renderIndexColumn
			}, {
				"targets" : [ 1 ],
				"data" : "name",
				"render" : SiteMgr.datatables.sqlColumnDt.renderNameColumn
			}, {
				"targets" : [ 2 ],
				"data" : "text",
				"render" : SiteMgr.datatables.sqlColumnDt.renderTextColumn
			}, {
				"targets" : [ 3 ],
				"data" : "type",
				"render" : SiteMgr.datatables.sqlColumnDt.renderTypeColumn
			}, {
				"targets" : [ 6 ],
				"data" : "decimals",
				"render" : SiteMgr.datatables.sqlColumnDt.renderDecimalsColumn
			}, {
				"targets" : [ 7 ],
				"data" : "sortType",
				"render" : SiteMgr.datatables.sqlColumnDt.renderSortTypeColumn
			}, {
				"targets" : [ 8 ],
				"render" : SiteMgr.datatables.sqlColumnDt.renderOptionsColumn
			} ]
		});
		SiteMgr.sqlColumnDt = $('#sqlColumnDt').DataTable(options);
		$('#sqlColumnDt tbody').on('click', 'tr', function() {
			SiteMgr.sqlColumnDt.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		});
	},
	initQueryParamDt : function() {
		var options = DataTablePaging.getNotAjaxOptions({
			colums : [ {
				data : "index"
			}, {
				data : "name"
			}, {
				data : "text"
			}, {
				data : "defaultValue"
			}, {
				data : "defaultText"
			}, {
				data : "formElement"
			}, {
				data : "dataSource"
			}, {
				data : "dataType"
			}, {
				data : "width"
			}, {
				data : "required"
			}, {
				data : "autoComplete"
			} ],
			columsdefs : [ {
				"targets" : [ 0 ],
				"data" : "index",
				"render" : SiteMgr.datatables.renderIndexColumn
			}, {
				"targets" : [ 3 ],
				"data" : "defaultValue",
				"render" : SiteMgr.datatables.queryParamDt.renderDefaultValueColumn
			}, {
				"targets" : [ 4 ],
				"data" : "defaultText",
				"render" : SiteMgr.datatables.queryParamDt.renderDefaultTextColumn
			}, {
				"targets" : [ 6 ],
				"data" : "dataSource",
				"render" : SiteMgr.datatables.queryParamDt.renderDataSourceColumn
			}, {
				"targets" : [ 7 ],
				"data" : "dataType",
				"render" : SiteMgr.datatables.queryParamDt.renderDataTypeColumn
			}, {
				"targets" : [ 8 ],
				"data" : "width",
				"render" : SiteMgr.datatables.queryParamDt.renderWidthColumn
			}, {
				"targets" : [ 9 ],
				"data" : "required",
				"render" : SiteMgr.datatables.queryParamDt.renderRequiredColumn
			}, {
				"targets" : [ 10 ],
				"data" : "autoComplete",
				"render" : SiteMgr.datatables.queryParamDt.renderAutoCompleteColumn
			},{
				"targets" : [ 11 ],
				"render" : SiteMgr.datatables.queryParamDt.renderOptionsColumn
			} ]
		});
		SiteMgr.queryParamDt = $('#queryParamDt').DataTable(options);
		$('#queryParamDt tbody').on('dblclick', 'tr', function() {
			var data = SiteMgr.queryParamDt.row(this).data();
			var index = SiteMgr.queryParamDt.row(this).index();
			$('#queryParamGridIndex').val(index);
			$('#reportQueryParamForm').autofill(data);
		});
		$('#queryParamDt tbody').on('click', 'tr', function() {
			SiteMgr.queryParamDt.$('tr.selected').removeClass('selected');
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
	initViewHistorySqlDt : function(){
		var options = DataTablePaging.getNotAjaxPagingOptions({
			pageLength:5,
			order: [0,'desc'],
			colums : [ {
				data : "createTime"
			}, {
				data : "author"
			}],
		});
		SiteMgr.viewHistorySqlDt = $('#viewHistorySqlDt').DataTable(options);
		$('#viewHistorySqlDt tbody').on('dblclick', 'tr', function() {
			var data = SiteMgr.viewHistorySqlDt.row(this).data();
			var index = SiteMgr.viewHistorySqlDt.row(this).index();
			SiteMgr.viewHistorySqlEditor.setValue(data.sqlText);
		});
	},
	initTabs : function(){
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			if($(e.target).text()=="查询参数"){
				SiteMgr.queryParamDt.columns.adjust().draw();
			}
		});
	},
	init : function() {
		SiteMgr.initTree();
		SiteMgr.initEditor();
		SiteMgr.initEventBind();
		SiteMgr.initSqlColumnDt();
		SiteMgr.initQueryParamDt();
		SiteMgr.initTabs();
		SiteMgr.loadDataSource();
	},
	loadDataSource : function() {
		$.getJSON(SiteMgr.dsListUrl, null, function(data) {
			$("#reportDsId").empty();
			var html = "";
			for (var i = 0; i < data.length; i++) {
				var opt = data[i];
				var selected = opt.selected ? ' selected="true"' : '';
				html += '<option' + selected + ' value="' + opt.value + '">' + opt.text + '</option>'
			}
			$('#reportDsId').html(html);
			$('#reportDsId').select2();
		});
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
	config : {
		create : function() {

		},
		edit : function() {
			$('#reportAction').val("edit");
			SiteMgr.config.save();
		},
		save : function() {
			if ($("#reportConfigForm").valid()) {
				var metaRows = SiteMgr.datatables.sqlColumnDt.getMetaRows();
				if (metaRows == null || metaRows.length == 0) {
					return SiteMgr.showMsg("没有任何报表SQL配置列选项");
				}

				var currRows = SiteMgr.datatables.sqlColumnDt.getRows(metaRows);
				var columnTypeMap = SiteMgr.datatables.sqlColumnDt.getColumnTypeMap(currRows);
				if (columnTypeMap.layout == 0 || columnTypeMap.stat == 0) {
					return SiteMgr.showMsg("您没有设置布局列或者统计列");
				}
				var emptyExprColumns = SiteMgr.datatables.sqlColumnDt.getEmptyExprColumns(currRows);
				if (emptyExprColumns && emptyExprColumns.length > 0) {
					return SiteMgr.showMsg("计算列：[" + emptyExprColumns.join() + "]没有设置表达式！");
				}

				var reportId = $("#reportId").val();
				var act = $('#reportAction').val();
				var data = {
					id : reportId,
					pid : $('#reportPid').val(),
					dsId : $('#reportDsId').select2("val"),
					dataRange : $('#reportDataRange').val(),
					name : $("#reportName").val(),
					uid : $("#reportUid").val(),
					layout : $("#reportLayout").val(),
					sqlText : SiteMgr.sqlEditor.getValue(),
					metaColumns : JSON.stringify(currRows),
					status : $("#reportStatus").val(),
					sequence : $("#reportSequence").val(),
					isChange : $('#reportIsChange').val() == 0 ? false : true
				};
				SiteMgr.ajaxPost(data, SiteMgr.pageUrl + '' + act, function(result) {
					if (result.success) {
						SiteMgr.showMsg(result.msg);
						SiteMgr.tree.refreshTree();
						$('#reportIsChange').val(0);
						$('#reportAction').val("add");
					}
				});
			}
		},
		saveChanged : function(meta, callback) {
			var isChanged = $("#reportIsChange").val() == 0 ? false : true;
			if (!isChanged) {
				return callback(meta);
			}
		},
		saveQueryParam : function() {
			var id = $("#queryParamReportId").val();
			var queryParamRows = SiteMgr.datatables.queryParamDt.getMetaRows();
			if (queryParamRows == null || queryParamRows.length == 0) {
				$('#jsonQueryParams').val("");
			} else {
				$('#jsonQueryParams').val(JSON.stringify(queryParamRows));
			}
			var data = {
				id : id,
				jsonQueryParams : $('#jsonQueryParams').val()
			};
			SiteMgr.ajaxPost(data, SiteMgr.pageUrl + 'setqueryparam', function(result) {
				if (result.success) {
					SiteMgr.showMsg(result.msg);
					SiteMgr.tree.refreshTree();
				}
			});
		},
		editQueryParam : function() {
			var index = $("#queryParamGridIndex").val();
			var row = $('#reportQueryParamForm').serializeObject();
			row.required = $('#queryParamIsRequired').prop("checked");
			row.autoComplete = $('#queryParamIsAutoComplete').prop("checked");
			SiteMgr.queryParamDt.row(index).data(row);
			SiteMgr.queryParamDt.draw();
		},
		setQueryParam : function() {
			if (!$("#reportQueryParamForm").valid()) {
				return;
			}
			var row = $('#reportQueryParamForm').serializeObject();
			row.required = $('#queryParamIsRequired').prop("checked");
			row.autoComplete = $('#queryParamIsAutoComplete').prop("checked");
			SiteMgr.queryParamDt.row.add(row).draw();
		},
		toggleButton : function(action) {
			if (action == 'add') {
				$('#btnNewReport').removeClass('disabled');
				$('#btnEditReport').addClass('disabled');
				$('#btnViewReport').addClass('disabled');
			} else {
				$('#btnNewReport').addClass('disabled');
				$('#btnEditReport').removeClass('disabled');
				$('#btnViewReport').removeClass('disabled');
			}
		},
		previewReport:function(){
			var uid = $('#reportUid').val();
			var previewUrl = XFrame.getContextPath() + "/report/uid/" + uid;
			window.open(previewUrl,"_blank");
		}
	},
	editor : {
		executeSql : function() {
			if ($("#reportConfigForm").valid()) {
				var loading = $.loading('正在加载中').show();
				var sqlText = SiteMgr.sqlEditor.getValue();
				if (sqlText == "") {
					return SiteMgr.showMsg("未发现操作的SQL语句");
				}
				
				var queryParamRows = SiteMgr.datatables.queryParamDt.getMetaRows();
				var jsonQueryParams = queryParamRows.length > 0 ? JSON.stringify(queryParamRows) : "";
				var data = {
					sqlText : sqlText,
					dsId : $('#reportDsId').select2("val"),
					jsonQueryParams : jsonQueryParams
				};
				SiteMgr.ajaxPost(data, SiteMgr.pageUrl + 'loadsqlcolumns', function(result) {
					loading.destroy();
					if (result.success) {
						SiteMgr.datatables.sqlColumnDt.loadRows(result.data);
					}else{
						SiteMgr.showMsg(result.msg);
					}
				});
			}
		},
		fullScreenSqlEditor : function() {
			SiteMgr.editor.fullScreen(SiteMgr.sqlEditor);
		},
		fullScreen : function(cm) {
			cm.setOption("fullScreen", !cm.getOption("fullScreen"));
		},
		clearAll : function() {
			SiteMgr.sqlEditor.setValue("");
			SiteMgr.viewSqlEditor.setValue("");
			SiteMgr.viewHistorySqlEditor.setValue("");
		},
	},
	tabs : {
		clear : function() {
			$('#reportConfigForm').resetForm();
			$('#reportQueryParamForm').resetForm();
			SiteMgr.sqlEditor.setValue("");
			SiteMgr.datatables.sqlColumnDt.clear();
			SiteMgr.datatables.queryParamDt.clear();
		},
		loadData : function(meta) {
			SiteMgr.tabs.clear();
			$('#reportConfigForm').autofill(meta);
			$('#reportSqlText').text(meta.sqlText);
			$('#reportDsId').select2("val", meta.dsId);
			$("#reportId").val(meta.id)
			$("#queryParamReportId").val(meta.id)
			SiteMgr.sqlEditor.setValue(meta.sqlText);

			var metaColumnRows = $.parseJSON((meta.metaColumns == null || meta.metaColumns == "") ? "[]" : meta.metaColumns);
			var queryParamRows = $.parseJSON((meta.queryParams == null || meta.queryParams == "") ? "[]" : meta.queryParams);
			SiteMgr.datatables.sqlColumnDt.loadData(metaColumnRows);
			SiteMgr.datatables.queryParamDt.loadData(queryParamRows);
		},
	},
	//
	// 报表树相关操作
	//
	tree : {
		addRootTreeNode : function() {
			var data = {
				"id" : 0,
				"name" : "根节点"
			};
			SiteMgr.tree.addTreeNode(data);
		},
		addChildTreeNode : function(meta) {
			var id = meta.id;
			if (id) {
				var data = {
					"id" : id,
					"name" : meta.name,
				};
				SiteMgr.tree.addTreeNode(data);
			}
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
		addTreeNode : function(data) {
			$('#addTreeNodeForm').resetForm();
			$("#addTreeNodeParentName").val(data.name);
			$("#treeNodePid").val(data.id);
			$("#treeNodeId").val(0);
		},
		editTreeNode : function(meta) {
			if (meta) {
				$('#editTreeNodeForm').resetForm();
				$('#editTreeNodeForm').autofill(meta);
				$("#editTreeNodePid").val(meta.pid);
				$("#editTreeNodeId").val(meta.id);
				$("#editTreeNodeHasChild").val(meta.hasChild ? "1" : "0");
			}
		},
		saveTreeNode : function(act) {
			var actUrl = act == "add" ? SiteMgr.pageUrl + "/addtreenode" : SiteMgr.pageUrl + "/edittreenode";
			var formId = act == "add" ? '#addTreeNodeForm' : '#editTreeNodeForm';
			var modalId = act == "add" ? '#addTreeNodeDlg' : '#editTreeNodeDlg';
			SiteMgr.post($(formId).serialize(), actUrl, function() {
				SiteMgr.tree.refreshTree();
				$(modalId).modal("hide");
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
			console.log(act,nodeData);
//			if (nodeData == null) {
//				return;
//			}
//			if (act == "add") {
//				var newNode = nodeData[0];
//				var pid = newNode.attributes.pid;
//				// 如果是增加根节点
//				if (pid == "0") {
//					var roots = $('#reportingTree').tree('getRoots');
//					if (roots && roots.length > 0) {
//						$('#reportingTree').tree('insert', {
//							after : roots[roots.length - 1].target,
//							data : newNode
//						});
//					} else {
//						$('#reportingTree').tree('reload');
//					}
//				} else {
//					var parentNode = Reporting.getTreeNodeById(pid);
//					$('#reportingTree').tree('append', {
//						parent : parentNode.target,
//						data : nodeData
//					});
//				}
//				Reporting.selectTreeNode(newNode.id);
//				var currNode = Reporting.getSelectedTreeNode();
//				return currNode ? Reporting.selectTreeNodeHandler(currNode) : null;
//			}
//			if (act == "edit") {
//				var node = Reporting.getTreeNodeById(nodeData.id);
//				nodeData["target"] = node.target;
//				$('#reportingTree').tree('update', nodeData);
//				return Reporting.loadDataToPropertiesTab(nodeData.attributes);
//			}
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
			SiteMgr.deviceTree.loadJSON(SiteMgr.pageUrl + "listnodes");
			//SiteMgr.deviceTree.refreshItem("0");
		},
		onClickHandler : function(meta) {
			SiteMgr.tabs.clear();
			SiteMgr.config.saveChanged(meta, function(data) {
				if (data.flag != 1) {
					$('#reportAction').val('add');
					$('#reportPid').val(data.id);
					SiteMgr.config.toggleButton('add');
				} else {
					SiteMgr.config.toggleButton('');
					SiteMgr.tabs.loadData(data);
				}
			});
		},
		onCtxMenuEvent : function(menuItemId, meta) {
			if (menuItemId == "addReport") {
				return SiteMgr.dialog.addTreeNodeDlg.show();
			}
			if (menuItemId == "addNode") {
				return SiteMgr.dialog.addTreeNodeDlg.showAddChild(meta);
			}
			if (menuItemId == "editNode") {
				return SiteMgr.dialog.editTreeNodeDlg.show(meta);
			}
			if (menuItemId == "setComment") {
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
			if (menuItemId == "reportPro") {
				return SiteMgr.dialog.propertiesDlg.show(meta);
			}
			return;
		}
	},
	//
	//
	datatables : {
		sqlColumnDt : {
			getMetaRows : function() {
				var rows = [];
				SiteMgr.sqlColumnDt.rows().indexes().each(function(idx) {
					rows.push(SiteMgr.sqlColumnDt.row(idx).data())
				});
				return rows;
			},
			loadData : function(rows) {
				for ( var row in rows) {
					SiteMgr.sqlColumnDt.row.add(rows[row]).draw();
				}
			},
			loadRows : function(newRows) {
				var metaRows = SiteMgr.datatables.sqlColumnDt.getMetaRows();
				if (metaRows == null || metaRows.length == 0) {
					return SiteMgr.datatables.sqlColumnDt.loadData(newRows);
				}

				var currRows = SiteMgr.datatables.sqlColumnDt.getRows(metaRows);
				var oldRowMap = {};
				for (var i = 0; i < currRows.length; i++) {
					var name = currRows[i].name;
					oldRowMap[name] = currRows[i];
				}
				for (var i = 0; i < newRows.length; i++) {
					var name = newRows[i].name;
					if (oldRowMap[name]) {
						oldRowMap[name].dataType = newRows[i].dataType;
						oldRowMap[name].width = newRows[i].width;
						newRows[i] = oldRowMap[name];
					}
				}
				$.each(currRows, function(i,row){
					  if(row.type == 4){newRows.push(row);}
				});
	
				SiteMgr.datatables.sqlColumnDt.clear();
				return SiteMgr.datatables.sqlColumnDt.loadData(newRows);
			},
			getRows : function(metaRows) {
				for (var rowIndex = 0; rowIndex < metaRows.length; rowIndex++) {
					var row = metaRows[rowIndex];
					var subOptions = SiteMgr.datatables.sqlColumnDt.getCheckboxOptions(row.type);
					for (var optIndex = 0; optIndex < subOptions.length; optIndex++) {
						var option = subOptions[optIndex];
						var optionId = "#" + option.name + rowIndex;
						row[option.name] = $(optionId).prop("checked");
					}
					row["name"] = $("#name" + rowIndex).val();
					row["text"] = $("#text" + rowIndex).val();
					row["type"] = $("#type" + rowIndex).val();
					row["sortType"] = $("#sortType" + rowIndex).val();
					row["decimals"] = $("#decimals" + rowIndex).val();
				}
				return metaRows;
			},
			getColumnTypeMap : function(rows) {
				var typeMap = {
					"layout" : 0,
					"dim" : 0,
					"stat" : 0,
					"computed" : 0
				};
				for (var i = 0; i < rows.length; i++) {
					if (rows[i].type == 1){typeMap.layout += 1;}else if (rows[i].type == 2){typeMap.dim += 1;}else if (rows[i].type == 3){typeMap.stat += 1;}else if (rows[i].type == 4){typeMap.computed += 1;}
				}
				return typeMap;
			},
			getEmptyExprColumns : function(rows) {
				var emptyColumns = [];
				for (var i = 0; i < rows.length; i++) {
					var row = rows[i];
					if (row.type == 4 && $.trim(row.expression) == "") {
						emptyColumns.push(row.name);
					}
				}
				return emptyColumns;
			},
			getCheckboxOptions : function(type) {
				var checkboxOptions = [];
				if (type == 4) {
					checkboxOptions = $.grep(SiteMgr.sqlColumnOptions, function(option, i) {
						return option.type == 1;
					});
				} else if (type == 3) {
					checkboxOptions = $.grep(SiteMgr.sqlColumnOptions, function(option, i) {
						return option.type == 1 || option.type == 2;
					});
				} else {
					checkboxOptions = $.grep(SiteMgr.sqlColumnOptions, function(option, i) {
						return option.type == 3;
					});
				}
				return checkboxOptions;
			},
			clear : function() {
				SiteMgr.sqlColumnDt.clear().draw();
			},
			addRow : function() {
				SiteMgr.sqlColumnDt.row.add({
					"name" : "",
					"text" : "",
					"type" : "4",
					"dataType" : "DECIMAL",
					"width" : "42",
					"decimals" : "",
					"sortType" : "",
					"options" : ""
				}).draw();
			},
			delRow : function() {
				SiteMgr.sqlColumnDt.rows('.selected').remove().draw();
				//rows = SiteMgr.datatables.sqlColumnDt.getMetaRows();
				//SiteMgr.datatables.sqlColumnDt.loadRows(rows);
			},
			upRow : function() {
				var index = SiteMgr.sqlColumnDt.row('.selected').index();
				SiteMgr.datatables.resortRows(index, 'up', SiteMgr.sqlColumnDt);
			},
			downRow : function() {
				var index = SiteMgr.sqlColumnDt.row('.selected').index();
				SiteMgr.datatables.resortRows(index, 'down', SiteMgr.sqlColumnDt);
			},
			renderNameColumn : function(data, type, row, meta) {
				var index = meta.row;
				var id = "name" + index;
				return "<input style=\"width:98%;\" type=\"text\" id=\"" + id + "\" name=\"name\" value=\"" + row.name + "\" />";
			},
			renderTextColumn : function(data, type, row, meta) {
				var index = meta.row;
				var id = "text" + index;
				return "<input style=\"width:98%;\" type=\"text\" id=\"" + id + "\" name=\"text\" value=\"" + row.text + "\" />";
			},
			renderDecimalsColumn : function(data, type, row, meta) {
				var index = meta.row;
				var id = "decimals" + index;
				if (!row.decimals) {
					row.decimals = 0;
				}
				return "<input style=\"width:42px;\" type=\"text\" id=\"" + id + "\" name=\"text\" value=\"" + row.decimals + "\" />";
			},
			renderTypeColumn : function(data, type, row, meta) {
				var index = meta.row;
				var options = [ {
					text : "布局列",
					value : 1
				}, {
					text : "维度列",
					value : 2
				}, {
					text : "统计列",
					value : 3
				}, {
					text : "计算列",
					value : 4
				} ];

				var id = "type" + index;
				var count = options.length;
				var selectHtmlText = "<select id=\"" + id + "\" name=\"type\">";
				for (var i = 0; i < count; i++) {
					var selected = options[i].value == row.type ? 'selected="selected"' : '';
					selectHtmlText += "<option value=\"" + options[i].value + "\" " + selected + ">" + options[i].text + "</option>";
				}
				selectHtmlText += "</select>";
				return selectHtmlText;
			},
			renderSortTypeColumn : function(data, type, row, meta) {
				var index = meta.row;
				var options = [ {
					text : "默认",
					value : 0
				}, {
					text : "数字优先升序",
					value : 1
				}, {
					text : "数字优先降序",
					value : 2
				}, {
					text : "字符优先升序",
					value : 3
				}, {
					text : "字符优先降序",
					value : 4
				} ];

				var id = "sortType" + index;
				var count = options.length;
				var selectHtmlText = "<select id=\"" + id + "\" name=\"sortType\">";
				for (var i = 0; i < count; i++) {
					var selected = options[i].value == row.sortType ? 'selected="selected"' : '';
					selectHtmlText += "<option value=\"" + options[i].value + "\" " + selected + ">" + options[i].text + "</option>";
				}
				selectHtmlText += "</select>";
				return selectHtmlText;
			},
			renderOptionsColumn : function(data, type, row, meta) {
				var index = meta.row;
				var subOptions = [];
				
				//4:计算列,3:统计列,2:维度列,1:布局列
				if (row.type == 4) {
					subOptions = $.grep(SiteMgr.sqlColumnOptions, function(option, i) {
						return option.type == 1 || option.type == 2 || option.type == 4;
					});
				} else if (row.type == 3) {
					subOptions = $.grep(SiteMgr.sqlColumnOptions, function(option, i) {
						return option.type == 1 || option.type == 2;
					});
				} else {
					subOptions = $.grep(SiteMgr.sqlColumnOptions, function(option, i) {
						return option.type == 2 || option.type == 3;
					});
				}

				var htmlOptions = [];
				for (var i = 0; i < subOptions.length; i++) {
					var name = subOptions[i].name;
					var id = name + index;
					var text = subOptions[i].text;
					var checked = row[name] ? " checked=\"checked\"" : "";
					var html = "";
					if (name == "expression" || name == "memo" || name == "format") {
						var imgSrc = XFrame.getContextPath() + "/assets/modules/report/icons/"+ name +".png";
						var onClick = " onclick =\"javascript:SiteMgr.dialog."+ name +"Dlg.show("+ index +")\"";
						html = "<img style=\"cursor: pointer;\" id=\"" + id + "\" title=\"" + text + "\" src=\"" + imgSrc + "\"" + onClick + "/>";
					} else {
						html = "<input type=\"checkbox\" id=\"" + id + "\" name=\"" + name + "\"" + checked + ">" + text + "</input>";
					}
					htmlOptions.push(html);
				}
				return htmlOptions.join(" ");
			},
			saveExpression : function() {
				var row = SiteMgr.sqlColumnDt.row('.selected').data();
				row.expression = $("#columnExpression").val();
				$('#expressionDlg').modal("hide");
			},
			saveMemo : function() {
				var row = SiteMgr.sqlColumnDt.row('.selected').data();
				row.comment = $("#columnMemo").val();
				$('#memoDlg').modal("hide");
			},
			saveFormat : function() {
				var row = SiteMgr.sqlColumnDt.row('.selected').data();
				row.format = $("#columnFormat").val();
				$('#formatDlg').modal("hide");
			}
		},
		queryParamDt : {
			getMetaRows : function() {
				var rows = [];
				SiteMgr.queryParamDt.rows().indexes().each(function(idx) {
					rows.push(SiteMgr.queryParamDt.row(idx).data())
				});
				return rows;
			},
			loadData : function(rows) {
				for ( var row in rows) {
					SiteMgr.queryParamDt.row.add(rows[row]).draw();
				}
			},
			clear : function() {
				SiteMgr.queryParamDt.clear().draw();
			},
			delRow : function() {
				var rows = SiteMgr.queryParamDt.rows('.selected').remove().draw();
			},
			upRow : function() {
				var index = SiteMgr.queryParamDt.row('.selected').index();
				SiteMgr.datatables.resortRows(index, 'up', SiteMgr.queryParamDt);
			},
			downRow : function() {
				var index = SiteMgr.queryParamDt.row('.selected').index();
				SiteMgr.datatables.resortRows(index, 'down', SiteMgr.queryParamDt);
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
				return "<a href=\"javascript:SiteMgr.datatables.queryParamDt.delRow()\"><span class=\"glyphicon glyphicon-remove\"></span></a>";
			}
		},
		setSqlEditorStatus : function() {
			var status = $("#reportStatus").val();
			if (status > 0) {
				return SiteMgr.sqlEditor.setOption("readOnly", "nocursor");
			}
			return SiteMgr.sqlEditor.setOption("readOnly", false);
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
		addTreeNodeDlg : {
			show : function() {
				$('#addTreeNodeDlg').modal("show");
				SiteMgr.tree.addRootTreeNode();
			},
			showAddChild : function(meta) {
				$('#addTreeNodeDlg').modal("show");
				SiteMgr.tree.addChildTreeNode(meta);
			},
		},
		editTreeNodeDlg : {
			show : function(meta) {
				$('#editTreeNodeDlg').modal("show");
				SiteMgr.tree.editTreeNode(meta);
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
		},
		viewSqlTextDlg : {
			show : function() {
				var sqlText = SiteMgr.sqlEditor.getValue();
				var dataRange = $('#reportDataRange').val();
				if (sqlText == "") {
					return SiteMgr.showMsg("未发现操作的SQL语句");
				}

				var queryParamRows = SiteMgr.datatables.queryParamDt.getMetaRows();
				var jsonQueryParams = queryParamRows.length > 0 ? JSON.stringify(queryParamRows) : "";
				var data = {
					sqlText : sqlText,
					dsId : $('#reportDsId').select2("val"),
					dataRange : dataRange,
					jsonQueryParams : jsonQueryParams
				};
				$('#viewSqlTextDlg').modal("show");
				SiteMgr.viewSqlEditor.setValue('');
				SiteMgr.ajaxPost(data, SiteMgr.pageUrl + 'viewsqltext', function(result) {
					SiteMgr.viewSqlEditor.setValue(result.data);
				});
			},
		},
		viewHistorySqlTextDlg : {
			show : function() {
				var reportId = $("#reportId").val();
				$('#viewHistorySqlTextDlg').modal("show");
				if(SiteMgr.viewHistorySqlDt==null){
					SiteMgr.initViewHistorySqlDt();
				}
				SiteMgr.viewHistorySqlDt.columns.adjust().draw();
				url = SiteMgr.pageUrl  + 'getallhistorysql?reportId=' + reportId,
				SiteMgr.viewHistorySqlDt.ajax.url(url).load();
			},
			close : function() {
				SiteMgr.viewHistorySqlEditor.setValue("");
				$('#viewHistorySqlTextDlg').modal("hide");
			}
		},
		expressionDlg : {
			show : function(index) {
				$('#expressionDlg').modal("show");
				$("#columnExpression").val("");
				var row = SiteMgr.sqlColumnDt.row(index).data();
				$("#columnExpression").val(row.expression);
			}
		},
		memoDlg : {
			show : function(index) {		
				$('#memoDlg').modal("show");
				$("#columnMemo").val("");
				var row = SiteMgr.sqlColumnDt.row(index).data();
				$("#columnMemo").val(row.comment);
			}
		},
		formatDlg : {
			show : function(index) {
				$('#formatDlg').modal("show");
				$("#columnFormat").val("");
				var row = SiteMgr.sqlColumnDt.row(index).data();
				$("#columnFormat").val(row.format);
			}
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
				return "树节点";
			}
			if (flag == 1) {
				return "报表节点";
			}
			return "其他";
		},
		getLayoutName : function(layout) {
			if (layout == 1) {
				return "横向布局";
			}
			if (layout == 2) {
				return "纵向布局";
			}
			return "无";
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