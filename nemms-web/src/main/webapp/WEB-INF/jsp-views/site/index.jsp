<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/frame/init.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/datatables_scripts.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/skins/terrace/dhtmlxtree.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/codemirror/codemirror.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/codemirror/theme/rubyblue.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/codemirror/addon/hint/show-hint.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/select2/select2.css">
<script src="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/codemirror/codemirror.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/codemirror/mode/sql/sql.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/codemirror/addon/display/fullscreen.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/codemirror/addon/hint/show-hint.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/codemirror/addon/hint/sql-hint.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/select2/select2.js"></script>
<style>
.text-align-r {
	text-align: right;
	color: #333;
	padding-right: 10px;
}

.text-align-w {
	text-align: right;
	color: #333;
	padding-right: 10px;
	width: 60px;
}

.report-config-table {
	width: 98%;
	height: 100%;
	padding-top: 5px;
	table-layout: fixed;
	word-break: break-all;
}

.report-config-table td {
	padding-bottom: 10px;
}

.report-tree {
	height: 750px;
	border: 1px solid silver;
	overflow: auto;
}

.report-tree-btn {
	width: 100%;
	margin-bottom: 2px;
}

.actions-btn-wrap {
	text-align: center;
}

.actions-btn-wrap .btn {
	margin: 0 5px;
}

.tab-pane {
	display: none;
}

.tab-pane.active {
	display: block;
}

.CodeMirror {
	height: 221px;
}

tr.selected:before {
	content: '';
	display: none;
}

.CodeMirror-fullscreen {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	height: auto;
	z-index: 2000;
}
</style>
<div class="row">
	<div class="col-lg-2" style="padding-right: 5px;">
		<div class="report-tree-btn">
			<a href="javascript:void(0);" class="btn btn-primary" id="btnTreeSearch"><i class="fa fa-search"></i>查找</a> <a href="javascript:void(0);"
				class="btn btn-primary" id="btnTreeAdd"><i class="fa fa-plus-circle"></i>添加</a> <a href="javascript:void(0);" class="btn btn-primary"
				id="btnTreeRefresh"><i class="fa fa-refresh"></i>刷新</a>
		</div>
		<div id="report-tree" class="report-tree"> </div>
		<input type="hidden" id="copyNodeId" name="copyNodeId" value="0" />
	</div>
	<article class="col-lg-10" style="padding-left: 5px;">
		<div id="tabs">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#configTab" role="tab" target="b" data-toggle="tab">报表配置</a></li>
				<li role="presentation"><a href="#queryParamTab" role="tab" target="b" data-toggle="tab">查询参数</a></li>
			</ul>
			<div class="tab-content">
				<section id="widget-grid">
					<div role="tabpanel" class="tab-pane active" id="configTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-0" style="margin: 0 0 5px;" data-widget-editbutton="false"
							data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix">
									<div class="col-md-12">
										<form id="reportConfigForm" action="">
											<table style="width: 100%; height: 100%;" class="report-config-table">
												<tbody>
													<tr class="smart-form">
														<td class="text-align-w"><span>报表名称:</span></td>
														<td><label class="input"> <input type="text" id="reportName" name="name" required></label></td>
														<td class="text-align-r"><span> 数据源:</span></td>
														<td><select id="reportDsId" name="dsId" style="width: 100%"></select></td>
														<td class="text-align-r"><span>布局形式:</span></td>
														<td><label class="select"> <select class="input-sm" id="reportLayout" name="layout">
																	<option value="1">横向展示</option>
																	<option value="2">纵向展示</option>
															</select> <i></i>
														</label></td>
														<td class="text-align-r"><span></span></td>
														<td><label class="input"> <input type="hidden" id="reportId" name="id" value="0" /> <input type="hidden" id="reportAction"
																name="action" value="add" /> <input type="hidden" id="reportUid" name="uid" /> <input type="hidden" id="reportPid" name="pid"
																value="0" /> <input type="hidden" id="reportIsChange" name="isChange" value="0" /></label></td>
													</tr>
													<tr class="smart-form">
														<td class="text-align-r"><span>统计列:</span></td>
														<td><label class="select"> <select class="input-sm" id="reportStatColumnLayout" name="statColumnLayout">
																	<option value="1">横向展示</option>
																	<option value="2">纵向展示</option>
															</select> <i></i>
														</label></td>
														<td class="text-align-r"><span>显示几天数据:</span></td>
														<td><label class="input"> <input type="text" id="reportDataRange" name="dataRange" value="7" required /></label></td>
														<td class="text-align-r"><span>状态:</span></td>
														<td><label class="select"> <select class="input-sm" id="reportStatus" name="status">
																	<option value="0">编辑</option>
																	<option value="1">锁定</option>
																	<option value="2">隐藏</option>
															</select> <i></i>
														</label></td>
														<td class="text-align-r"><span>显示顺序:</span></td>
														<td><label class="input"> <input type="text" id="reportSequence" name="sequence" value="100" required></label></td>
													</tr>
													<tr>
														<td class="text-align-r" style="vertical-align: top;"><span>报表SQL:</span></td>
														<td colspan="7">
															<div class="code-pretty">
																<textarea id="reportSqlText" name="sqlText"></textarea>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</form>
										<div class="actions-btn-wrap">
											<a class="btn btn-default" href="javascript:void(0);" id="btnExecSql"> <i class="fa fa-check"></i> 执行SQL
											</a> <a class="btn btn-default" href="javascript:void(0);" id="btnViewSqlText"> <i class="fa fa-eye"></i>预览SQL
											</a> <a class="btn btn-default" href="javascript:void(0);" id="btnViewHistorySqlText"> <i class="fa fa-archive"></i>查看SQL历史记录
											</a> <a class="btn btn-default" id="btnNewReport"><i class="fa fa-plus-circle"></i> 新增</a> <a class="btn btn-default"
												href="javascript:void(0);" id="btnEditReport"><i class="fa fa-pencil"></i> 修改</a> <a class="btn btn-default" href="javascript:void(0);"
												id="btnViewReport"><i class="fa fa-table"></i>查看报表</a> <a class="btn btn-default" href="javascript:void(0);" id="btnFullScreenEditSql"><i
												class="fa fa-fullscreen"></i>全屏编辑</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false">
							<header>
								<div class="jarviswidget-ctrls" role="menu">
									<a href="javascript:void(0);" id="btnSqlColumnDtAddRow" class="button-icon" rel="tooltip" title="增加一行" data-placement="bottom"
										data-original-title="增加"><i class="fa fa-plus-circle"></i></a> <a href="javascript:void(0);" class="button-icon" id="btnSqlColumnDtUp"
										rel="tooltip" title="上移一行" data-placement="bottom" data-original-title="上移"><i class="fa fa-arrow-circle-up"></i></a> <a
										href="javascript:void(0);" class="button-icon" id="btnSqlColumnDtDown" rel="tooltip" title="下移一行" data-placement="bottom"
										data-original-title="下移"><i class="fa fa-arrow-circle-down"></i></a> <a href="javascript:void(0);" class="button-icon"
										id="btnSqlColumnDtRemoveRow" rel="tooltip" title="删除选中行" data-placement="bottom" data-original-title="删除"><i class="fa fa-minus-circle"></i></a>
								</div>
								<h2>SQL列配置</h2>
							</header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body no-padding">
									<table id="sqlColumnDt" class="display" cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>行号</th>
												<th>列名</th>
												<th>标题</th>
												<th>类型</th>
												<th>数据类型</th>
												<th>宽度</th>
												<th>精度</th>
												<th>排序类型</th>
												<th>配置</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="queryParamTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-2" style="margin: 0 0 5px;" data-widget-editbutton="false"
							data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix">
									<div class="col-md-12">
										<div id="reportQueryParam" title="查询参数" style="padding: 5px;">
											<form id="reportQueryParamForm" method="post">
												<table style="width: 100%; height: 100%;" class="report-config-table">
													<tr class="smart-form">
														<td class="text-align-w">参数名称:</td>
														<td><label class="input"><input id="queryParamName" name="name" type="text" required /></label></td>
														<td class="text-align-r">参数标题:</td>
														<td><label class="input"><input type="text" id="queryParamText" name="text" required /></label></td>
														<td class="text-align-r">默认值:</td>
														<td><label class="input"><input type="text" id="queryParamDefaultValue" name="defaultValue" /></label></td>
														<td class="text-align-r">默认标题:</td>
														<td><label class="input"><input type="text" id="queryParamDefaultText" name="defaultText" /></label></td>
													</tr>
													<tr class="smart-form">
														<td class="text-align-w">数据类型:</td>
														<td><label class="select"><select id="queryParamDataType" name="dataType">
																	<option value="string" selected="selected">字符串</option>
																	<option value="number">数字（包括整数、浮点数)</option>
																	<option value="digits">正整数</option>
																	<option value="date">日期</option>
																	<option value="url">URL</option>
																	<option value="email">电子邮箱</option>
															</select></label></td>
														<td class="text-align-r">数据长度:</td>
														<td><label class="input"><input type="text" id="queryParamWidth" name="width" value="100" required /></label></td>
														<td class="text-align-r">是否必选:</td>
														<td><label class="checkbox" style="margin: 0px;"><input type="checkbox" id="queryParamIsRequired" name="required"
																class="checkbox-item" /><i></i></label></td>
														<td class="text-align-r">是否自动提示:</td>
														<td><label class="checkbox" style="margin: 0px;"><input type="checkbox" id="queryParamIsAutoComplete" name="autoComplete"
																class="checkbox-item" /><i></i></label></td>
													</tr>
													<tr class="smart-form">
														<td class="text-align-r">表单控件:</td>
														<td><label class="select"><select id="queryParamFormElement" name="formElement">
																	<option value="select">下拉单选</option>
																	<option value="selectMul">下拉多选</option>
																	<option value="checkbox">复选框</option>
																	<option value="text">文本框</option>
															</select></label></td>
														<td class="text-align-r">内容来源类型:</td>
														<td><label class="select"><select id="queryParamDataSource" name="dataSource">
																	<option value="sql">SQL语句</option>
																	<option value="text">文本字符串</option>
																	<option value="none">无内容</option>
															</select></label></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td class="text-align-r">参数内容:</td>
														<td colspan="7"><textarea id="queryParamContent" name="content" style="width: 100%; height: 140px;"></textarea> <input
															id="queryParamGridIndex" type="hidden" value="" /> <input type="hidden" id="jsonQueryParams" /><input id="queryParamReportId"
															type="hidden" value="0" /></td>
													</tr>
													<tr>
														<td colspan="8" style="text-align: center;"><a class="btn btn-default" id="btnAddQueryPara" type="button"><i
																class="fa fa-plus-circle"></i>增加</a> &nbsp;&nbsp;<a class="btn btn-default" id="btnEditQueryPara" type="button"><i
																class="fa fa-pencil"></i>修改</a>&nbsp;&nbsp;<a class="btn btn-default" id="btnSaveQueryParam" type="button"><i class="fa fa-save"></i>保存</a></td>
													</tr>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-3" data-widget-editbutton="false" data-widget-deletebutton="false">
							<header>
								<div class="jarviswidget-ctrls" role="menu">
									<a class="button-icon" id="btnQueryParamDtUp" rel="tooltip" title="上移一行" data-placement="bottom" data-original-title="上移"><i
										class="fa fa-arrow-circle-up"></i></a> <a class="button-icon" id="btnQueryParamDtDown" rel="tooltip" title="下移一行" data-placement="bottom"
										data-original-title="下移"><i class="fa fa-arrow-circle-down"></i></a>
								</div>
								<h2>查询参数列表</h2>
							</header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body no-padding">
									<table id="queryParamDt" class="display" cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>行号</th>
												<th>参数名称</th>
												<th>参数标题</th>
												<th>默认值</th>
												<th>默认标题</th>
												<th>表单控件</th>
												<th>来源类型</th>
												<th>数据类型</th>
												<th>数据长度</th>
												<th>是否必选</th>
												<th>是否自动提示</th>
												<th>操作</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</article>
</div>
<!-- 新增报表树节点弹框  -->
<div class="modal" id="addTreeNodeDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modal_title">新增节点</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="addTreeNodeForm" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">父节点:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="parentName" id="addTreeNodeParentName" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">节点名称:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="addTreeNodeName" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">显示顺序:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="sequence" id="addTreeNodeStatus" required> <input id="hiddenFormId"
										type="hidden" />
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">备注:</label>
								<div class="col col-10">
									<label class="input"><textarea name="comment" id="addTreeNodeComment" style="width: 99%; height: 100px;" required></textarea> </label>
								</div>
							</div>
						</section>
						<input type="hidden" id="treeNodeId" name="id" value="0" /> <input type="hidden" id="treeNodePid" name="pid" value="0" />
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				<button class="btn btn-primary" id="btnSaveAddTreeNode" type="button" onClick="javascript:ReportDesigner.tree.saveTreeNode('add')">保存</button>
			</div>
		</div>
	</div>
</div>
<!-- 编辑报表树节点弹框  -->
<div class="modal" id="editTreeNodeDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modal_title">修改节点</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="editTreeNodeForm" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">状态：</label>
								<div class="col col-10">
									<label class="input"> <select name="flag" id="editTreeNodeFlag" class="form-control" style="box-sizing: border-box;">
											<option value="0">树节点</option>
											<option value="1">报表节点</option>
									</select>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">节点名称:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="name" id="editTreeNodeName" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">显示顺序:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="sequence" id="editTreeNodeSequence" required> <input id="hiddenFormId"
										type="hidden" />
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">有无子节点：</label>
								<div class="col col-10">
									<label class="input"> <select name="hasChild" id="editTreeNodeHasChild" class="form-control" style="box-sizing: border-box;">
											<option value="0">无</option>
											<option value="1">有</option>
									</select>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">状态：</label>
								<div class="col col-10">
									<label class="input"> <select name="status" id="editTreeNodeStatus" class="form-control" style="box-sizing: border-box;">
											<option value="0">编辑</option>
											<option value="1">锁定</option>
											<option value="2">隐藏</option>
									</select>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">备注:</label>
								<div class="col col-10">
									<label class="input"><textarea name="comment" id="editTreeNodeComment" style="width: 99%; height: 100px;" required></textarea> </label>
								</div>
							</div>
						</section>
						<input type="hidden" id="editTreeNodeId" name="id" value="0" /> <input type="hidden" id="editTreeNodePid" name="pid" value="0" />
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				<button class="btn btn-primary" id="btnSaveEditTreeNode" type="button" onClick="javascript:ReportDesigner.tree.saveTreeNode('edit')">保存</button>
			</div>
		</div>
	</div>
</div>
<!-- 查看报表属性弹框  -->
<div class="modal" id="propertiesDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 60%; height: 60%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">报表属性</h4>
			</div>
			<div class="modal-body">
				<table class="report-config-table">
					<tbody>
						<tr class="smart-form">
							<td class="text-align-r" width="100">名称:</td>
							<td><label id="reportProp_name"></label></td>
							<td class="text-align-r" width="80">ID:</td>
							<td><label id="reportProp_id"></label></td>
							<td class="text-align-r" width="100">父ID:</td>
							<td><label id="reportProp_pid"></label></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">代号:</td>
							<td><label id="reportProp_uid"></label></td>
							<td class="text-align-r">布局形式:</td>
							<td><label id="reportProp_layout"></label></td>
							<td class="text-align-r">显示几天数据:</td>
							<td><label id="reportProp_dataRange"></label></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">树路径:</td>
							<td><label id="reportProp_path"></label></td>
							<td class="text-align-r">节点类型:</td>
							<td><label id="reportProp_flag"></label></td>
							<td class="text-align-r">是否有子节点:</td>
							<td><label id="reportProp_hasChild"></label></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">创建用户:</td>
							<td><label id="reportProp_createUser"></label></td>
							<td class="text-align-r">创建时间:</td>
							<td><label id="reportProp_createTime"></label></td>
							<td class="text-align-r">更新时间:</td>
							<td><label id="reportProp_updateTime"></label></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">状态:</td>
							<td><label id="reportProp_status"></label></td>
							<td class="text-align-r">显示顺序:</td>
							<td><label id="reportProp_sequence"></label></td>
							<td class="text-align-r"></td>
							<td></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">报表SQL:</td>
							<td colspan="5" class="code"><label id="reportProp_sqlText"></label></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">报表SQL列配置:</td>
							<td colspan="5" class="code"><label id="reportProp_metaColumns"></label></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">报表查询参数:</td>
							<td colspan="5" class="code"><label id="reportProp_queryParams" style=""></label></td>
						</tr>
						<tr class="smart-form">
							<td class="text-align-r">说明:</td>
							<td colspan="5"><label id="reportProp_comment"></label></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 查看报表SQL弹框  -->
<div class="modal" id="viewSqlTextDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 60%; height: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">查看SQL</h4>
			</div>
			<div class="modal-body">
				<div>
					<textarea id="viewSqlText" name="sqlText" style="width: 99%; height: 500px;"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 查看报表SQL历史记录弹框  -->
<div class="modal" id="viewHistorySqlTextDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 60%; height: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">查看SQL历史记录</h4>
			</div>
			<div class="modal-body clearfix">
				<div class="col-md-4">
					<div class="widget-body no-padding">
						<table id="viewHistorySqlDt" class="display" cellspacing="0" width="95%">
							<thead>
								<tr>
									<th>时间</th>
									<th>创建者</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="col-md-8">
					<textarea id="viewHistorySqlText" name="sqlText" style="width: 95%; height: 500px;"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" id="btnViewHistorySqlTextDlgCl">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 设置计算列表达式弹框  -->
<div class="modal" id="expressionDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 50%; height: 50%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">设置表达式列</h4>
			</div>
			<div class="modal-body">
				<div>
					<textarea id="columnExpression" name="expression" style="width: 99%; height: 100px;"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				<button class="btn btn-primary" id="btnSaveExpr" type="button">确定</button>
			</div>
		</div>
	</div>
</div>
<!-- 设置列备注弹框  -->
<div class="modal" id="memoDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 50%; height: 50%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">设置列备注说明</h4>
			</div>
			<div class="modal-body">
				<div>
					<textarea id="columnMemo" name="memo" style="width: 99%; height: 100px;"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				<button class="btn btn-primary" id="btnSaveMemo" type="button">确定</button>
			</div>
		</div>
	</div>
</div>
<!-- 设置列格式弹框  -->
<div class="modal" id="formatDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 50%; height: 50%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">设置列格式</h4>
			</div>
			<div class="modal-body">
				<div>
					<textarea id="columnFormat" name="format" style="width: 99%; height: 100px;"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				<button class="btn btn-primary" id="btnSaveFormat" type="button">确定</button>
			</div>
		</div>
	</div>
</div>
<!-- 查找报表弹框  -->
<div class="modal" id="searchTreeNodeDlg" tabindex="-1" role="dialog">
	<div class="modal-dialog" style="width: 50%; height: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">查找报表</h4>
			</div>
			<div class="modal-body">
				<div class="widget-body-toolbar">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="form-group">
								<div class="col-md-3">
									<select id="fieldName" name="fieldName" class="form-control input-sm">
										<option value="name">名称</option>
										<option value="uid">代码</option>
										<option value="create_user">创建者</option>
									</select>
								</div>
								<div class="col-md-3">
									<input type="text" id="Keyword" name="keyword" class="form-control input-sm" placeholder="关键字">
								</div>
								<div class="col-md-2">
									<a href="javascript:void(0);" id="search" class="btn btn-primary"> <i class="fa fa-search"></i>搜索
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<table id="searchTreeNodeDt" cellpadding="0" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>名称</th>
							<th>编号</th>
							<th>创建者</th>
							<th>创建时间</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="confirmModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">提示</h4>
			</div>
			<div class="modal-body">
				<span id="confirmMessage"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button id="btnConfirm" type="button" class="btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>
<div id="treeContextMenu" style="display: none;">
	<div text="新建报表" img="add.png" id="addReport"></div>
	<div text="设置备注" img="settings.gif" id="setComment"></div>
	<div text="报表属性" img="presentation.gif" id="reportPro"></div>
	<div id="ms1" type="separator"></div>
<!-- 	<div text="复制" img="copy.gif" id="copy"></div> -->
<!-- 	<div text="粘贴" img="paste.gif" id="paste"></div> -->
	<div text="查找" img="open.gif" id="search"></div>
	<div id="ms2" type="separator"></div>
	<div text="新增节点" img="page.gif" id="addNode"></div>
	<div text="修改节点" img="page.gif" id="editNode"></div>
	<div text="删除节点" img="page.gif" id="remove"></div>
	<div id="ms3" type="separator"></div>
	<div text="刷新" img="page.gif" id="refresh"></div>
</div>
<script type="text/javascript">
	pageSetUp();
	loadScript(['<%=request.getContextPath()%>/assets/modules/site/js/sitemgr.js' ], function() {
		ReportDesigner.init();
	});
</script>
