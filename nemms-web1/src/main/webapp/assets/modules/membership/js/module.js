var MembershipModule = {
	pageUrl : XFrame.getContextPath() + '/membership/module/',
	ajaxPost : function(data, url, callback) {
		$.ajax({
			type : 'POST',
			url : url,
			data : data,
			dataType : "json",
			cache : false,
			beforeSend : function(data) {
				console.log(data);
			},
			success : function(json) {
				module_tree.refreshItem("0");
				$.smallBox({
					title : json.msg,
					color : "#739E72",
					iconSmall : "fa fa-times fadeInRight animated",
					timeout : 4000
				});
				if (json.success) {
					if (callback) {
						callback();
					}
				}
			}
		});
	},
	load : function(id) {
		$('#edit_module_form').resetForm();
		$.getJSON(MembershipModule.pageUrl + 'getModuleById?id=' + id,
			function(result) {
				$("#edit_module_form").autofill(result);
			});
	},
	validator : function(){
        $("#edit_module_form").validate({
        	rules: {
    	        code: {
    	            required: true
    	        },
    	        sequence: {
    	            required: true,
    	        },
    	        comment: {
    	            required: true,
    	            minlength: 2
    	        },
    	        name: {
    	            required: true,
    	            minlength: 2
    	        }
    	    },
    	    messages: {
    	        code: {
    	            required:'请填写操作代号', 
    	        },
    	        sequence: {
    	            required:'请填写排序号',
    	        },
    	        comment: {
    	            required: '请填写评论',
    	            minlength:'请输入一个 长度最少是2的字符串'
    	        },
    	        name: {
    	            required: '请填写操作名称',
    	            minlength:'请输入一个 长度最少是2的字符串'
    	        }
    	    } 
        });
	},
	createModule : function() {
		var id = module_tree.getSelectedItemId();
		if (id == '') {
			$.smallBox({
				title : "请选择一个模块",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		} else {
			$("#parentId").val(id);
			if ($('#edit_module_form').validate().form()) {
				var url = MembershipModule.pageUrl + 'add';
				MembershipModule.ajaxPost($('#edit_module_form').serialize(), url);
			}
		}
	},
	createRootModule : function() {
		$("#parentId").val(0);
		if ($('#edit_module_form').validate().form()) {
			var url = MembershipModule.pageUrl +'add';
			MembershipModule.ajaxPost($('#edit_module_form').serialize(), url);
		}
	},
	editModule : function(){
		var id = module_tree.getSelectedItemId();
		if(id ==''){
			$.smallBox({
				title : "请选择一个模块",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		}else if($('#edit_module_form').validate().form()){
			$("#moduleId").val(id);
			var url = MembershipModule.pageUrl + 'edit';
			MembershipModule.ajaxPost($('#edit_module_form').serialize(),url);
		}
	},
	deleteModuleModal : function() {
		var id = module_tree.getSelectedItemId();
		if (id == '') {
			$.smallBox({
				title : "请选择一个模块",
				color : "#C46A69",
				iconSmall : "fa fa-times fadeInRight animated",
				timeout : 4000
			});
		} else {
			$("#module_delete_btn").attr("onclick",
					"javascript:MembershipModule.remove('" + id + "');");
			$("#delete_alert_message").text("确定删除？");
			$('#delete_message_modal').modal('show');
		}
	},
	remove : function(id) {
		var data = {
			id : id
		};
		MembershipModule.ajaxPost(data, MembershipModule.pageUrl + 'removeById',function(){
			$('#delete_message_modal').modal('hide');
			$("#module_delete_btn").attr("onclick", "");
		});
	}
};