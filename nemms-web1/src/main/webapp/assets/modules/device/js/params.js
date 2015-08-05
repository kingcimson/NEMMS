var deviceParamPageUrl = XFrame.getContextPath() + '/device/';
$(function() {
	$('#param-datagrid').datagrid({
		method : 'get',
		fit : true,
		fitColumns : true,
		singleSelect : true,
		pagination : true,
		rownumbers : true,
		pageSize : 50,
		url : deviceParamPageUrl + 'params/list',
		toolbar: [{
			iconCls: 'icon-add',
			handler: function(){alert('add')}
		},'-',{
			iconCls: 'icon-edit',
			handler: function(){alert('edit')}
		},'-',{
			iconCls: 'icon-remove',
			handler: function(){alert('remove')}
		}],
		columns : [ [ {
			field : 'createTime',
			title : '创建时间',
			width : 100,
			sortable : true
		}, {
			field : 'name',
			title : '名称',
			width : 100,
			sortable : true
		}, {
			field : 'sqlText',
			title : '查询语句',
			width : 300,
			sortable : true,
			formatter : hiveQueryer.myQueryGrid.sqlTextFormatter
		}, {
			field : 'dsName',
			title : '数据源',
			width : 100,
			sortable : true
		}, {
			field : 'options',
			title : '操作',
			width : 100,
			formatter : function(value, row, index) {
				var imgPath = XFrame.getContextPath() + '/assets/icons/';
				var icons = [ {
					"name" : "edit",
					"title" : "编辑"
				}, {
					"name" : "remove",
					"title" : "删除"
				} ];
				var buttons = [];
				for (var i = 0; i < icons.length; i++) {
					var icon = icons[i];
					var path = imgPath + icon.name + ".png";
					buttons.push('<a href="#" title ="' + icon.title + '" onclick="javascript:hiveQueryer.myQueryGrid.execOptionAct(\'' + icon.name
							+ '\',' + index + ')"><img src="' + path + '" alt="' + icon.title + '"/"></a>');
				}
				return buttons.join(' ');
			}
		} ] ],
		onDblClickRow : function(rowIndex, rowData){
			
		}
	});
});

var DeviceParam = {
		
};