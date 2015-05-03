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