<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us">
	<head>
		<meta charset="UTF-8">
		<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

		<title> 欢迎进入EasyAdmin管理系统  </title>
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Use the correct meta names below for your web application
			 Ref: http://davidbcalhoun.com/2010/viewport-metatag 
			 
		<meta name="HandheldFriendly" content="True">
		<meta name="MobileOptimized" content="320">--> 
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">	
		<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
		<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/smartadmin-production.css">
		<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/smartadmin-skins.css">	
		
		<!-- SmartAdmin RTL Support is under construction
			<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/smartadmin-rtl.css"> -->

		<!-- FAVICONS -->
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="<%=request.getContextPath()%>/assets/img/favicon/favicon.ico" type="image/x-icon">
		
		<style>
			.login-tips-wrapper {
				position: fixed;
				top:10px;
				left:0;
				right:0;
				text-align: center;
			}
			.login-alert {
				padding-left:20px;
				display: inline-block;
				min-width: 400px;
				text-align: left;
			}
			#loginErrorTips {
				margin-right: 20px;
			}
			.login-alert .fa {
				margin-right: 5px;
			}
		</style>
	</head>
	<body id="login" class="animated fadeInDown">
		<!-- possible classes: minified, no-right-panel, fixed-ribbon, fixed-header, fixed-width-->
		<header id="header">
			<!--<span id="logo"></span>-->

			<div id="logo-group">
				<span id="logo"> <img src="<%=request.getContextPath()%>/assets/img/logo.png" alt="EasyAdmin"> </span>

				<!-- END AJAX-DROPDOWN -->
			</div>

		</header>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->
			<div id="content" class="container">

				<div class="row">
					<div class="well no-padding" style="width: 400px;margin: 0 auto;">
						<form action="index.html" id="login-form" class="smart-form client-form">
							<header>
								登  录
							</header>

							<fieldset>
								
								<section>
									<label class="label">账号</label>
									<label class="input"> <i class="icon-append fa fa-user"></i>
										<input type="text" name="account" id="account">
										<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> 请输入您的用户名</b></label>
								</section>

								<section>
									<label class="label">密码</label>
									<label class="input"> <i class="icon-append fa fa-lock"></i>
										<input type="password" name="password" id="password">
										<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> 请输入您的密码</b> </label>
								</section>

								<section>
									<label class="checkbox">
										<input type="checkbox" name="rememberMe"  id="rememberMe">
										<i></i>记住密码</label>
								</section>
							</fieldset>
							<footer>
								<button type="button" class="btn btn-primary" onclick="javascript:MembershipLogin.login();">
									登 录
								</button>
							</footer>
						</form>

					</div>
				</div>
			</div>

		</div>
		
		<div class="login-tips-wrapper" id="loginMessageTips"></div>
		<!--================================================== -->	

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script src="<%=request.getContextPath()%>/assets/js/plugin/pace/pace.min.js"></script>

	    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script> if (!window.jQuery) { document.write('<script src="<%=request.getContextPath()%>/assets/js/libs/jquery-2.0.2.min.js"><\/script>');} </script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="<%=request.getContextPath()%>/assets/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="<%=request.getContextPath()%>/assets/js/bootstrap/bootstrap.min.js"></script>
		
		<!-- JQUERY VALIDATE -->
		<script src="<%=request.getContextPath()%>/assets/js/plugin/jquery-validate/jquery.validate.min.js"></script>
		
		
		<!--[if IE 7]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->
		 <%@ include file="/WEB-INF/jsp-views/frame/init.jsp"%>
		 
		<script src="<%=request.getContextPath()%>/assets/modules/membership/js/login.js"></script>
		
		<script type="text/javascript">
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
							required : '请输入您的账号',
						},
						password : {
							required : '请输入您的密码'
						}
					},

					// Do not change code below
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent());
					}
				});
				
				MembershipLogin.init();
			});
		</script>

	</body>
</html>