var MembershipUser = {
	dt : null,
	pageUrl : XFrame.getContextPath() + '/membership/user/',
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
					MembershipUser.loadDataTables();
				}
				if (callback) {
					callback();
				}
			}
		});
	},
	init : function() {
		$('#search_user').on('click', MembershipUser.findUserByKeyword);
		$('#add_user').on('click', MembershipUser.addUserModal);
		$('#save_password').on('click', MembershipUser.revisePassword);
		$('#add_user_submit').on('click', MembershipUser.save);
	},
	loadDataTables : function() {
		var url = MembershipUser.pageUrl + 'getusers';
		MembershipUser.dt.ajax.url(url).load();
	},
	runDataTables : function() {
		var options = DataTablePaging.getAjaxPagingOptions({
			ajaxUrl : MembershipUser.pageUrl + 'getusers',
			order : [ 6, 'desc' ],
			colums : [ {
				data : "userId",
				name : "user_id"
			}, {
				data : "account",
				name : "account"
			}, {
				data : "name",
				name : "name"
			}, {
				data : "telephone",
				name : "telephone"
			}, {
				data : "email",
				name : "email"
			}, {
				data : "status",
				name : "status"
			}, {
				data : "createTime",
				name : "create_time"
			} ],
			columsdefs : [
					{
						"targets" : [ 5 ],
						"data" : "status",
						"render" : function(data) {
							var status = data = 1 ? "正常" : "暂停";
							return status;
						}
					},
					{
						"targets" : [ 7 ],
						"data" : "userId",
						"render" : function(data, type, row, meta) {
							var rowIndex = meta.row;
							return "<a href=\"javascript:MembershipUser.editUserModal('" + rowIndex
									+ "')\"><span class=\"glyphicon glyphicon-edit\"></span></a>   "
									+ "<a href=\"javascript:MembershipUser.revisePasswordModal('" + rowIndex
									+ "')\"><span class=\"glyphicon glyphicon-lock\"></span></a>   "
									+ "<a href=\"javascript:MembershipUser.deleteUserDialog('" + rowIndex
									+ "')\"><span class=\"glyphicon glyphicon-remove\"></span></a>";
						}
					} ]
		});
		var dt = MembershipUser.dt = $('#example').DataTable(options);
	},
	findUserByKeyword : function() {
		var fieldName = $("#fieldName").val();
		var keyword = $("#Keyword").val();
		var url = MembershipUser.pageUrl + 'getusersbykeyword?fieldName=' + fieldName + '&keyword=' + keyword;
		MembershipUser.dt.ajax.url(url).load();
	},
	addUserModal : function() {
		$("#modal_title").text("添加用户");
		$('#add_user_form').resetForm();
		$("#user_template_action").val("add");
		$('#add_user_modal').modal('show');
	},
	save : function() {
		var action = $("#user_template_action").val();
		var formId = action == "add" ? "#add_user_form" : "#edit_user_form";
		var modalId = action == "add" ? "#add_user_modal" : "#edit_user_modal";
		var roles = action == "add" ? "#add_roles" : "#edit_roles";
		var trees = action == "add" ? tree1 : tree2;
		$(roles).val(trees.getAllChecked());
		if ($(formId).validate().form()) {
			var url = MembershipUser.pageUrl + action;
			var data = $(formId).serialize();
			MembershipUser.ajaxPost(data, url, function() {
				$(modalId).modal('hide');
			});
		}
	},
	revisePasswordModal : function(rowIndex) {
		var row = MembershipUser.dt.row(rowIndex).data();
		$("#revise_account").text(row.account);
		$("#revise_password_id").val(row.userId);
		$('#revise_password_modal').modal('show');
	},
	revisePassword : function() {
		if ($('#revise_password_form').validate().form()) {
			var data = {
				userId : $("#revise_password_id").val(),
				password : $("#revise_password").val()
			};
			var url = MembershipUser.pageUrl + 'updateUserPasswordById';
			MembershipUser.ajaxPost(data, url, function() {
				$('#revise_password_modal').modal('hide');
			});
		}
	},
	editUserModal : function(rowIndex) {
		var row = MembershipUser.dt.row(rowIndex).data();
		$('#edit_user_modal').modal('show');
		$("#user_template_action").val("updateUserById");
		$("#edit_modal_title").text("编辑[" + row.account + "]");
		$("#edit_account").text(row.account);
		$("#edit_user_form").autofill(row);
		tree2.deleteChildItems("0");
		tree2.loadJSON(MembershipUser.pageUrl + 'getroles?id=' + row.userId, function() {
			tree2.openAllItems(0);
		});
		$("#edit_submit").attr("onclick", "javascript:MembershipUser.save();");
	},
	deleteUserDialog : function(rowIndex) {
		var row = MembershipUser.dt.row(rowIndex).data();
		$("#delete_message").text("确定删除[" + row.name + "]？");
		$("#delete_id").val(row.userId);
		$('#delete_dialog').dialog('open');
	},
	remove : function() {
		var id = $("#delete_id").val();
		var data = {
			id : id
		};
		MembershipUser.ajaxPost(data, MembershipUser.pageUrl + 'removeById');
	},
	formValidator : function() {
		jQuery.validator.addMethod("account", function(value, element) {
			var account = /^[a-zA-Z0-9]+$/;
			return this.optional(element) || (account.test(value));
		}, "用户名只能填写数字与字母");

		$('#add_user_form').validate({
			rules : {
				account : {
					required : true,
					account : true,
					minlength : 2,
					maxlength : 16
				},
				password : {
					required : true,
					minlength : 6,
					maxlength : 20
				},
				repassword : {
					required : true,
					equalTo : "#password"
				},
				telephone : {
					required : true,
				},
				email : {
					required : true,
					email : true
				},
				name : {
					required : true,
					minlength : 2
				},
				roles : {
					required : true
				}
			},
			messages : {
				account : {
					required : '请填写用户账号',
					account : '用户账号只能填写数字和字母',
					minlength : '请填写长度4-16的帐号',
					maxlength : '请填写长度4-16的帐号'
				},
				password : {
					required : '请填写登录密码',
					minlength : '请填写长度6-20的帐号',
					maxlength : '请填写长度6-20的帐号'
				},
				repassword : {
					required : '请填写确认密码',
					equalTo : '确认密码不正确'
				},
				telephone : {
					required : '请输入电话号码',
				},
				email : {
					required : '请输入电子邮箱',
					email : '请输入正确格式的邮箱'
				},
				name : {
					required : '请输入真实名称',
					minlength : '真实名称长度不能少于2'
				},
				roles : {
					required : '请选择所属角色'
				}
			}
		});
		$('#edit_user_form').validate({
			rules : {
				account : {
					required : true,
					account : true,
					minlength : 2,
					maxlength : 16
				},
				password : {
					required : true,
					minlength : 4
				},
				repassword : {
					required : true,
					equalTo : "#password"
				},
				telephone : {
					required : true,
				},
				email : {
					required : true,
					email : true
				},
				name : {
					required : true,
					minlength : 2
				},
				roles : {
					required : true
				}
			},
			messages : {
				account : {
					required : '请填写用户账号',
					account : '用户账号只能填写数字和字母',
					minlength : '请填写长度4-16的帐号',
					maxlength : '请填写长度4-16的帐号'
				},
				password : {
					required : '请填写登录密码',
					minlength : '登录密码长度为4位'
				},
				repassword : {
					required : '请填写确认密码',
					equalTo : '确认密码不正确'
				},
				telephone : {
					required : '请输入电话号码',
				},
				email : {
					required : '请输入电子邮箱',
					email : '请输入正确格式的邮箱'
				},
				name : {
					required : '请输入真实名称',
					minlength : '真实名称长度不能少于2'
				},
				roles : {
					required : '请选择所属角色'
				}
			}
		});
		
		$('#revise_password_form').validate({
			rules : {
				password : {
					required : true,
					minlength : 6,
					maxlength : 20
				},
				repassword : {
					required : true,
					minlength : 6,
					maxlength : 20,
					equalTo : "#revise_password"
				}
			},
			messages : {
				password : {
					required : '请填写登录密码',
					minlength : '请填写长度6-20的帐号',
					maxlength : '请填写长度6-20的帐号'
				},
				repassword : {
					required : '请填写登录密码',
					minlength : '请填写长度6-20的帐号',
					maxlength : '请填写长度6-20的帐号',
					equalTo : '确认密码不正确'
				}
			}
		});
	}
}

$("#message_dialog").dialog({
	autoOpen : false,
	modal : true,
	title : "提示",
	buttons : [ {
		html : "<i class='fa fa-check'></i>&nbsp; 确定",
		"class" : "btn btn-primary",
		click : function() {
			$(this).dialog("close");
		}
	} ]

});

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
			MembershipUser.remove();
			$(this).dialog("close");
		}
	} ]
});

$(function() {
	MembershipUser.formValidator();
	MembershipUser.runDataTables();
	MembershipUser.init();
});
