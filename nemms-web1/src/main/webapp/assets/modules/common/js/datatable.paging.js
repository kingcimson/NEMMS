var DataTablePaging = {
	language : {
		zh_cn : {
			processing : "数据正在加载中...",
			search : "查询:",
			lengthMenu : "每页显示 _MENU_ 条记录",
			info : "从 _START_ 到 _END_ /共 _TOTAL_ 条记录",
			infoEmpty : "从 0 到  0  共 0  条记录",
			infoFiltered : "(从 _MAX_ 条数据中检索)",
			infoPostFix : "",
			thousands : ",",
			loadingRecords : "数据加载中...",
			zeroRecords : "没有检索到数据",
			emptyTable : "没有数据",
			paginate : {
				first : "首页",
				previous : "前一页",
				next : "后一页",
				last : "尾页"
			},
			aria : {
				sortAscending : ": 升序",
				sortDescending : ": 降序"
			}
		}
	},
	/**
	 * 获取ajax分页options设置
	 */
	getAjaxPagingOptions : function(settings) {
		var options = {
			ajax : {
				url : settings.ajaxUrl,
				type : "post"
			},
			serverSide : true,
			destroy : true,
			processing : true,
			ordering : true,
			searching : false,
			paging : true,
			pagingType : "full_numbers",
			lengthMenu : [ 10, 20, 50, 100 ],
			pageLength : 20,
			order : settings.order,// [index,'asc|desc']
			language : DataTablePaging.language.zh_cn,
			columns : settings.colums,
			columnDefs : settings.columsdefs,
		};
		return options;
	},
	/**
	 * 获取ajax不分页options设置
	 */
	getOptions : function(settings) {
		var options = {
			ajax : {
				url : settings.ajaxUrl,
				type : "post"
			},
			serverSide : false,
			destroy : true,
			processing : true,
			ordering : true,
			searching : false,
			pagingType : "full_numbers",
			lengthMenu : [ 10, 20, 50, 100 ],
			pageLength : 20,
			language : DataTablePaging.language.zh_cn,
			columns : settings.colums,
			columnDefs : settings.columsdefs,
		};
		return options;
	},
	/**
	 * 获取非ajax分页options设置
	 */
	getNotAjaxPagingOptions : function(settings) {
		var options = {
			serverSide : false,
			destroy : true,
			processing : true,
			ordering : false,
			searching : false,
			paging : true,
			pagingType : "full_numbers",
			lengthChange : false,
			pageLength : settings.pageLength,
			info : false,
			language : DataTablePaging.language.zh_cn,
			columns : settings.colums,
			columnDefs : settings.columsdefs
		};
		return options;
	},
	/**
	 * 获取非ajax不分页options设置
	 */
	getNotAjaxOptions : function(settings) {
		var options = {
			serverSide : false,
			destroy : true,
			processing : true,
			ordering : false,
			searching : false,
			paging : false,
			scrollX : true,
			info : false,
			language : DataTablePaging.language.zh_cn,
			columns : settings.colums,
			columnDefs : settings.columsdefs
		};
		return options;
	}
};