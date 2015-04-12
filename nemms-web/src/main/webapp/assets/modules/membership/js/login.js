MembershipLogin = {
	URL : {
		"login" : XFrame.getContextPath() + '/authenticate',
		"successUrl" : XFrame.getContextPath() + '/home/index'
	},
	init : function() {
		$("#account").focus();
		document.onkeydown = function(e) {
			var evt = e ? e : (window.event ? window.event : null)
			if (evt.keyCode == 13)
				MembershipLogin.login();
		}
	},
	tipsTimer: null,
	tips: function(type, content) {
		type = type === 'error' ? 'danger' : type;
		var html = '<div class="login-alert alert alert-' + type + '" role="alert">'
					+	'<button class="close" data-dismiss="alert">×</button>'
					+	'<i class="fa-fw fa fa-' + (type === 'danger' ? 'warning' : 'check') + '"></i>'
					+	'<span id="loginErrorTips">' + content + '</span>'
					+'</div>';

		var tipsContainer = $('#loginMessageTips');
		tipsContainer.html(html);

		this.tipsTimer && clearTimeout(this.tipsTimer);
		this.tipsTimer = setTimeout(function() {
			tipsContainer.html('');
		}, 4000)
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