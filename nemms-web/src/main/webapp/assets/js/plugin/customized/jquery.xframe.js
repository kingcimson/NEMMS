jQuery.fn.extend({enable: function() {return this.each(function() { this.disabled = false; });},
disable: function() {return this.each(function() { this.disabled = true; });
}
});
$.fn.paramMaxLength = function(value, length){
	if(typeof(length)=="number"
		&&typeof(value)!="undefined"
		&&value.length>=length){
		return true;
	}
	return false;
};
$.fn.paramMinLength = function(value, length){
	if(typeof(length)=="number"
			&&typeof(value)!="undefined"
			&&value.length<length){
		return true;
	}
	return false;
};
$.fn.paramMaxMinLength = function(value, param){
	if($.fn.paramMaxLength(value,param[0])||$.fn.paramMinLength(value,param[1])){
		return true;
	}
	return false;
};

$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push($.trim(this.value) || '');
        } else {
            o[this.name] = $.trim(this.value) || '';
        }
    });
    return o;
};

$.fn.clearNull=function(row){
	if(row==undefined||row==null){
		return;
	}
	if(typeof(row)== "object"){
		for(var t in row){
			if(row[t]==null||row[t]=='null'){
				row[t] = '';
			}
		}
	}
};

$.fn.formatDateHIS=function() {
	this.datebox( {
		currentText : '今天',
		closeText : '关闭',
		disabled : false,
		required : false,
		needTime:true,
		formatter : function(date){
			date = new Date();
			if (date instanceof Date) {
				var h = (new Date()).getHours();
				h = (h<10)?("0"+h):h;
				var i = (new Date()).getMinutes();
				i = (i<10)?("0"+i):i;
				var s = (new Date()).getSeconds();
				s = (s<10)?("0"+s):s;
				return  h + ':' + i + ':' + s ;
			}
			return '';
		}
	});
};
$.fn.formatDateYMD=function() {
	this.datebox( {
		currentText : '今天',
		closeText : '关闭',
		disabled : false,
		required : false,
		needTime:true,
		showTime:true,
		formatter : function(date){
			if (date instanceof Date) {
				var y = date.getFullYear();
				var m = date.getMonth() + 1;
				m = (m<10)?("0"+m):m;
				var d = date.getDate();
				d = (d<10)?("0"+d):d;
				return y + '-' + m + '-' + d ;
			}
			return '';
		}
	});
};
$.fn.formatDateYMDHIS=function() {
	this.datebox( {
		currentText : '今天',
		closeText : '关闭',
		disabled : false,
		required : false,
		needTime:true,
		formatter : function(date){
			if (date instanceof Date) {
				var y = date.getFullYear();
				var m = date.getMonth() + 1;
				m = (m<10)?("0"+m):m;
				var d = date.getDate();
				d = (d<10)?("0"+d):d;
				var h = (new Date()).getHours();
				h = (h<10)?("0"+h):h;
				var i = (new Date()).getMinutes();
				i = (i<10)?("0"+i):i;
				var s = (new Date()).getSeconds();
				s = (s<10)?("0"+s):s;
				var ms = date.getMilliseconds();
				return y + '-' + m + '-' + d + ' ' + h + ':' + i + ':' + s;
			}
			return '';
		}
	});
};
$.fn.formatDate=function() {
	this.datebox( {
		currentText : '今天',
		closeText : '关闭',
		disabled : false,
		required : false,
		needTime:true,
		formatter : function(date){
			if (date instanceof Date) {
				var y = date.getFullYear();
				var m = date.getMonth() + 1;
				m = (m<10)?("0"+m):m;
				var d = date.getDate();
				d = (d<10)?("0"+d):d;
				return y +""+ m +"" + d ;
			}
			return '';
		}
	});
};
$.fn.formatDateYM=function() {
	this.datebox( {
		currentText : '今天',
		closeText : '关闭',
		disabled : false,
		required : false,
		needTime:true,
		formatter : function(date){
			if (date instanceof Date) {
				var y = date.getFullYear();
				var m = date.getMonth() + 1;
				m = (m<10)?("0"+m):m;
				var d = date.getDate();
				d = (d<10)?("0"+d):d;
				return y +''+ m ;
			}
			return '';
		}
	});
};
$.fn.frameVar = function(callUrl){
	return '<iframe scrolling="no" frameborder="0"  src="'+callUrl+'" style="width:100%;height:100%;"></iframe>';
};

$.fn.frameHtml = function(callUrl){
	this.html(this.frameVar(callUrl));
};

$.fn.dialogFrameHtml = function(callUrl){
	this.html(this.frameVar(callUrl));
	this.window('open');
};
/**
 * 根据传入的对象创建一个Window窗体
 */
$.fn.dialogWindowByObject = function (object){
	if(object==undefined){
		object =this.dialogParamObject(undefined,undefined);
	}
	return this.window(object);
};

/**
 * 创建一个关闭回调的窗体
 */
$.fn.dialogWindowByBeforeClose = function (onBeforeClose){
	var object = this.dialogParamObject();
	object["onBeforeClose"] = onBeforeClose;
	return this.window(object);
};
$.fn.dialogFrameWindow = function(width,height){
	return this.window(this.dialogParamObject(width,height));
};

$.fn.dialogShowWindow = function(width,height){
	return this.window(this.dialogParamObject(width,height));
};

$.fn.dialogParamObject = function(width,height,onBeforeClose){
	widthV = width==undefined?600:width;
	heightV = height==undefined?400:height;
	object = {closed:true,width:600,height:400,resizable: true,collapsible:false,minimizable:false,draggable: true};
	object["width"] = widthV;
	object["height"] = heightV;
	object["onBeforeClose"] = onBeforeClose;
	return object;
};

$.fn.dialogShowFullWindow = function(){
	return this.window({fit:true,closed:true,resizable: false,collapsible:false,minimizable:false,maximizable:false,draggable: false});
};
                               


