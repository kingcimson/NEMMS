<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
<title>EasyAdmin</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- Basic Styles -->
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css">

<!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/smartadmin-production.css">
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/smartadmin-skins.css">
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/animate.css">
<!-- SmartAdmin RTL Support is under construction
		<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/smartadmin-rtl.css"> -->
<!-- We recommend you use "your_style.css" to override SmartAdmin specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/your_style.css"> -->
		
<!-- FAVICONS -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon/favicon.ico" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath()%>/assets/img/favicon/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="<%=request.getContextPath()%>/assets/img/splash/sptouch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath()%>/assets/img/splash/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120" href="<%=request.getContextPath()%>/assets/img/splash/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152" href="<%=request.getContextPath()%>/assets/img/splash/touch-icon-ipad-retina.png">

<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<!-- Startup image for web apps -->
<link rel="apple-touch-startup-image" href="<%=request.getContextPath()%>/assets/img/splash/ipad-landscape.png"
	media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
<link rel="apple-touch-startup-image" href="<%=request.getContextPath()%>/assets/img/splash/ipad-portrait.png"
	media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
<link rel="apple-touch-startup-image" href="<%=request.getContextPath()%>/assets/img/splash/iphone.png" media="screen and (max-device-width: 320px)">
<script>
	window.userId = "${user.userId}";
</script>
</head>
<body class="fixed-header fixed-ribbon fixed-navigation smart-style-2">
	<!-- POSSIBLE CLASSES: minified, fixed-ribbon, fixed-header, fixed-width
			 You can also add different skin classes such as "smart-skin-1", "smart-skin-2" etc...-->

	<!-- HEADER -->
	<header id="header">
	<div id="logo-group">

		<!-- PLACE YOUR LOGO HERE -->
		<span id="logo"> <img src="<%=request.getContextPath()%>/assets/img/logo-white.png" alt="EasyAdmin">
		</span>
		<!-- END LOGO PLACEHOLDER -->
	</div>

	<!-- end projects dropdown --> <!-- pulled right: nav area -->
	<div class="pull-right">

		<!-- collapse menu button -->
		<div id="hide-menu" class="btn-header pull-right">
			<span> <a href="javascript:void(0);" title="Collapse Menu"><i class="fa fa-reorder"></i></a>
			</span>
		</div>
		<!-- end collapse menu -->

		<!-- logout button -->
		<div id="logout" class="btn-header transparent pull-right">
			<span> <a href="<%=request.getContextPath()%>/logout" title="退出系统"
				data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i class="fa fa-sign-out"></i></a>
			</span>
		</div>
		<!-- end logout button -->

		<!-- search mobile button (this is hidden till mobile view port) -->
		<div id="search-mobile" class="btn-header transparent pull-right">
			<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a>
			</span>
		</div>
		<!-- end search mobile button -->

		<!-- fullscreen button -->
		<div id="fullscreen" class="btn-header transparent pull-right">
			<span> <a href="javascript:void(0);" onclick="launchFullscreen(document.documentElement);" title="Full Screen"><i
					class="fa fa-fullscreen"></i></a>
			</span>
		</div>
		<!-- end fullscreen button -->
		<div id="wikiSys" class="btn-header transparent pull-right">
			<span> 
				<a href="http://yourswikisite/" title="系统WIKI" target="_blank"><i
					class="fa fa-book"></i>
				</a>
			</span>
		</div>
	</div>
	<!-- end pulled right: nav area --> </header>
	<!-- END HEADER -->