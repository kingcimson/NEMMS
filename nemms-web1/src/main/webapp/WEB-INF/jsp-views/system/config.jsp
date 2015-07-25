<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
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
					<h2>配置管理</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body clearfix">
						<div class="col-md-2">
							<div id="tree" class="module-tree"></div>
						</div>
						<div class="col-md-10">
							<div class="widget-body no-padding">
								<div class="widget-body-toolbar">
									<form class="form-inline" role="form">
										<div class="row">
											<div class="col-sm-12 col-md-10">
												<div class="form-group">
													<a class="btn btn-primary" id="list_root_btn"> <i class="fa fa-list"></i>列出根节点</a> 
													<a class="btn btn-primary" id="add_root_btn"> <i class="fa fa-plus"></i>增加根节点</a> 
													<a class="btn btn-primary" id="add_btn"> <i class="fa fa-plus"></i>增加子节点</a>
												</div>
											</div>
										</div>
									</form>
									<input id="modal_action" type="hidden" name="modal_action" /> 
								</div>
								<table id="dataTable1" class="display" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>ID</th>
											<th>名称</th>
											<th>键</th>
											<th>值</th>
											<th>时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>名称</th>
											<th>键</th>
											<th>值</th>
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
<div class="modal" id="add_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<a id="modal_title">添加配置</a>
				</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="add_form" name="add_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">父节点:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" id="parent"> <input id="pid" type="hidden" name="pid" />
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
								<label class="label col col-2">键(key):</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="key" id="key" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">值(value):</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="value" id="value" required>
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
								<label class="label col col-2"> 说明:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="comment" id="comment">
									</label>
								</div>
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="submit" id="add_submit" class="btn btn-primary">确定</a> <a type="button" class="btn btn-default" id="add_cancel" data-dismiss="modal">取消</a>
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
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<a id="modal_title">编辑操作</a>
				</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="edit_form" name="edit_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">名称:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="edit_name" required> 
									<input id="config_id" type="hidden" name="id" />
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">键(key):</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="key" id="edit_key" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">值(value):</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="value" id="edit_value" required>
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
									<label class="input"> <input type="text" name="comment" id="edit_comment">
									</label>
								</div>
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="button" id="edit_submit" class="btn btn-primary">保存</a> <a type="button" class="btn btn-default" id="edit_cancel" data-dismiss="modal">取消</a>
					</footer>
				</form>
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
				<input id="delete_id" type="hidden" /> <span id="delete_alert_message"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button id="delete_btn" type="button" class="btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/assets/modules/system/js/config.js"></script>
<script type="text/javascript">
	pageSetUp();
	loadScript([
		'<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js'
	], function() {
		tree = new dhtmlXTreeObject("tree", "100%", "100%", 0);
		tree.setSkin('dhx_skyblue');
		tree.setImagePath("<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/imgs/dhxtree_skyblue/");
		tree.setXMLAutoLoading("<%=request.getContextPath()%>/system/config/listChildren");
		tree.setDataMode("json");
		tree.loadJSON("<%=request.getContextPath()%>/system/config/listChildren");
		tree.setOnClickHandler(function onClick(id) {
			DictConfig.load(id);
		});
	});
</script>