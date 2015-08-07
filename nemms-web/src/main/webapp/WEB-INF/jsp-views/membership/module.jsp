<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/includes/init.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.css">
<style>
.module-tree {
	height: 600px;
	border: 1px solid silver;
	overflow: auto;
}

.form-actions-customsize {
	display: block;
	padding: 13px 14px 15px;
	border-top: 1px solid rgba(0, 0, 0, .1);
	margin-left: -13px;
	margin-right: -13px;
	margin-bottom: -13px;
	text-align: right;
}
</style>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-lg-12">
			<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-5" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<h2>系统模块设置</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body clearfix">
						<div class="col-md-2">
							<div id="module-tree" class="module-tree"></div>
						</div>
						<div class="col-md-10">
							<div class="detail-right form-horizontal">
								<div class="form-horizontal">
									<form id="edit_module_form">
										<fieldset>
											<legend>新建系统模块</legend>
											<div class="form-group">
												<label class="col-md-2 control-label">模块代号</label>
												<div class="col-md-10">
													<input class="form-control" id="code" name="code" type="text">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">模块名称</label>
												<div class="col-md-10">
													<input class="form-control" type="text" id="name" name="name">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">Url</label>
												<div class="col-md-10">
													<input class="form-control" type="text" id="url" name="url" value="#">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">图标</label>
												<div class="col-md-10">
													<input class="form-control" type="text" id="icon" name="icon">
													<div class="form-tips"></div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">状态</label>
												<div class="col-md-10">
													<select id="status" name="status" class="form-control">
														<option value="1" selected="selected">启用</option>
														<option value="0">禁用</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">是否外链</label>
												<div class="col-md-10">
													<select id="linkType" name="linkType" class="form-control">
														<option value="0" selected="selected">否</option>
														<option value="1">是</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">URL Target</label>
												<div class="col-md-10">
													<select id="target" name="target" class="form-control">
														<option value="" selected="selected"></option>
														<option value="_blank">_blank</option>
														<option value="_self">_self</option>
														<option value="_parent">_parent</option>
														<option value="_top">_top</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">URL参数</label>
												<div class="col-md-10">
													<input class="form-control" type="text" id="params" name="params">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">排序</label>
												<div class="col-md-10">
													<input class="form-control" type="text" id="sequence" name="sequence">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">描述&nbsp;</label>
												<div class="col-md-10">
													<input class="form-control" type="text" id="comment" name="comment">
												</div>
											</div>
											<input name="parentId" id="parentId" type="hidden">
											<input name="moduleId" id="moduleId" type="hidden">
											<input name="path" type="hidden" value="0">
										</fieldset>
									</form>
									<div class="form-actions-customsize">
										<div class="row">
											<div class="col-md-12">
												<button class="btn btn-primary" type="submit" onclick="javascript:MembershipModule.editModule();">
													<i class="fa fa-save"></i> 编辑当前模块
												</button>
												<button class="btn btn-primary" type="submit" onclick="javascript:MembershipModule.createRootModule();">
													<i class="fa fa-save"></i> 创建主模块
												</button>
												<button class="btn btn-primary" type="submit" onclick="javascript:MembershipModule.createModule();">
													<i class="fa fa-save"></i> 创建子模块
												</button>
												<button class="btn btn-primary" type="submit" onclick="javascript:MembershipModule.deleteModuleModal();">
													<i class="fa fa-trash-o"></i> 删除
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
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
				<button id="module_delete_btn" type="button" onclick="" class="btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/module.js"></script>
<script type="text/javascript">
	pageSetUp();
	loadScript([
		'<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js'
	], function() {
		MembershipModule.validator();
		var tree = new dhtmlXTreeObject("module-tree", "100%", "100%", 0);
		module_tree = tree;
		tree.setSkin('dhx_skyblue');
		tree.setImagePath("<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/imgs/dhxtree_skyblue/");
		tree.setXMLAutoLoading("<%=request.getContextPath()%>/membership/module/list");
		tree.setDataMode("json");
		tree.loadJSON("<%=request.getContextPath()%>/membership/module/list");
		tree.setOnClickHandler(function onClick(id) {
			MembershipModule.load(id);
		});
	});
</script>
