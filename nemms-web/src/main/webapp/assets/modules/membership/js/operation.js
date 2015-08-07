var MembershipOperation = {
	dt : null,
	pageUrl : XFrame.getContextPath() + '/membership/operation/',
	load : function(id) {
		var url = MembershipOperation.pageUrl + 'getoperations?id=' + id;
		MembershipOperation.dt.ajax.url(url).load();
	},
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
					MembershipOperation.load(tree.getSelectedItemId());
				}
				if (callback) {
					callback();
				}
			}
		});
	},
	addOperationModal : function() {
		var id = tree.getSelectedItemId();
		if (id != '') {
			$('#add_operation_modal').modal('show');
			$.getJSON(XFrame.getContextPath() + '/membership/module/getModuleById?id=' + id, function(result) {
				$('#moduleId').val(result.name);
				$("#code").val(result.code + ":*");
			});
		} else {
			$.smallBox({
				title : "请选择所属模块",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		}
	},
	addOperation : function() {
		$('#moduleId').val(tree.getSelectedItemId());
		if ($('#add_operation_form').validate().form()) {
			var url = MembershipOperation.pageUrl + 'add';
			MembershipOperation.ajaxPost($('#add_operation_form').serialize(), url, function() {
				$('#add_operation_modal').modal('hide');
			});
		}
	},
	editOperationModal : function(rowIndex) {
		var row = MembershipOperation.dt.row(rowIndex).data();
		$("#edit_operation_form").resetForm();
		$("#edit_operation_form").autofill(row);
		$("#edit_operation_submit").attr("onclick", "javascript:MembershipOperation.editOperation();");
		$('#operationId').val(row.operationId),
		$('#edit_operation_modal').modal('show');
	},
	editOperation : function() {
		if ($('#edit_operation_form').validate().form()) {
			var url =MembershipOperation.pageUrl + 'edit';
			MembershipOperation.ajaxPost($('#edit_operation_form').serialize(), url, function(){
				$('#edit_operation_modal').modal('hide');
			});
		}
	},
	deleteOperationModal : function(rowIndex) {
		var row = MembershipOperation.dt.row(rowIndex).data();
		var id = tree.getSelectedItemId();
		if (id == '') {
			$.smallBox({
				title : "请选择所属模块",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		} else {
			$("#config_delete_btn").attr("onclick", "javascript:MembershipOperation.remove('" + row.operationId + "');");
			$("#delete_alert_message").text("确定删除操作[" + row.name + "]？");
			$('#delete_message_modal').modal('show');
		}
	},
	remove : function(uid) {
		var data = {
			id : uid
		};
		MembershipOperation.ajaxPost(data, MembershipOperation.pageUrl + 'removeById',function(){
			tree.refreshItem("0");
			$('#delete_message_modal').modal('hide');
			$("#operation_delete_btn").attr("onclick", "");
		});
	},
	createDatatables : function() {
		var options = DataTablePaging.getOptions({
			ajaxUrl : MembershipOperation.pageUrl + 'getoperations?id=0',
			colums : [ {
				"data" : "operationId"
			}, {
				"data" : "code"
			}, {
				"data" : "name"
			}, {
				"data" : "comment"
			}, {
				"data" : "createTime"
			} ],
			columsdefs : [ {
				"targets" : [ 5 ],
				"data" : "operationId",
				"render" : function(data, type, row, meta) {
					var rowIndex = meta.row;
					return "<a href=\"javascript:MembershipOperation.editOperationModal('" + rowIndex + "')\"><span class=\"glyphicon glyphicon-edit\">  </a>  " +
						   "<a href=\"javascript:MembershipOperation.deleteOperationModal('" + rowIndex + "')\"><span class=\"glyphicon glyphicon-remove\"></a>";
				}
			} ]
		});
		var dt = MembershipOperation.dt = $('#example').DataTable(options);
	},
	validator : function() {
		$("#add_operation_form").validate({
			rules : {
				code : {
					required : true
				},
				sequence : {
					required : true,
				},
				comment : {
					required : true,
					minlength : 2
				},
				name : {
					required : true,
					minlength : 2
				}
			},
			messages : {
				code : {
					required : '请填写操作代码',
				},
				sequence : {
					required : '请填写排序号',
				},
				comment : {
					required : '请填写评论',
					minlength : '请输入一个 长度最少是2的字符串'
				},
				name : {
					required : '操作名称',
					minlength : '请输入一个 长度最少是2的字符串'
				}
			}
		});
		$("#edit_operation_form").validate({
			rules : {
				code : {
					required : true,
				},
				sequence : {
					required : true,
				},
				comment : {
					required : true,
					minlength : 2
				},
				name : {
					required : true,
					minlength : 2
				}
			},
			messages : {
				code : {
					required : '请填写操作代码',
				},
				sequence : {
					required : '请填写排序号',
				},
				comment : {
					required : '请填写评论',
					minlength : '请输入一个 长度最少是2的字符串'
				},
				name : {
					required : '操作名称',
					minlength : '请输入一个 长度最少是2的字符串'
				}
			}
		});
	}
};
$(function() {
	MembershipOperation.createDatatables();
});