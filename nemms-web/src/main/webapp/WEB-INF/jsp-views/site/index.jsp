<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp-views/frame/init.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/form_scripts.jsp"%>
<%@ include file="/WEB-INF/jsp-views/frame/datatables_scripts.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/skins/terrace/dhtmlxtree.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/plugin/select2/select2.css">
<script src="<%=request.getContextPath()%>/assets/js/plugin/dhtmlxtree/dhtmlxtree.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/plugin/select2/select2.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/libs/socket.io-1.3.5.js"></script>
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

.device-tree {
	height: 750px;
	border: 1px solid silver;
	overflow: auto;
}

.device-tree-btn {
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

tr.selected:before {
	content: '';
	display: none;
}
</style>
<div class="row">
	<div class="col-lg-2" style="padding-right: 5px;">
		<div class="device-tree-btn">
			<a href="javascript:void(0);" class="btn btn-primary" id="btnTreeAdd"><i class="fa fa-plus-circle"></i>添加</a>
			<!-- <a href="javascript:void(0);" class="btn btn-primary" id="btnTreeSearch"><i class="fa fa-search"></i>查找</a> -->
			<a href="javascript:void(0);" class="btn btn-primary" id="btnTreeRefresh"><i class="fa fa-refresh"></i>刷新</a>
		</div>
		<div id="device-tree" class="device-tree"></div>
		<input type="hidden" name="treeAction" id="treeAction" />
	</div>
	<article class="col-lg-10" style="padding-left: 5px;">
		<div class="widget-body-toolbar">
			<div class="row">
				<div class="col-sm-12 col-md-10">
					<div class="form-group">
						<a class="btn btn-primary" id="btnGetParamList"> <i class="fa fa-plus"></i>获取监控列表
						</a> <a class="btn btn-primary" id="btnFindAllParam"> <i class="fa fa-list"></i>查询全部
						</a>
					</div>
				</div>
			</div>
		</div>
		<div id="tabs">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#deviceTab" role="tab" target="b" data-toggle="tab">设备参数</a></li>
				<li role="presentation"><a href="#netmgrTab" role="tab" target="b" data-toggle="tab">网管参数</a></li>
				<li role="presentation"><a href="#warningTab" role="tab" target="b" data-toggle="tab">告警参数</a></li>
				<li role="presentation"><a href="#enabledTab" role="tab" target="b" data-toggle="tab">使能参数</a></li>
				<li role="presentation"><a href="#settingsTab" role="tab" target="b" data-toggle="tab">设置参数</a></li>
				<li role="presentation"><a href="#performanceTab" role="tab" target="b" data-toggle="tab">性能参数</a></li>
				<li role="presentation"><a href="#customTab" role="tab" target="b" data-toggle="tab">自定义参数</a></li>
			</ul>
			<div class="tab-content">
				<section id="widget-grid">
					<div role="tabpanel" class="tab-pane active" id="deviceTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-0" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix">
<div class="modal-body no-padding"><fieldset>
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
												<label class="label col col-2">类别:</label>
												<div class="col col-4">
													<label class="select"> <select id="categoryId" name="categoryId">
													</select> <i></i>
													</label>
												</div>
												<label class="label col col-2">模式:</label>
												<div class="col col-4">
													<label class="select"> <select id="mode" name="mode">
													</select> <i></i>
													</label>
												</div>
											</div>
										</section>
										<section>
											<div class="row">
												<label class="label col col-2">系数:</label>
												<div class="col col-4">
													<label class="input"> <input type="text" name="ratio" id="ratio" required>
													</label>
												</div>
												<label class="label col col-2">单位:</label>
												<div class="col col-4">
													<label class="input"> <input type="text" name="unit" id="unit" required>
													</label>
												</div>
											</div>
										</section>
										<section>
											<div class="row">
												<label class="label col col-2">值类型:</label>
												<div class="col col-4">
													<label class="select"> <select id="valueType" name="valueType">
													</select> <i></i>
													</label>
												</div>
												<label class="label col col-2">值长度:</label>
												<div class="col col-4">
													<label class="input"> <input type="text" name="valueLen" id="valueLen" required>
													</label>
												</div>
											</div>
										</section>
										<section>
											<div class="row">
												<label class="label col col-2">值最小长度:</label>
												<div class="col col-4">
													<label class="input"> <input type="text" name="valueMinLen" id="valueMinLen" required>
													</label>
												</div>
												<label class="label col col-2">值最大长度:</label>
												<div class="col col-4">
													<label class="input"> <input type="text" name="valueMaxLen" id="valueMaxLen" required>
													</label>
												</div>
											</div>
										</section>
										<section>
											<div class="row">
												<label class="label col col-2">最小值:</label>
												<div class="col col-4">
													<label class="input"> <input type="text" name="minValue" id="minValue" required>
													</label>
												</div>
												<label class="label col col-2">最大值:</label>
												<div class="col col-4">
													<label class="input"> <input type="text" name="maxValue" id="maxValue" required>
													</label>
												</div>
											</div>
										</section>
										<section>
											<div class="row">
												<label class="label col col-2">告警级别:</label>
												<div class="col col-4">
													<label class="select"> <select id="warnLevel" name="warnLevel">
													</select> <i></i>
													</label>
												</div>
												<label class="label col col-2">权限归属:</label>
												<div class="col col-4">
													<label class="select"> <select id="authorityRoles" name="authorityRoles">
													</select> <i></i>
													</label>
												</div>
											</div>
										</section>
										</fieldset>
					</div>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="netmgrTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-1" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix"></div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="warningTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-2" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix"></div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="enabledTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-3" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix"></div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="settingsTab">
						,l
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-4" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix"></div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="performanceTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-5" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix"></div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="customTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-6" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">
							<header> </header>
							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix"></div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<!-- console tabs -->
		<div id="console_tabs">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#comunicateTab" role="tab" target="b" data-toggle="tab">通讯信息列表</a></li>
			</ul>
			<div class="tab-content">
				<section id="widget-grid-console">
					<div role="tabpanel" class="tab-pane active" id="comunicateTab">
						<div class="jarviswidget jarviswidget-color-white" id="wid-id-tab2-1" style="margin: 0 0 5px;"
							data-widget-editbutton="false" data-widget-deletebutton="false">

							<div>
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body clearfix">
									<table id="comunicateDt" class="display" ll="0" width="100%">
										<thead>
											<tr>
												<th>任务序号</th>
												<th>包标识号</th>
												<th>操作类型</th>
												<th>目的地址</th>
												<th>包属性</th>
												<th>发送时间</th>
												<th>发送内容</th>
												<th>发送状态</th>
												<th>接收时间</th>
												<th>接收内容</th>
												<th>接收状态</th>
												<th>接收包数</th>
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
<div class="modal" id="add_site_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modal_title">新增站点</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="add_site_form" name="add_site_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">站点名称:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="name" id="site_name" required></label>
								</div>
								<label class="label col col-2">站点编号:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="uid" id="site_uid" required></label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">设备类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="deviceType" id="site_deviceType"></select> <i></i></label>
								</div>
								<label class="label col col-2">AP协议类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="apProtocol" id="site_apProtocol">
									</select> <i></i>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">mcp协议类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="mcpProtocol" id="site_mcpProtocol">
									</select> <i></i>
									</label>
								</div>
								<label class="label col col-2">通讯协议类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="protocol" id="site_protocol">
									</select> <i></i>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">IP地址(UDP):</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="ipAddr" id="site_ipAddr" value="127.0.0.1" required>
									</label>
								</div>
								<label class="label col col-2">端口:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="port" id="site_port" value="8000" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">设备厂商:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="manufactor" id="site_manufactor" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">站点顺序:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="sequence" id="site_sequence" value="10" required></label>
								</div>
								<label class="label col col-2">站点备注:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="comment" id="site_comment"></label> <input type="hidden"
										name="pid" id="site_pid" value="0" /> <input type="hidden" name="flag" id="site_flag" value="0" />
								</div>
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="button" id="add_site_submit" class="btn btn-primary">确定</a> <a type="button" class="btn btn-default"
							data-dismiss="modal">取消</a>
					</footer>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="edit_site_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modal_title">修改站点</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="edit_site_form" name="edit_site_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">站点名称:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="name" id="edit_site_name" required></label>
								</div>
								<label class="label col col-2">站点编号:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="uid" id="edit_site_uid" required></label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">设备类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="deviceType" id="edit_site_deviceType"></select> <i></i></label>
								</div>
								<label class="label col col-2">AP协议类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="apProtocol" id="edit_site_apProtocol">
									</select> <i></i>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">mcp协议类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="mcpProtocol" id="edit_site_mcpProtocol">
									</select> <i></i>
									</label>
								</div>
								<label class="label col col-2">通讯协议类型:</label>
								<div class="col col-4">
									<label class="select"> <select name="protocol" id="edit_site_protocol">
									</select> <i></i>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">IP地址(UDP):</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="ipAddr" id="edit_site_ipAddr" value="127.0.0.1" required>
									</label>
								</div>
								<label class="label col col-2">端口:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="port" id="edit_site_port" value="8000" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">设备厂商:</label>
								<div class="col col-10">
									<label class="input"> <input type="text" name="manufactor" id="edit_site_manufactor" required>
									</label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">站点顺序:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="sequence" id="edit_site_sequence" value="10" required></label>
								</div>
								<label class="label col col-2">站点备注:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="comment" id="edit_site_comment"></label>
								</div>
								<input type="hidden" name="id" id="edit_site_id" />
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="button" id="edit_site_submit" class="btn btn-primary">确定</a> <a type="button" class="btn btn-default"
							data-dismiss="modal">取消</a>
					</footer>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="add_device_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modal_title">新增设备</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="add_device_form" name="add_device_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">设备名称:</label>
								<div class="col col-4">
									<label class="input"><input type="text" name="name" id="device_name" required> </label>
								</div>
								<label class="label col col-2">设备编号:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="uid" id="device_uid" required></label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">设备顺序:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="sequence" id="device_sequence" value="10" required></label>
								</div>
								<label class="label col col-2">设备备注:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="comment" id="device_comment"></label> <input
										type="hidden" name="pid" id="device_pid" /> <input type="hidden" name="flag" id="device_flag" value="1" />
								</div>
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="button" id="add_device_submit" class="btn btn-primary">确定</a> <a type="button" class="btn btn-default"
							data-dismiss="modal">取消</a>
					</footer>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="edit_device_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modal_title">修改设备</h4>
			</div>
			<div class="modal-body no-padding">
				<form id="edit_device_form" name="edit_device_form" method="post" class="smart-form">
					<fieldset>
						<section>
							<div class="row">
								<label class="label col col-2">设备名称:</label>
								<div class="col col-4">
									<label class="input"><input type="text" name="name" id="edit_device_name" required> </label>
								</div>
								<label class="label col col-2">设备编号:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="uid" id="edit_device_uid" required></label>
								</div>
							</div>
						</section>
						<section>
							<div class="row">
								<label class="label col col-2">设备顺序:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="sequence" id="edit_device_sequence" value="10" required></label>
								</div>
								<label class="label col col-2">设备备注:</label>
								<div class="col col-4">
									<label class="input"> <input type="text" name="comment" id="edit_device_comment"></label> <input
										type="hidden" name="id" id="edit_device_id" />
								</div>
							</div>
						</section>
					</fieldset>
					<footer>
						<a type="button" id="edit_device_submit" class="btn btn-primary">确定</a> <a type="button" class="btn btn-default"
							data-dismiss="modal">取消</a>
					</footer>
				</form>
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
	<div text="新增设备" img="page.gif" id="addDevice"></div>
	<div text="修改" img="page.gif" id="edit"></div>
	<div text="删除" img="page.gif" id="remove"></div>
	<div id="ms1" type="separator"></div>
	<!--<div text="复制" img="copy.gif" id="copy"></div> -->
	<!--<div text="粘贴" img="paste.gif" id="paste"></div>
	<div text="查找" img="open.gif" id="search"></div>
	<div id="ms3" type="separator"></div> -->
	<div text="刷新" img="page.gif" id="refresh"></div>
</div>
<script type="text/javascript">
	pageSetUp();
	loadScript(['<%=request.getContextPath()%>/assets/modules/site/js/sitemgr.js' ],
			function() {
				SiteMgr.init();
				SiteMgr.socketIO.init('localhost','9100');
			});
</script>
