<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录--裕源大通网元监控与管理系统</title>
<link rel="icon" href="<%=request.getContextPath()%>/assets/images/favicon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login.css">
<script src="<%=request.getContextPath()%>/assets/js/frames/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugins/jquery-validate/jquery.validate.min.js"></script>
<%@ include file="/WEB-INF/jsp-views/includes/config.jsp"%>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/login.js"></script>
</head>
<body>
	<form id="login-form" name="login-form">
		<div id="login-container">
			<img class="login-bg-image" src="<%=request.getContextPath()%>/assets/images/login_bg_left.gif" />
			<div id="login-main">
				<div id="login-left">
					<div id="login-left-main">
						<img id="logo" title="裕源大通" src="<%=request.getContextPath()%>/assets/images/logo.png"><br />
						<p class="system-name">网元监控与管理系统</p>
					</div>
				</div>
				<div id="login-right">
					<div id="login-right-main">
						<p>
							<span>用户名:</span><input type="text" id="account" name="account" class="txtinput" maxlength="100" />
						</p>
						<p>
							<span>密 码:</span><input type="password" id="password" name="password" class="txtinput" maxlength="64" />
						</p>
						<%-- <p>
						<span>验证码:</span><input type="text" id="validCode" name="validCode" class="txtinput" />
					</p>
					 <p class="login-form-validatecode">
						<img id="imgValidCode" style="border-width: 0px;" onclick="recodeimg();" alt="看不清?点一下"
							src="<%=request.getContextPath()%>/assets/images/GetValidateCode.jpg"><a href="javascript:recodeimg();">看不清?点一下</a>
					</p> --%>
						<p>
							<span></span><input type="checkbox" id="rememberMe" name="rememberMe" /><label>记住密码</label>
						</p>
						<p>
							<input type="button" id="btnLogin" name="btnLogin" class="login-submit" value="登录"
								onclick="javascript:MembershipLogin.login();">
						</p>
					</div>
					<div id="login-message-tips"></div>
				</div>
			</div>
			<img class="login-bg-image" alt="裕源大通" src="<%=request.getContextPath()%>/assets/images/login_bg_right.gif"> <br
				class="clear" />
		</div>
	</form>
</body>
</html>