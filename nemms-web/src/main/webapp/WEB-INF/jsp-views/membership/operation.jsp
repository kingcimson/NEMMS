<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/frame/init.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/datatables_scripts.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.css">
<style>
.edit-label {
	float: left;
}

.edit-enter {
	overflow: hidden;
	zoom: 1;
	width: 180px;
}

.form-tips {
	margin-top: 5px;
	color: #777;
}

.module-tree {
	height: 600px;
	border: 1px solid silver;
	overflow: auto;
}

.require-star {
	color: #c00;
}

#add_operation_form fieldset {
	padding-left: 50px;
	padding-right: 50px;
}
</style>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-lg-12">
			<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-5" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<h2>系统操作设置</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body clearfix">
						<div class="col-md-2">
							<div id="module-tree" class="module-tree"></div>
						</div>
						<div class="col-md-10">
							<div class="widget-body no-padding">
								<div class="widget-body-toolbar">
									<form class="form-inline" role="form">
										<div class="row">
											<div class="col-sm-12 col-md-10">
												<div class="form-group">
													<a class="btn btn-primary" id="add_btn" onclick="javascript:MembershipOperation.addOperationModal();"> <i class="fa fa-plus"></i>添加操作
													</a>
												</div>
											</div>
										</div>
									</form>
								</div>
								<table id="example" class="display" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>ID</th>
											<th>代号</th>
											<th>名称</th>
											<th>说明</th>
											<th>时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>代码</th>
											<th>名称</th>
											<th>说明</th>
											<th>时间</th>
											<th>操作</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
<div class="modal" id="add_operation_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<a id="modal_title">添加操作</a>
				</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="add_operation_form" name="add_operation_form" method="post" action="javacript:MembershipOperation.addOperation();" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">所属模块:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="moduleId" id="moduleId" class="required">
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">操作代号:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="code" id="code" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">操作名称:</label>
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
									<label class="input"> <input type="text" name="sequence" id="sequence" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">备注:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="comment" id="comment" required>
									</label>
								</div>
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="submit" id="add_operation_submit" class="btn btn-primary" onclick="javacript:MembershipOperation.addOperation();">确定</a> <a
							type="button" class="btn btn-default" id="add_user_cancel" data-dismiss="modal">取消</a>
					</footer>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="edit_operation_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<a id="modal_title">编辑操作</a>
				</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="edit_operation_form" name="edit_operation_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">操作代码:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="code" id="edit_code" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">操作名称:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="edit_name" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">排序:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="sequence" id="edit_sequence" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">备注:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="comment" id="edit_comment" required>
									</label>
								</div>
							</div>
						</section>
						<input id="operationId" name ="operationId" type="hidden">
					</fieldset>
					<footer>
						<a type="button" id="edit_operation_submit" onclick="javacript:MembershipOperation.editOperation();" class="btn btn-primary">保存</a> <a
							type="button" class="btn btn-default" id="edit_user_cancel" data-dismiss="modal">取消</a>
					</footer>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="alert_message_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">提示</h4>
			</div>
			<div class="modal-body">
				<span id="alert_message"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="delete_message_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">提示</h4>
			</div>
			<div class="modal-body">
				<span id="delete_alert_message"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button id="config_delete_btn" type="button" onclick="" class="btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/operation.js"></script>
<script type="text/javascript">
	pageSetUp();
	loadScript([
		'<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js'
	], function() {
		MembershipOperation.validator();
		
		tree = new dhtmlXTreeObject("module-tree", "100%", "100%", 0);
		tree.setSkin('dhx_skyblue');
		tree.setImagePath("<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/imgs/dhxtree_skyblue/");
		tree.setXMLAutoLoading("<%=request.getContextPath()%>/membership/module/list");
		tree.setDataMode("json");
		tree.loadJSON("<%=request.getContextPath()%>/membership/module/list");
		tree.setOnClickHandler(function onClick(id) {
			MembershipOperation.load(id);
		});
	});
</script>