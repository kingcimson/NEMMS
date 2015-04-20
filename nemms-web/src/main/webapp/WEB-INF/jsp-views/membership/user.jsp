<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/includes/header.jsp"%>
<style>
#add_user_modal .smart-form fieldset, #edit_user_form fieldset, #revise_password_form fieldset {
	padding-left: 50px;
	padding-right: 50px;
}

.dataTables_wrapper .dataTables_info {
	margin-left: 1em;
}

.select_role {
	height: 218px;
	border: 1px solid silver;
	overflow: auto;
}
</style>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span>
					<h2>用户管理</h2>
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
												<option value="account">账号</option>
												<option value="name">姓名</option>
											</select>
										</div>
										<div class="form-group">
											<label>关键字</label> <input type="text" id="Keyword" name="keyword" class="form-control input-sm" placeholder="用户名">
										</div>
										<div class="form-group">
											<a id="search_user" class="btn btn-primary"> <i class="fa fa-search"></i>搜索
											</a>
										</div>
										<div class="form-group">
											<a class="btn btn-primary" id="add_user"> <i class="fa fa-plus"></i>添加
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
									<th>账号</th>
									<th>姓名</th>
									<th>电话</th>
									<th>邮箱</th>
									<th>状态</th>
									<th>创建时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>账号</th>
									<th>姓名</th>
									<th>电话</th>
									<th>邮箱</th>
									<th>状态</th>
									<th>创建时间</th>
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
<div class="modal" id="edit_user_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 id="edit_modal_title" class="modal-title">编辑</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="edit_user_form" name="edit_user_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">用户账号:</label>
								<div class="col col-10">
									<a id="edit_account" style="line-height: 30px;"></a><input id="edit_uid" type="hidden" name="userId" />
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">真实姓名:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="edit_name" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">电话:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="telephone" id="edit_telephone" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">Email:</label>
								<div class="col col-10">
									<label class="input"> <input type="email" name="email" id="edit_email" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">状态：</label>
								<div class="col col-10">
									<label class="input"> <select name="status" id="edit_status" class="form-control" style="box-sizing: border-box;">
											<option value="1">正常</option>
											<option value="2">暂停</option>
									</select>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">所属角色:</label>
								<div class="col col-10">
									<div id="edit-role-tree" class="select_role"></div>
								</div>
								<input id="edit_roles" name="roles" type="hidden" />
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
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button id="edit_submit" type="button" onclick="" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="revise_password_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">修改密码</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="revise_password_form" name="revise_password_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">用户账号:</label>
								<div class="col col-10">
									<a id="revise_account" style="line-height: 30px;"></a>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">登录新密码:</label>
								<div class="col col-10">
									<label class="input"> <input type="password" name="password" id="revise_password" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">确认新密码:</label>
								<div class="col col-10">
									<label class="input"> <input type="password" name="repassword" id="revise_repassword" required>
									</label>
								</div>
							</div>
						</section>
						<input id="revise_password_id" type="hidden" />
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="save_password" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="add_user_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<a id="modal_title">添加用户</a>
				</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="add_user_form" name="add_user_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">用户账号:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="account" id="account" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">登录密码:</label>
								<div class="col col-10">
									<label class="input"> <input type="password" name="password" id="password" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">确认密码:</label>
								<div class="col col-10">
									<label class="input"> <input type="password" name="repassword" id="repassword">
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">真实姓名:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="name" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">电话:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="telephone" id="telephone" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">Email:</label>
								<div class="col col-10">
									<label class="input"> <input type="email" name="email" id="email" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">状态：</label>
								<div class="col col-10">
									<label class="input"> <select name="status" id="status" class="form-control" style="box-sizing: border-box;">
											<option value="1">正常</option>
											<option value="2">暂停</option>
									</select>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">所属角色:</label>
								<div class="col col-10">
									<div id="module-tree1" class="select_role"></div>
								</div>
								<input id="add_roles" name="roles" type="hidden" />
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">备注:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="comment" id="comment">
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<input id="user_template_action" type="hidden" name="action" /><input id="user_template_id" type="hidden" name="action" />
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="button" id="add_user_submit" class="btn btn-primary">确定</a> <a type="button" class="btn btn-default" id="add_user_cancel"
							data-dismiss="modal">取消</a>
					</footer>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="message_dialog" title="">
	<span id="alert_message"></span>
</div>
<div id="delete_dialog" title="">
	<span id="delete_message"></span> <input id="delete_id" type="hidden" />
</div>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/user.js"></script>
<script type="text/javascript">
	pageSetUp();
	var tree1 ;
	loadScript([
		'<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js'
	], function() {
		var tree = new dhtmlXTreeObject("module-tree1", "100%", "100%", 0);
		tree1 = tree;
		tree.setSkin('dhx_skyblue');
		tree.enableCheckBoxes(1);//设置复选框
		tree.setImagePath("<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/imgs/dhxtree_role/");
		tree.setDataMode("json");
		tree.enableTreeLines(false);
		tree.loadJSON("<%=request.getContextPath()%>/membership/role/list",function(){
			tree.openAllItems(0);
		});
		tree.setOnClickHandler(function onClick(id) {});
		
		var edit_tree = new dhtmlXTreeObject("edit-role-tree", "100%", "100%", 0);
		tree2 = edit_tree;
		edit_tree.deleteChildItems(0);
		edit_tree.setSkin('dhx_skyblue');
		edit_tree.enableCheckBoxes(1);//设置复选框
		edit_tree.setImagePath("<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/imgs/dhxtree_role/");
		edit_tree.setDataMode("json");
		edit_tree.enableTreeLines(false);
		edit_tree.setOnClickHandler(function onClick(id) {
		});
	});
</script>