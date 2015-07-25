var MembershipEvent = {
	dt : null,
	loadDataTables : function() {
		var url = XFrame.getContextPath() + '/membership/event/getevents';
		MembershipEvent.dt.ajax.url(url).load();
	},
	format : function(d) {
		return '信息:<br>' + d.message + '<br>';
	},
	runDataTables : function() {
		var options = DataTablePaging.getAjaxPagingOptions({
			ajaxUrl:XFrame.getContextPath() + '/membership/event/getevents',
			order : [5,'desc'],
			colums:[ {
				"class" : "details-control",
				orderable : false,
				data : null,
				defaultContent : ""}, 
				{data : "eventId",name:"event_id"}, 
				{data : "source",name:"source"}, 
				{data : "account",name:"account"}, 
				{data : "level",name:"level"}, 
				{data : "createTime",name:"create_time"},
			],
			columsdefs:[ {
				targets : [ 6 ], 
				data : "eventId", 
				render : function(value, type, data) { 
					return "<a href=\"javascript:MembershipEvent.deleteEventDialog('"+ value +"')\"><span class=\"glyphicon glyphicon-remove\"></span></a>";
				}
			} ]
		});
		var dt = MembershipEvent.dt = $('#example').DataTable(options);
		var detailRows = [];
		$('#example tbody').on('click', 'tr td:first-child', function() {
			var tr = $(this).closest('tr');
			var row = dt.row(tr);
			var idx = $.inArray(tr.attr('id'), detailRows);
			if (row.child.isShown()) {
				tr.removeClass('details');
				row.child.hide();
				detailRows.splice(idx, 1);
			} else {
				tr.addClass('details');
				row.child(MembershipEvent.format(row.data())).show();
				if (idx === -1) {
					detailRows.push(tr.attr('id'));
				}
			}
		});
		dt.on('draw', function() {
			$.each(detailRows, function(i, id) {
				$('#' + id + ' td:first-child').trigger('click');
			});
		});
	},
	deleteEventDialog : function(id, name) {
		$("#delete_message").text("确定删除？");
		$("#delete_id").val(id);
		$('#delete_dialog').dialog('open');
	},
	findEventsByKeyword : function() {
		var fieldName = $("#fieldName").val();
		var keyword = $("#Keyword").val();
		var url = XFrame.getContextPath() + '/membership/event/geteventsbykeyword?fieldName=' + fieldName + '&keyword=' + keyword;
		MembershipEvent.dt.ajax.url(url).load();
	},
	deleteEventById : function() {
		$.post(XFrame.getContextPath() + '/membership/event/removeById', {
			id : $("#delete_id").val(),
		}, function(result) {
			if (result.success) {
				MembershipEvent.loadDataTables();
			} else {
				$("#alert_message").text(result.msg);
				$('#message_dialog').dialog('open');
			}
		}, 'json');
	},
	clear : function() {
		$.post(XFrame.getContextPath() + '/membership/event/clear', function(result) {
			if (result.success) {
				MembershipEvent.loadDataTables();
			} else {
				$("#alert_message").text(result.msg);
				$('#message_dialog').dialog('open');
			}
		}, 'json');
	}
}

$("#delete_dialog").dialog({
	autoOpen : false,
	modal : true,
	title : "提示",
	buttons : [ {
		html : "取消",
		"class" : "btn btn-default",
		click : function() {
			$(this).dialog("close");
		}
	}, {
		html : "<i class='fa fa-check'></i>&nbsp; 确定",
		"class" : "btn btn-primary",
		click : function() {
			var id = $("#delete_id").val();
			MembershipEvent.deleteEventById(id);
			$(this).dialog("close");
		}
	} ]
});

$(function() {
	MembershipEvent.runDataTables();
});