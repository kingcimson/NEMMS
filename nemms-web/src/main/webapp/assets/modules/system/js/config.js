var DictConfig = {
	pageUrl : XFrame.getContextPath() + '/system/config/',
	dt : null,
	ajaxPost : function(data, url, callback) {
		$.ajax({
			type : 'POST',
			url : url,
			data : data,
			dataType : "json",
			cache : false,
			beforeSend : function(data) {
			},
			success : function(json) {
				$.smallBox({
					title : json.msg,
					color : "#739E72",
					iconSmall : "fa fa-times fadeInRight animated",
					timeout : 4000
				});
				if (json.success) {
					if (callback) {
						callback();
					}
				}
			}
		});
	},
	validator : function() {
		$("#add_form").validate({
			rules : {
				sequence : {
					digits : true
				}
			}
		});
		$("#edit_form").validate({
			rules : {
				sequence : {
					digits : true,
				}
			}
		});
	},
	load : function(id) {
		var url = DictConfig.pageUrl + 'list?id=' + id;
		DictConfig.dt.ajax.url(url).load();
	},
	init : function() {
		$('#search').on('click', DictConfig.find);
		$('#add_btn').on('click', DictConfig.showAddChildModal);
		$('#add_root_btn').on('click', DictConfig.showAddRootModal);
		$('#delete_btn').on('click', DictConfig.remove);
		$('#list_root_btn').on('click', DictConfig.listRootConfig);
	},
	loadDataTables : function() {
		var url = DictConfig.pageUrl + 'list';
		DictConfig.dt.ajax.url(url).load();
	},
	runDataTables : function() {
		var options = DataTablePaging.getAjaxPagingOptions({
			ajaxUrl : DictConfig.pageUrl + 'list?id=0',
			order : [ 4, 'desc' ],
			colums : [ {
				data : "id",
				name : "id"
			}, {
				data : "name",
				name : "name"
			}, {
				data : "key",
				name : "key"
			}, {
				data : "value",
				name : "value"
			}, {
				data : "createTime",
				name : "create_time"
			} ],
			columsdefs : [ {
				"targets" : [ 5 ],
				"data" : "id",
				"render" : function(data, type, row, meta) {
					var rowIndex = meta.row;
					return "<a href=\"javascript:DictConfig.showEditModal('" + rowIndex
							+ "')\"><span class=\"glyphicon glyphicon-edit\"></span></a> " + "<a href=\"javascript:DictConfig.showDelDialog('" + data
							+ "')\"><span class=\"glyphicon glyphicon-remove\"></span></a>";
				}
			} ]
		});
		var dt = DictConfig.dt = $('#dataTable1').DataTable(options);
	},
	showAddModal : function(pid) {
		var name = "无";
		if (pid > 0) {
			var mataData = tree.getUserData(pid, 'meta');
			name = (mataData == null ? "无" : mataData.name);
		}
		$("#modal_action").val("add");
		$("#add_form").resetForm();
		$("#parent").val(name);
		$("#pid").val(pid);
		$('#add_modal').modal('show');
		$("#add_submit").attr("onclick", "javascript:DictConfig.save();");
	},
	showEditModal : function(rowIndex) {
		var row = DictConfig.dt.row(rowIndex).data();
		$('#edit_modal').modal('show');
		$("#modal_action").val("edit");
		$("#edit_form").resetForm();
		$("#edit_modal_title").text("编辑[" + row.name + "]");
		$("#edit_form").autofill(row);
		$("#edit_submit").attr("onclick", "javascript:DictConfig.save();");
	},
	showDelDialog : function(id) {
		$("#delete_alert_message").text("确定删除[" + id + "]？");
		$("#delete_id").val(id);
		$('#delete_message_modal').modal('show');
	},
	showAddChildModal : function() {
		var id = tree.getSelectedItemId();
		if (id == '') {
			$.smallBox({
				title : "请选择一个父配置项",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		} else {
			DictConfig.showAddModal(id);
		}
	},
	showAddRootModal : function() {
		DictConfig.showAddModal(0);
	},
	listRootConfig : function() {
		DictConfig.load(0);
	},
	find : function() {
		var fieldName = $("#fieldName").val();
		var keyword = $("#Keyword").val();
		var url = DictConfig.pageUrl + 'find?fieldName=' + fieldName + '&keyword=' + keyword;
		DictConfig.dt.ajax.url(url).load();
	},
	save : function() {
		var action = $('#modal_action').val();
		var formId = action == "edit" ? "#edit_form" : "#add_form";
		var modalId = action == "edit" ? "#edit_modal" : "#add_modal";
		if ($(formId).validate().form()) {
			var url = DictConfig.pageUrl + action;
			var data = $(formId).serialize();
			DictConfig.ajaxPost(data, url, function() {
				var id = tree.getSelectedItemId();
				DictConfig.load(id);
				$(modalId).modal('hide');
			});
		}
	},
	remove : function() {
		var id = $("#delete_id").val();
		var data = {
			id : id
		};
		DictConfig.ajaxPost(data, DictConfig.pageUrl + 'remove', function() {
			var id = tree.getSelectedItemId();
			DictConfig.load(id);
			$('#delete_message_modal').modal('hide');
		});
	}
};

$(function() {
	DictConfig.init();
	DictConfig.runDataTables();
	DictConfig.validator();
});
