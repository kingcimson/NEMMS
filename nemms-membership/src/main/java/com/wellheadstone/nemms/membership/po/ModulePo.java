package com.wellheadstone.nemms.membership.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 系统模块持久类
 */
public class ModulePo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1270565283179355569L;

	/**
	 * 实体face_module名称
	 */
	public static String EntityName = "module";

	/**
	 * 列名module_id,系统模块标识
	 */
	public final static String ModuleId = "module_id";

	/**
	 * 列名parent_id,系统模块父标识
	 */
	public final static String ParentId = "parent_id";

	/**
	 * 列名name,系统模块父标识
	 */
	public final static String Name = "name";

	/**
	 * 列名code,系统模块代号
	 */
	public final static String Code = "code";

	/**
	 * 列名icon,系统模块显示图标
	 */
	public final static String Icon = "icon";

	/**
	 * 列名url,系统模块对应的页面地址
	 */
	public final static String Url = "url";

	/**
	 * 列名path,从根模块到当前子模块的id路径，id之间用逗号分隔
	 */
	public final static String Path = "path";

	/**
	 * 列名has_child,是否存在子模块,0否,1 是
	 */
	public final static String HasChild = "has_child";

	/**
	 * 列名link_type,URL链接类型(0表示系统内部，1表示外部链接，默认 0)
	 */
	public final static String LinkType = "link_type";

	/**
	 * 列名target,URL链接的target(_blank,_top等)
	 */
	public final static String Target = "target";

	/**
	 * 列名params,URL链接参数
	 */
	public final static String Params = "params";

	/**
	 * 列名status,系统模块的状态,1表示启用,0表示禁用,默认为1,其他保留
	 */
	public final static String Status = "status";

	/**
	 * 列名sequence,系统模块在当前父模块下的排序顺序
	 */
	public final static String Sequence = "sequence";

	/**
	 * 列名comment,系统模块备注
	 */
	public final static String Comment = "comment";

	/**
	 * 列名create_time,系统模块记录创建时间
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,系统模块记录更新时间戳
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "module_id", isIgnored = true)
	private Integer moduleId;

	@Column(name = "parent_id")
	private Integer parentId;

	@Column(name = "name")
	private String name;

	@Column(name = "code")
	private String code;

	@Column(name = "icon")
	private String icon = "";

	@Column(name = "url")
	private String url;

	@Column(name = "path")
	private String path;

	@Column(name = "has_child")
	private Boolean hasChild = false;

	@Column(name = "link_type")
	private Byte linkType = 0;

	@Column(name = "target")
	private String target = "";

	@Column(name = "params")
	private String params = "";

	@Column(name = "status")
	private Byte status;

	@Column(name = "sequence")
	private Integer sequence;

	@Column(name = "comment")
	private String comment;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	private String state = "closed";

	/**
	 * 获取系统模块标识
	 * 
	 * @return 系统模块标识
	 */
	public Integer getModuleId() {
		return this.moduleId;
	}

	/**
	 * 设置系统模块标识
	 * 
	 * @param moduleId
	 */
	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

	/**
	 * 获取系统模块父标识
	 * 
	 * @return 系统模块父标识
	 */
	public Integer getParentId() {
		return this.parentId;
	}

	/**
	 * 设置系统模块父标识
	 * 
	 * @param parentId
	 */
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	/**
	 * 获取系统模块父标识
	 * 
	 * @return 系统模块父标识
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 设置系统模块父标识
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取系统模块代号
	 * 
	 * @return 系统模块代号
	 */
	public String getCode() {
		return this.code;
	}

	/**
	 * 设置系统模块代号
	 * 
	 * @param code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * 获取系统模块显示图标
	 * 
	 * @return 系统模块显示图标
	 */
	public String getIcon() {
		return this.icon == null ? "" : this.icon;
	}

	/**
	 * 设置系统模块显示图标
	 * 
	 * @param icon
	 */
	public void setIcon(String icon) {
		this.icon = icon;
	}

	/**
	 * 获取系统模块对应的页面地址
	 * 
	 * @return 系统模块对应的页面地址
	 */
	public String getUrl() {
		return this.url == null ? "" : this.url;
	}

	/**
	 * 设置系统模块对应的页面地址
	 * 
	 * @param url
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * 获取从根模块到当前子模块的id路径，id之间用逗号分隔
	 * 
	 * @return 从根模块到当前子模块的id路径，id之间用逗号分隔
	 */
	public String getPath() {
		return this.path;
	}

	/**
	 * 设置从根模块到当前子模块的id路径，id之间用逗号分隔
	 * 
	 * @param path
	 */
	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * 获取是否存在子模块,0否,1 是
	 * 
	 * @return 是否存在子模块,0否,1 是
	 */
	public Boolean isHasChild() {
		return this.hasChild;
	}

	/**
	 * 设置是否存在子模块,0否,1 是
	 * 
	 * @param hasChild
	 */
	public void setHasChild(Boolean hasChild) {
		this.hasChild = hasChild;
	}

	/**
	 * 获取URL链接类型(0表示系统内部，1表示外部链接，默认 0)
	 * 
	 * @return (0表示系统内部，1表示外部链接，默认 0)
	 */
	public Byte getLinkType() {
		return this.linkType;
	}

	/**
	 * 设置URL链接类型(0表示系统内部，1表示外部链接，默认 0)
	 * 
	 * @param linkType
	 *            (0表示系统内部，1表示外部链接，默认 0)
	 */
	public void setLinkType(Byte linkType) {
		this.linkType = linkType;
	}

	/**
	 * 获取URL链接的target(_blank,_top等)
	 * 
	 * @return URL链接的target(_blank,_top等)
	 */
	public String getTarget() {
		return this.target;
	}

	/**
	 * 设置URL链接的target(_blank,_top等)
	 * 
	 * @param target
	 */
	public void setTarget(String target) {
		this.target = target;
	}

	/**
	 * 获取URL链接参数
	 * 
	 * @return URL链接参数
	 */
	public String getParams() {
		return this.params;
	}

	/**
	 * 设置URL链接参数
	 * 
	 * @param params
	 */
	public void setParams(String params) {
		this.params = params;
	}

	/**
	 * 获取系统模块的状态,1表示启用,0表示禁用,默认为1,其他保留
	 * 
	 * @return 系统模块的状态,1表示启用,0表示禁用,默认为1,其他保留
	 */
	public Byte getStatus() {
		return this.status;
	}

	/**
	 * 设置系统模块的状态,1表示启用,0表示禁用,默认为1,其他保留
	 * 
	 * @param status
	 */
	public void setStatus(Byte status) {
		this.status = status;
	}

	/**
	 * 获取系统模块在当前父模块下的排序顺序
	 * 
	 * @return 系统模块在当前父模块下的排序顺序
	 */
	public Integer getSequence() {
		return this.sequence;
	}

	/**
	 * 设置系统模块在当前父模块下的排序顺序
	 * 
	 * @param sequence
	 */
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	/**
	 * 获取系统模块备注
	 * 
	 * @return 系统模块备注
	 */
	public String getComment() {
		return this.comment;
	}

	/**
	 * 设置系统模块备注
	 * 
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * 获取系统模块记录创建时间
	 * 
	 * @return 系统模块记录创建时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置系统模块记录创建时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取系统模块记录更新时间戳
	 * 
	 * @return 系统模块记录更新时间戳
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置系统模块记录更新时间戳
	 * 
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取当前系统模块是否为叶子模块
	 * 
	 * @return true|false
	 */
	public boolean isLeaf() {
		return !this.hasChild;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public static String getColumnName(String name){
		if("moduleId".equals(name)) return ModulePo.ModuleId;
		if("parentId".equals(name)) return ModulePo.ParentId;
		if("createTime".equals(name)) return ModulePo.CreateTime;
		if("updateTime".equals(name)) return ModulePo.UpdateTime;
		return ModulePo.Sequence;
	}
}
