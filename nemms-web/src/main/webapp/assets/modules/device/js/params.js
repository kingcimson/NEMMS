var DeviceParam = {
	pageUrl : XFrame.getContextPath() + '/device/params/',
	dt : null,
	configItems : null,
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
					DeviceParam.loadDataTables();
				}
				if (callback) {
					callback();
				}
			}
		});
	},
	init : function() {
		$('#search').on('click', DeviceParam.find);
		$('#add_btn').on('click', DeviceParam.showAddModal);
	},
	loadConfigItems : function() {
		var url = XFrame.getContextPath() + '/system/config/getConfigItems'
		$.getJSON(url, {
			parentKey : "deviceParam"
		}, function(data) {
			DeviceParam.configItems = data;
			DeviceParam.fillSelect();
		});
	},
	fillSelect:function(){
		var map = {
			"categoryId" : DeviceParam.configItems.deviceParamCategory,
			"mode" : DeviceParam.configItems.deviceParamMode,
			"valueType" : DeviceParam.configItems.deviceParamValueType,
			"warnLevel" : DeviceParam.configItems.deviceParamWarnLevel
		};
		
		$('#filter_categoryId').empty();
		$('#filter_categoryId').append("<option value='all' selected>全部</option>");
		$.each(map["categoryId"], function(i, item) {
			$('#filter_categoryId').append("<option value='" + item.value + "'>" + item.name + "</option>");
		});
		
		for(var key in map){
			$('#'+key).empty();
			$('#edit_'+key).empty();
			$.each(map[key], function(i, item) {
				$('#'+key).append("<option value='" + item.value + "'>" + item.name + "</option>");
				$('#edit_'+key).append("<option value='" + item.value + "'>" + item.name + "</option>");
			});
		}
	},
	loadDataTables : function() {
		var url = DeviceParam.pageUrl + 'list';
		DeviceParam.dt.ajax.url(url).load();
	},
	initDataTables : function() {
		var options = DataTablePaging
				.getAjaxPagingOptions({
					ajaxUrl : DeviceParam.pageUrl + 'list',
					order : [ 0, 'desc' ],
					colums : [ {
						data : "id",
						name : "id"
					}, {
						data : "name",
						name : "name"
					}, {
						data : "categoryId",
						name : "category_id"
					}, {
						data : "mode",
						name : "mode"
					}, {
						data : "unit",
						name : "unit"
					}, {
						data : "ratio",
						name : "ratio"
					}, {
						data : "valueType",
						name : "value_type"
					}, {
						data : "valueLen",
						name : "value_len"
					}, {
						data : "valueMinLen",
						name : "value_min_len"
					}, {
						data : "valueMaxLen",
						name : "value_max_len"
					}, {
						data : "minValue",
						name : "min_value"
					}, {
						data : "maxValue",
						name : "max_value"
					}, {
						data : "authorityRoles",
						name : "authority_roles"
					}, {
						data : "warnLevel",
						name : "warn_level"
					} ],
					columsdefs : [ {
						"targets" : [ 14 ],
						"data" : "id",
						"render" : function(data, type, row, meta) {
							var rowIndex = meta.row;
							return "<a href=\"javascript:DeviceParam.showEditModal('"
									+ rowIndex
									+ "')\"><span class=\"glyphicon glyphicon-edit\"></span></a><a href=\"javascript:DeviceParam.showDelDialog('"
									+ data
									+ "')\"><span class=\"glyphicon glyphicon-remove\"></span></a>";
						}
					},{
						"targets" : [ 2 ],
						"data" : "categoryId",
						"render" : function(data) {
							var categories = DeviceParam.configItems.deviceParamCategory;
							var result =$.grep(categories,function(item,i){
								return item.value == data 
							});
							return result.length ? result[0].name : "其他";
						}
					},{
						"targets" : [ 3 ],
						"data" : "mode",
						"render" : function(data) {
							var categories = DeviceParam.configItems.deviceParamMode;
							var result =$.grep(categories,function(item,i){
								return item.value == data 
							});
							return result.length ? result[0].name : "其他";
						}
					},{
						"targets" : [ 12 ],
						"data" : "authorityRoles",
						"render" : function(data) {
							return data;
						}
					},{
						"targets" : [ 13 ],
						"data" : "warnLevel",
						"render" : function(data) {
							var categories = DeviceParam.configItems.deviceParamWarnLevel;
							var result =$.grep(categories,function(item,i){
								return item.value == data 
							});
							return result.length ? result[0].name : "其他";
						}
					} ]
				});
		var dt = DeviceParam.dt = $('#datatable1').DataTable(options);
		$('#datatable1 tbody').on('dblclick', 'tr', function() {
			var rowIndex = DeviceParam.dt.row(this).index();
			DeviceParam.showEditModal(rowIndex);
		});
	},
	showAddModal : function() {
		$("#modal_action").val("add");
		$("#add_form").resetForm();
		$('#add_modal').modal('show');
		$("#add_submit").attr("onclick", "javascript:DeviceParam.save();");
	},
	showEditModal : function(rowIndex) {
		var row = DeviceParam.dt.row(rowIndex).data();
		$('#edit_modal').modal('show');
		$("#modal_action").val("edit");
		$("#edit_form").resetForm();
		$("#edit_modal_title").text("编辑[" + row.name + "]");
		$("#edit_form").autofill(row);
		$("#edit_submit").attr("onclick", "javascript:DeviceParam.save();");
	},
	showDelDialog : function(id) {
		$("#delete_message").text("确定删除[" + id + "]？");
		$("#delete_id").val(id);
		$('#delete_dialog').dialog('open');
	},
	find : function() {
		var categoryId = $("#filter_categoryId").val();
		var fieldName = $("#fieldName").val();
		var keyword = $("#keyword").val();
		var url = DeviceParam.pageUrl + 'find?categoryId=' + categoryId
				+ '&fieldName=' + fieldName + '&keyword=' + keyword;
		DeviceParam.dt.ajax.url(url).load();
	},
	save : function() {
		var action = $('#modal_action').val();
		var formId = action == "edit" ? "#edit_form" : "#add_form";
		var modalId = action == "edit" ? "#edit_modal" : "#add_modal";
		if ($(formId).validate().form()) {
			var url = DeviceParam.pageUrl + action;
			var data = $(formId).serialize();
			DeviceParam.ajaxPost(data, url, function() {
				$(modalId).modal('hide');
			});
		}
	},
	remove : function(id) {
		var data = {
			id : id
		};
		DeviceParam.ajaxPost(data, DeviceParam.pageUrl + 'remove');
	}
}

$("#delete_dialog").dialog({
	autoOpen : false,
	modal : true,
	title : "提示",
	buttons : [ {
		html : "取消",
		"class" : "btn btn-default",
		click : function() {
			$(this).dialog("close");
		}
	}, {
		html : "<i class='fa fa-check'></i>&nbsp; 确定",
		"class" : "btn btn-primary",
		click : function() {
			var id = $("#delete_id").val();
			DeviceParam.remove(id);
			$(this).dialog("close");
		}
	} ]
});

$(function() {
	DeviceParam.loadConfigItems();
	DeviceParam.initDataTables();
	DeviceParam.init();
});
