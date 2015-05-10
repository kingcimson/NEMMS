<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/frame/init.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/datatables_scripts.jsp"%>
<style>
#add_modal .smart-form fieldset, #edit_form fieldset, #revise_password_form fieldset {
	padding-left: 50px;
	padding-right: 50px;
}

.dataTables_wrapper .dataTables_info {
	margin-left: 1em;
}
</style>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false"
				data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span>
					<h2>设备参数</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body no-padding">
						<div class="widget-body-toolbar">
							<form class="form-inline" role="form">
								<div class="row">
									<div class="col-sm-12 col-md-10">
										<div class="form-group">类别：
											<select id="categoryId" name=categoryId class="form-control input-sm"></select>
										</div>
										<div class="form-group">
											<select id="fieldName" name="fieldName" class="form-control input-sm">
												<option value="name">名称</option>
												<option value="id">ID</option>
												<option value="mode">模式</option>
												<option value="value_type">值类型</option>
											</select>
										</div>
										<div class="form-group">
											<label>关键字</label> <input type="text" id="keyword" name="keyword" class="form-control input-sm"
												placeholder="名称">
										</div>
										<div class="form-group">
											<a href="javascript:void(0);" id="search" class="btn btn-primary"> <i class="fa fa-search"></i>搜索
											</a>
										</div>
										<div class="form-group">
											<a href="javascript:void(0);" id="add_btn" class="btn btn-primary"> <i class="fa fa-plus"></i>添加
											</a>
										</div>
									</div>
								</div>
							</form>
							<input id="modal_action" type="hidden" name="action" value="" />
						</div>
						<table id="datatable1" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>ID</th>
									<th>名称</th>
									<th>类别</th>
									<th>模式</th>
									<th>单位</th>
									<th>系数</th>
									<th>值类型</th>
									<th>值长度</th>
									<th>值最小长度</th>
									<th>值最大长度</th>
									<th>最小值</th>
									<th>最大值</th>
									<th>权限归属</th>
									<th>告警级别</th>
									<th>操作</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>名称</th>
									<th>类别</th>
									<th>模式</th>
									<th>单位</th>
									<th>系数</th>
									<th>值类型</th>
									<th>值长度</th>
									<th>值最小长度</th>
									<th>值最大长度</th>
									<th>最小值</th>
									<th>最大值</th>
									<th>权限归属</th>
									<th>告警级别</th>
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
<div class="modal" id="add_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<a id="modal_title">添加</a>
				</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="add_form" name="add_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">Posid:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="posid" id="posid" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">名称:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="name" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">排序:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="seq" id="seq" required>
									</label>
								</div>
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="button" id="add_submit" class="btn btn-primary">确定</a> <a type="button" class="btn btn-default"
							data-dismiss="modal">取消</a>
					</footer>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="edit_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 id="edit_modal_title" class="modal-title">编辑</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="edit_form" name="edit_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">名称:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="edit_name" required> <input
										name="posid" type="hidden">
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">排序:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="seq" id="edit_seq" required>
									</label>
								</div>
							</div>
						</section>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button id="edit_submit" type="button" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>
<div id="delete_dialog" title="">
	<span id="delete_message"></span> <input id="delete_id" type="hidden" />
</div>
<script src="<%=request.getContextPath()%>/assets/modules/device/js/params.js"></script>
<script type="text/javascript">
	pageSetUp();
</script>