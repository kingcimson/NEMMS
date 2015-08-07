var siteMgrPageUrl = XFrame.getContextPath() + '/site/';
$(function() {
	
	$('#west').panel({
		tools : [ {
			iconCls : 'icon-search',
			handler : SiteMgr.dialogs.searchSiteDlg.open
		}, {
			iconCls : 'icon-add',
			handler : SiteMgr.dialogs.addSiteNodeDlg.open
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
		onClick : SiteMgr.siteTree.onClickHandler,
		onDblClick : function(node) {
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
	
	//datagrids
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
	
	//dialogs
	$('#add-site-dlg').dialog({
		closed : true,
		modal : true,
		width : 560,
		height : 380,
		iconCls:'icon-add',
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
		iconCls:'icon-edit',
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
		height : 380,
		iconCls:'icon-add',
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
		height : 380,
		iconCls:'icon-edit',
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
		maximizable:true,
		iconCls:'icon-search',
		buttons : [ {
			text : '关闭',
			iconCls : 'icon-no',
			handler : function() {
				$("#search-site-dlg").dialog('close');
			}
		} ]
	});
	
	$('#btn-search-site').bind('click',SiteMgr.siteTree.search);
	
//end
});

var SiteMgr = {
		paramOption:{},
		deviceParamConfig:{},
		deviceParamCategories:{},
		init:function(){
			SiteMgr.initEventBind();
		},
		initEventBind:function(){
		},
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
				EasyUIUtils.showMsg(data.msg);
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		siteTree:{
			onClickHandler:function(node){
				$('#site-tree').tree('options').url = siteMgrPageUrl + 'listChildNodes';
				$('#site-tree').tree('expand', node.target);
			},
			addSiteNode : function() {
				$('#add-site-form').resetForm();
				$("#treeAction").val("addSite");
			},
			addDeviceNode : function(meta) {
				$('#add-device-form').resetForm();
				$("#treeAction").val("addDevice");
				$('#device_pid').val(meta.id);
			},
			editSiteNode : function(meta) {
				$('#edit-site-form').resetForm();
				$("#treeAction").val("editSite");
				$('#edit-site-form').autofill(meta);
			},
			editDeviceNode : function(meta) {
				$('#edit-device-form').resetForm();
				$("#treeAction").val("editDevice");
				$('#edit-device-form').autofill(meta);
			},
			saveNode : function() {
				var act = $("#treeAction").val();
				var actUrl = "";
				var formId = "";
				var modalId = "";

				if (act == "addSite") {
					actUrl = siteMgrPageUrl + "addSite";
					formId = "#add-site-form";
					modalId = "#add-site-dlg"
				} else if (act == "editSite") {
					actUrl = siteMgrPageUrl + "editSite";
					formId = "#edit-site-form";
					modalId = "#edit-site-dlg"
				} else if (act == "addDevice") {
					actUrl = siteMgrPageUrl + "addDevice";
					formId = "#add-device-form";
					modalId = "#add-device-dlg"
				} else if (act == "editDevice") {
					actUrl = siteMgrPageUrl + "editDevice";
					formId = "#edit-device-form";
					modalId = "#edit-device-dlg"
				}
				SiteMgr.post($(formId).serialize(), actUrl, function() {
					$(modalId).dialog('close');
					SiteMgr.siteTree.reload();
				});
			},
			remove : function(meta) {
				var data = {
					id : meta.id,
					pid : meta.pid
				};
				SiteMgr.post(data, siteMgrPageUrl + 'remove');
				SiteMgr.siteTree.reload();
			},
			getSelectedTreeNode : function() {
				return $('#site-tree').tree('getSelected');
			},
			reload : function() {
				$('#site-tree').tree('reload');
			},
			search :function() {
				var fieldName = $('#site-field-name').combobox('getValue');
				var keyword = $('#site-keyword').val();
				var url = siteMgrPageUrl + 'search?fieldName=' + fieldName + '&keyword=' + keyword;
				return EasyUIUtils.loadToDatagrid('#search-site-result', url);
			},
			contextMenu:{
				onSelect:function(item){
					if (item.name == "add-site") {
						return SiteMgr.dialogs.addSiteNodeDlg.open();
					}
					if (item.name == "add-device") {
						return SiteMgr.dialogs.addDeviceNodeDlg.open();
					}
					if (item.name == "edit") {
						return SiteMgr.dialogs.editTreeNodeDlg.open();
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
		//end
		},
		paramTabs:{
		
		//end
		},
		consoleTabs:{
			
		//end	
		},
		dialogs:{
			addSiteNodeDlg : {
				open : function() {
					$('#add-site-dlg').dialog('open').dialog('center');
					SiteMgr.siteTree.addSiteNode();
				}
			},
			editSiteNodeDlg : {
				open : function(meta) {
					$('#edit-site-dlg').dialog('open').dialog('center');
					SiteMgr.siteTree.editSiteNode(meta);
				}
			},
			addDeviceNodeDlg : {
				open : function(meta) {
					$('#add-device-dlg').dialog('open').dialog('center');
					SiteMgr.siteTree.addDeviceNode(meta);
				}
			},
			editDeviceNodeDlg : {
				open : function(meta) {
					$('#edit-device-dlg').dialog('open').dialog('center');
					SiteMgr.siteTree.editDeviceNode(meta);
				}
			},
			editTreeNodeDlg : {
				open : function(meta) {
					if (meta.flag == 0) {
						return SiteMgr.dialogs.editSiteNodeDlg.open(meta);
					}
					return SiteMgr.dialogs.editDeviceNodeDlg.open(meta);
				}
			},
			searchSiteDlg:{
				open:function(){
					$('#search-site-dlg').dialog('open').dialog('center');
					EasyUIUtils.clearDatagrid('#search-site-result');
				}
			}
		}
//end
};