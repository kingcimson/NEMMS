<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ include file="/WEB-INF/jsp-views/frame/init.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/form_scripts.jsp"%>
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

.state1 {
	color: #aaa;
}

.state2 {
	color: #000;
}

.state3 {
	color: red;
}

.state4 {
	color: green;
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
					<h2>系统角色设置</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body clearfix">
						<div class="col-md-2">
							<div id="role-tree" class="module-tree"></div>
						</div>
						<div class="col-md-10">
							<div class="detail-right form-horizontal">
								<div class="form-horizontal">
									<form id="edit_role_form">
										<fieldset>
											<legend>
												<a id="edit_title">新建系统角色</a>
											</legend>
											<input id="rolepid" type="hidden" />
											<div class="form-group">
												<label class="col-md-1 control-label">角色名称</label>
												<div class="col-md-11">
													<input class="form-control" type="text" id="role_name" name="role_name" required>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label">角色代号</label>
												<div class="col-md-11">
													<input class="form-control" type="text" id="role_code" name="role_code" required>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label">系统角色</label>
												<div class="col-md-11">
													<select id="isSystem" name="isSystem" class="form-control">
														<option value="0" selected="selected">否</option>
														<c:if test="${isSuperAdmin}">
															<option value="1">是</option>
														</c:if>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label">状态</label>
												<div class="col-md-11">
													<select id="status" name="status" class="form-control">
														<option value="1" selected="selected">启用</option>
														<option value="0">禁用</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label">排序</label>
												<div class="col-md-11">
													<input class="form-control" type="text" id="role_sequence" name="role_sequence" required>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label">权限</label>
												<div class="col-md-11">
													<label class="checkbox"> <input type="checkbox" id="chkAll" name="chkAll"> <i></i>所有权限
													</label>
													<div style="height: 218px; border: 1px solid silver; overflow: auto; background-color: rgb(245, 245, 245);">
														<div id="module-tree" class="module-tree"></div>
													</div>
													<input id="operations" name="operations" type="hidden" value="" required />
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label">可查看的设备参数属性</label>
												<div class="col-md-11">
													<div class="inline-group checkboxs">
														<label class="checkbox">编号<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="id" checked="checked"><i></i></label>
														<label class="checkbox">名称<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="name" checked="checked"><i></i></label>
														<label class="checkbox">类别<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="category_id" checked="checked"><i></i></label>
														<label class="checkbox">读写属性<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="mode"><i></i></label>
														<label class="checkbox">单位<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="unit"><i></i></label>
														<label class="checkbox">传输比或系数<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="ratio"><i></i></label>
														<label class="checkbox">值数据类型<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="value_type"><i></i></label>
														<label class="checkbox">值数据长度<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="value_len"><i></i></label>
														<label class="checkbox">值数据最小长度<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="value_min_len"><i></i></label>
														<label class="checkbox">值数据最大长度<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="value_max_len"><i></i></label>
														<label class="checkbox">参数最小值<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="min_value"><i></i></label>
														<label class="checkbox">参数最大值<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="max_value"><i></i></label>
														<label class="checkbox">告警级别<input class="checkbox-item" type="checkbox" name="deviceParamProps" value="warn_level"><i></i></label>
														<label class="checkbox">全选 <input type="checkbox" name="checkAllDeviceParamProps" id="checkAllDeviceParamProps"><i></i></label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label">描述&nbsp;</label>
												<div class="col-md-11">
													<input class="form-control" type="text" id="role_comment" name="role_comment" required>
												</div>
											</div>
										</fieldset>
										<div class="form-actions-customsize">
											<div class="row">
												<div class="col-md-12">
													<button class="btn btn-primary" type="button" onclick="javascript:MembershipRole.editRoles();">
														<i class="fa fa-save"></i> 编辑
													</button>
													<button id="role_creat_parent_btn" class="btn btn-primary" type="button" onclick="javascript:MembershipRole.createRoles();">
														<i class="fa fa-save"></i> 创建
													</button>
													<button class="btn btn-primary" type="button" onclick="javascript:MembershipRole.deleteRolesModal();">
														<i class="fa fa-trash-o"></i> 删除
													</button>
												</div>
											</div>
										</div>
									</form>
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
				<button id="role_delete_btn" type="button" onclick="" class="btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/assets/modules/membership/js/role.js"></script>
<script type="text/javascript">
	pageSetUp();
	loadScript(['<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js'], function() {
		MembershipRole.validator();
		
		dhtmlXTreeObject.prototype.getAllCheckedChildless = function () {
		    var temp = this._getAllCheckedChildless("", "", 1);
		    if (temp != "") temp += this.dlmtr;
		    return temp;
		};

		dhtmlXTreeObject.prototype._getAllCheckedChildless = function (htmlNode, list, mode) {
		    if (!htmlNode) htmlNode = this.htmlNode;
		    if (htmlNode.checkstate == mode)
		        if (!htmlNode.nocheckbox && htmlNode.childsCount == 0) { if (list) list += this.dlmtr + htmlNode.id; else list = htmlNode.id; }
		    var j = htmlNode.childsCount;
		    for (var i = 0; i < j; i++) {
		        list = this._getAllCheckedChildless(htmlNode.childNodes[i], list, mode);
		    };
		    if (list) return list; else return "";
		};
		
		roleTree = new dhtmlXTreeObject("role-tree", "100%", "100%", 0);
		roleTree.setSkin('dhx_skyblue');
		roleTree.setImagePath("<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/imgs/dhxtree_role/");
		roleTree.setDataMode("json");
		roleTree.enableTreeLines(false);
		roleTree.loadJSON("<%=request.getContextPath()%>/membership/role/list",function(){
			roleTree.openAllItems(0);
		});
		roleTree.setOnClickHandler(function onClick(id) {
			MembershipRole.load(id);
		});
		
		moduleTree = new dhtmlXTreeObject("module-tree", "100%", "100%", 0);
		moduleTree.setSkin('dhx_skyblue');
		moduleTree.setImagePath("<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/imgs/dhxtree_skyblue/");
		moduleTree.enableCheckBoxes(1);
		moduleTree.enableThreeStateCheckboxes(1);
		moduleTree.setDataMode("json");
		moduleTree.loadJSON("<%=request.getContextPath()%>/membership/role/getoperations");
	});
</script>
