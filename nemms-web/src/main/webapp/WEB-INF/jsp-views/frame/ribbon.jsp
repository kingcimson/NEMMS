<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- RIBBON -->
<div id="ribbon">

	<span class="ribbon-button-alignment"> <span id="refresh" class="btn btn-ribbon" data-title="refresh" rel="tooltip" data-placement="bottom"
		data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true"
		data-reset-msg="Would you like to RESET all your saved widgets and clear LocalStorage?"><i class="fa fa-refresh"></i></span>
	</span>

	<!-- breadcrumb -->
	<ol class="breadcrumb">
		<!-- This is auto generated -->
	</ol>
	<!-- end breadcrumb -->

	<!-- You can also add more buttons to the
				ribbon for further usability

				Example below:

				<span class="ribbon-button-alignment pull-right">
				<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
				<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
				<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
				</span> -->
	<div class="skins" id="smartSkins">
		<span class="skins-setting skins-toggle"> <i class="fa fa-cog fa-lg"></i>
		</span>
		<section class="smart-styles">
			<span class="skin-change-close skins-toggle"><i class="fa fa-times"></i></span>
			<a href="javascript:void(0);" id="smart-style-3" data-skinlogo="<%=request.getContextPath()%>/assets/img/logo-pale.png" class="a-skin btn btn-xs btn-block txt-color-white margin-top-5" style="background: #f78c40">Google
				Skin
			</a> 
			<a href="javascript:void(0);" id="smart-style-0" data-skinlogo="<%=request.getContextPath()%>/assets/img/logo.png"
				class="a-skin btn btn-block btn-xs txt-color-white margin-right-5" style="background-color: #4E463F;">Smart Default</a> 
			<a href="javascript:void(0);" id="smart-style-1" data-skinlogo="<%=request.getContextPath()%>/assets/img/logo-white.png"
				class="a-skin btn btn-block btn-xs txt-color-white" style="background: #3A4558;"> <i class="fa fa-check fa-fw" id="skin-checked"></i> Dark Elegance</a> 
			<a href="javascript:void(0);" id="smart-style-2" data-skinlogo="<%=request.getContextPath()%>/assets/img/logo-blue.png"
				class="a-skin btn btn-xs btn-block txt-color-darken margin-top-5" style="background: #fff;">Ultra Light</a>
		</section>
	</div>
</div>
<!-- END RIBBON -->