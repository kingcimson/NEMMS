<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<style>
td.details-control {
	background: url('<%=request.getContextPath()%>/assets/modules/membership/icons/details_open.png') no-repeat center center;
	cursor: pointer;
}

tr.details td.details-control {
	background: url('<%=request.getContextPath()%>/assets/modules/membership/icons/details_close.png') no-repeat center center;
}
</style>
<section id="widget-grid" class=""> 
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span>
					<h2>日志管理</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body no-padding">
						<div class="widget-body-toolbar">
							<form class="form-inline" role="form">
								<div class="row">
									<div class="col-sm-12 col-md-10">
										<div class="form-group">
											<select id="fieldName" name="fieldName" class="form-control input-sm">
												<option value="account">操作用户</option>
												<option value="level">日志级别</option>
												<option value="message">日志内容</option>
											</select>
										</div>
										<div class="form-group">
											<label>关键字</label> <input type="text" id="Keyword" name="keyword" class="form-control input-sm" placeholder="用户名">
										</div>
										<div class="form-group">
											<a href="javascript:MembershipEvent.findEventsByKeyword();" id="searchApp" class="btn btn-primary"> <i class="fa fa-search"></i>搜索
											</a>
										</div>
										<div class="form-group">
											<a href="javascript:MembershipEvent.clear();" id="clear" class="btn btn-primary"> <i class="fa fa-search"></i>清空数据
											</a>
										</div>
									</div>
								</div>
							</form>
						</div>
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th></th>
									<th>ID</th>
									<th>来源</th>
									<th>操作用户</th>
									<th>级别</th>
									<th>发生时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th>ID</th>
									<th>来源</th>
									<th>操作用户</th>
									<th>级别</th>
									<th>发生时间</th>
									<th>操作</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
<div id="message_dialog" title="">
	<span id="alert_message"></span>
</div>
<div id="delete_dialog" title="">
	<span id="delete_message"></span> <input id="delete_id" type="hidden" />
</div>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/event.js"></script>
<script type="text/javascript">
	pageSetUp();
</script>