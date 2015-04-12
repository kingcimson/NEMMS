<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="<%=request.getContextPath()%>/assets/js/plugin/pace/pace.min.js"></script>-->

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script src="<%=request.getContextPath()%>/assets/js/libs/jquery-2.0.2.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/libs/jquery-ui-1.10.3.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/libs/template.js"></script>
		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events
		<script src="<%=request.getContextPath()%>/assets/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->
		<!-- BOOTSTRAP JS -->
		<script src="<%=request.getContextPath()%>/assets/js/bootstrap/bootstrap.min.js"></script>
		<!-- JARVIS WIDGETS -->
		<script src="<%=request.getContextPath()%>/assets/js/smartwidgets/jarvis.widget.js"></script>
		<!-- CUSTOM NOTIFICATION -->
		<script src="<%=request.getContextPath()%>/assets/js/notification/SmartNotification.min.js"></script>
		<!--[if IE 7]>
		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
		<![endif]-->
		<!-- MAIN APP JS FILE -->
		<script src="<%=request.getContextPath()%>/assets/js/app.js"></script>