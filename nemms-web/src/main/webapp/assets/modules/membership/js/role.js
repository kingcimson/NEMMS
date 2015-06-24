var MembershipRole = {
	pageUrl : XFrame.getContextPath() + '/membership/role/',
	load : function(id) {
		$("#rolepid").val(id);
		$.getJSON(MembershipRole.pageUrl + 'getRoleById?id=' + id, function(result) {
			$("#role_name").val(result.name);
			$("#role_code").val(result.code);
			$("#isSystem").val(result.isSystem);
			$("#status").val(result.status);
			$("#role_sequence").val(result.sequence);
			moduleTree.deleteChildItems("0");
			moduleTree.loadJSON(MembershipRole.pageUrl + 'getoperations?id=' + id);
			$("#role_comment").val(result.comment);
			$("input[name='deviceParamProps']").prop("checked",false);
			alert(result.deviceParamProps);
		});
	},
	validator : function() {
		jQuery.validator.addMethod("code", function(value, element) {
			var code = /^[a-zA-Z]+$/;
			return this.optional(element) || (code.test(value));
		}, "代号只能为3-12位英文字母");
		$("#edit_role_form").validate({
			onkeyup : false,
			rules : {
				role_name : "required",
				role_code : {
					"required" : true,
					rangelength : [ 3, 12 ],
					code : true
				},
				role_sequence : "required"
			},
			messages : {
				role_name : "请填写角色名称",
				role_sequence : "请填写角色排序"
			}
		})
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
				if (callback) {
					callback();
				}
				$.smallBox({
					title : json.msg,
					color : "#739E72",
					iconSmall : "fa fa-times fadeInRight animated",
					timeout : 4000
				});
			}
		});
	},
	createRoles : function() {
		var data = {
			name : $("#role_name").val(),
			code : $("#role_code").val(),
			isSystem : $("#isSystem").val(),
			status : $("#status").val(),
			sequence : $("#role_sequence").val(),
			comment : $("#role_comment").val(),
			modules : moduleTree.getAllCheckedChildless(),
			operations : moduleTree.getAllCheckedChildless(),
			deviceParamProps : $("input[name='deviceParamProps']:checked").map(function(){ return $(this).val();}).get().join(",")
		};
		if ($('#edit_role_form').validate().form()) {
			var url = MembershipRole.pageUrl + 'add';
			MembershipRole.ajaxPost(data, url, function() {
				MembershipRole.reloadTree('id', 'add');
			});
		}
	},
	editRoles : function() {
		var data = {
			"roleId" : roleTree.getSelectedItemId(),
			"name" : $("#role_name").val(),
			"code" : $("#role_code").val(),
			"isSystem" : $("#isSystem").val(),
			"status" : $("#status").val(),
			"sequence" : $("#role_sequence").val(),
			"comment" : $("#role_comment").val(),
			"operations" : moduleTree.getAllCheckedChildless(),
			"deviceParamProps" : $("input[name='deviceParamProps']:checked").map(function(){ return $(this).val();}).get().join(",")
		};
		var id = roleTree.getSelectedItemId();
		if (id == '') {
			$.smallBox({
				title : "请选择一个角色",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		} else {
			if ($('#edit_role_form').validate().form()) {
				var url = MembershipRole.pageUrl + 'edit';
				MembershipRole.ajaxPost(data, url, function() {
					MembershipRole.reloadTree(id, 'edit');
				});
			}
		}
	},
	deleteRolesModal : function() {
		var id = roleTree.getSelectedItemId();
		if (id == '') {
			$.smallBox({
				title : "请选择一个角色",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		} else {
			$("#role_delete_btn").attr("onclick", "javascript:MembershipRole.deleteRoles('" + id + "');");
			$("#delete_alert_message").text("确定删除？");
			$('#delete_message_modal').modal('show');
		}

	},
	deleteRoles : function(uid) {
		$.post(MembershipRole.pageUrl + 'removeById', {
			id : uid
		}, function(json) {
			MembershipRole.reloadTree(uid, 'del');
			$('#delete_message_modal').modal('hide');
			$("#role_delete_btn").attr("onclick", "");
			$.smallBox({
				title : json.msg,
				color : "#739E72",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		}, 'json');
	},
	reloadTree : function(id, action) {
		roleTree.deleteChildItems("0");
		roleTree.loadJSON(MembershipRole.pageUrl + 'list');
	}
};

$(function() {
	$(document).ready(function() {
		$("#chkAll").click(function() {
			if ($('#chkAll').is(':checked')) {
				moduleTree.setSubChecked(0, true);
			} else {
				moduleTree.setSubChecked(0, false);
			}
		});
		$("#checkAllDeviceParamProps").click(function() {
			$("input[name='deviceParamProps']").prop("checked",$('#checkAllDeviceParamProps').is(':checked'));
		});
	});
});
