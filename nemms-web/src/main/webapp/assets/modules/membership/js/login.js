MembershipLogin = {
	URL : {
		"login" : WebRequest.getContextPath() + '/authenticate',
		"successUrl" : WebRequest.getContextPath() + '/home/index'
	},
	init : function() {
		$("#account").focus();
		document.onkeydown = function(e) {
			var evt = e ? e : (window.event ? window.event : null)
			if (evt.keyCode == 13)
				MembershipLogin.login();
		};
		$("#login-message-tips").hide();
	},
	tipsTimer : null,
	tips : function(type, content) {
		var tipsContainer = $('#login-message-tips');
		tipsContainer.html(content);
		tipsContainer.show();
	},
	login : function() {
		if ($('#login-form').validate().form()) {
			var postData = {
				"account" : $("#account").val(),
				"password" : $("#password").val(),
				"rememberMe" : $("#rememberMe").prop("checked")
			};
			$.post(MembershipLogin.URL.login, postData, function(data) {
				if (!data.success) {
					MembershipLogin.tips('error', data.msg);
				} else {
					MembershipLogin.tips('success', '登录成功，正在跳转...');
					location = MembershipLogin.URL.successUrl;
				}
			}, 'json');
		}
	}
};

$(function() {
	// Validation
	$("#login-form").validate({
		// Rules for form validation
		rules : {
			account : {
				required : true,
			},
			password : {
				required : true,
				minlength : 3,
				maxlength : 20
			}
		},

		// Messages for form validation
		messages : {
			account : {
				required : '请输入您的账号'
			},
			password : {
				required : '请输入您的密码',
				minlength : '密码不能小于3个字符'
			}
		},

		// Do not change code below
		errorPlacement : function(error, element) {
			error.insertAfter(element.parent());
		}
	});

	MembershipLogin.init();
});
