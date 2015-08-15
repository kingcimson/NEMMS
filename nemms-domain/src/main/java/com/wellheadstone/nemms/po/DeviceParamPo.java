package com.wellheadstone.nemms.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

public class DeviceParamPo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -950194582722710175L;

	/**
	 * 实体device_param名称
	 */
	public static String EntityName = "device_param";

	/**
	 * 列名id,参数id
	 */
	public final static String Id = "id";

	/**
	 * 列名param_id,设备参数标识(整数十六进制)
	 */
	public final static String ParamUid = "param_uid";

	/**
	 * 列名mcp_id,mcp协义类型1:mcp_a;2:mcp_b;3:mcp_c
	 */
	public final static String McpId = "mcp_id";

	/**
	 * 列名category_id,参数类别
	 */
	public final static String CategoryId = "category_id";

	/**
	 * 列名name,参数名称
	 */
	public final static String Name = "name";

	/**
	 * 列名mode,读写属性
	 */
	public final static String Mode = "mode";

	/**
	 * 列名unit,参数单位
	 */
	public final static String Unit = "unit";

	/**
	 * 列名ratio,传输比或系数
	 */
	public final static String Ratio = "ratio";

	/**
	 * 列名value_type,参数值数据类型(uint等)
	 */
	public final static String ValueType = "value_type";

	/**
	 * 列名value_len,参数值数据长度
	 */
	public final static String ValueLen = "value_len";

	/**
	 * 列名value_min_len,参数值数据最小长度
	 */
	public final static String ValueMinLen = "value_min_len";

	/**
	 * 列名value_max_len,参数值数据最大长度
	 */
	public final static String ValueMaxLen = "value_max_len";

	/**
	 * 列名min_value,参数最小值
	 */
	public final static String MinValue = "min_value";

	/**
	 * 列名max_value,参数最大值
	 */
	public final static String MaxValue = "max_value";

	/**
	 * 列名authority_roles,参数权限归属(即系统哪些角色的用户可以使用),对应角色id
	 */
	public final static String AuthorityRoles = "authority_roles";

	/**
	 * 列名warn_level,参数告警级别
	 */
	public final static String WarnLevel = "warn_level";

	/**
	 * 列名create_time,
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,
	 */
	public final static String UpdateTime = "update_time";

	/**
	 * 列名html_elem,
	 */
	public final static String HtmlElem = "html_elem";

	/**
	 * 列名html_elem_key,
	 */
	public final static String HtmlElemKey = "html_elem_key";

	@Column(name = "id", isIgnored = true)
	private Integer id;

	@Column(name = "param_uid")
	private String paramUid;

	@Column(name = "mcp_id")
	private Integer mcpId;

	@Column(name = "category_id")
	private Integer categoryId;

	@Column(name = "name")
	private String name;

	@Column(name = "mode")
	private String mode;

	@Column(name = "unit")
	private String unit;

	@Column(name = "ratio")
	private String ratio;

	@Column(name = "value_type")
	private String valueType;

	@Column(name = "value_len")
	private Integer valueLen;

	@Column(name = "value_min_len")
	private Integer valueMinLen;

	@Column(name = "value_max_len")
	private Integer valueMaxLen;

	@Column(name = "min_value")
	private String minValue;

	@Column(name = "max_value")
	private String maxValue;

	@Column(name = "authority_roles")
	private String authorityRoles;

	@Column(name = "warn_level")
	private String warnLevel;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	@Column(name = "html_elem")
	private String htmlElem;

	@Column(name = "html_elem_key")
	private String htmlElemKey;

	/**
	 * 获取参数id
	 * 
	 * @return 参数id
	 */
	public Integer getId() {
		return this.id;
	}

	/**
	 * 设置参数id
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取设备参数标识
	 * 
	 * @return 设备参数标识(整数十六进制)
	 */
	public String getParamUid() {
		return this.paramUid;
	}

	/**
	 * 设置设备参数标识(整数十六进制)
	 * 
	 * @param paramUid
	 */
	public void setParamUid(String paramUid) {
		this.paramUid = paramUid;
	}

	/**
	 * 获取mcp协义类型1:mcp_a;2:mcp_b;3:mcp_c
	 * 
	 * @return mcp协义类型1:mcp_a;2:mcp_b;3:mcp_c
	 */
	public Integer getMcpId() {
		return this.mcpId;
	}

	/**
	 * 设置mcp协义类型1:mcp_a;2:mcp_b;3:mcp_c
	 * 
	 * @param mcpId
	 */
	public void setMcpId(Integer mcpId) {
		this.mcpId = mcpId;
	}

	/**
	 * 获取参数类别
	 * 
	 * @return 参数类别
	 */
	public Integer getCategoryId() {
		return this.categoryId;
	}

	/**
	 * 设置参数类别
	 * 
	 * @param categoryId
	 */
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * 获取参数名称
	 * 
	 * @return 参数名称
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 设置参数名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取读写属性
	 * 
	 * @return 读写属性
	 */
	public String getMode() {
		return this.mode;
	}

	/**
	 * 设置读写属性
	 * 
	 * @param mode
	 */
	public void setMode(String mode) {
		this.mode = mode;
	}

	/**
	 * 获取参数单位
	 * 
	 * @return 参数单位
	 */
	public String getUnit() {
		return this.unit == null ? "" : this.unit;
	}

	/**
	 * 设置参数单位
	 * 
	 * @param unit
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}

	/**
	 * 获取传输比或系数
	 * 
	 * @return 传输比或系数
	 */
	public String getRatio() {
		return this.ratio;
	}

	/**
	 * 设置传输比或系数
	 * 
	 * @param ratio
	 */
	public void setRatio(String ratio) {
		this.ratio = ratio;
	}

	/**
	 * 获取参数值数据类型(uint等)
	 * 
	 * @return 参数值数据类型(uint等)
	 */
	public String getValueType() {
		return this.valueType;
	}

	/**
	 * 设置参数值数据类型(uint等)
	 * 
	 * @param valueType
	 */
	public void setValueType(String valueType) {
		this.valueType = valueType;
	}

	/**
	 * 获取参数值数据长度
	 * 
	 * @return 参数值数据长度
	 */
	public Integer getValueLen() {
		return this.valueLen;
	}

	/**
	 * 设置参数值数据长度
	 * 
	 * @param valueLen
	 */
	public void setValueLen(Integer valueLen) {
		this.valueLen = valueLen;
	}

	/**
	 * 获取参数值数据最小长度
	 * 
	 * @return 参数值数据最小长度
	 */
	public Integer getValueMinLen() {
		return this.valueMinLen;
	}

	/**
	 * 设置参数值数据最小长度
	 * 
	 * @param valueMinLen
	 */
	public void setValueMinLen(Integer valueMinLen) {
		this.valueMinLen = valueMinLen;
	}

	/**
	 * 获取参数值数据最大长度
	 * 
	 * @return 参数值数据最大长度
	 */
	public Integer getValueMaxLen() {
		return this.valueMaxLen;
	}

	/**
	 * 设置参数值数据最大长度
	 * 
	 * @param valueMaxLen
	 */
	public void setValueMaxLen(Integer valueMaxLen) {
		this.valueMaxLen = valueMaxLen;
	}

	/**
	 * 获取参数最小值
	 * 
	 * @return 参数最小值
	 */
	public String getMinValue() {
		return this.minValue == null ? "" : this.minValue;
	}

	/**
	 * 设置参数最小值
	 * 
	 * @param minValue
	 */
	public void setMinValue(String minValue) {
		this.minValue = minValue;
	}

	/**
	 * 获取参数最大值
	 * 
	 * @return 参数最大值
	 */
	public String getMaxValue() {
		return this.maxValue == null ? "" : this.maxValue;
	}

	/**
	 * 设置参数最大值
	 * 
	 * @param maxValue
	 */
	public void setMaxValue(String maxValue) {
		this.maxValue = maxValue;
	}

	/**
	 * 获取参数权限归属(即系统哪些角色的用户可以使用),对应角色id
	 * 
	 * @return 参数权限归属(即系统哪些角色的用户可以使用),对应角色id
	 */
	public String getAuthorityRoles() {
		return this.authorityRoles == null ? "" : this.authorityRoles;
	}

	/**
	 * 设置参数权限归属(即系统哪些角色的用户可以使用),对应角色id
	 * 
	 * @param authorityRoles
	 */
	public void setAuthorityRoles(String authorityRoles) {
		this.authorityRoles = authorityRoles;
	}

	/**
	 * 获取参数告警级别
	 * 
	 * @return 参数告警级别
	 */
	public String getWarnLevel() {
		return this.warnLevel;
	}

	/**
	 * 设置参数告警级别
	 * 
	 * @param warnLevel
	 */
	public void setWarnLevel(String warnLevel) {
		this.warnLevel = warnLevel;
	}

	/**
	 * 获取
	 * 
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取
	 * 
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置
	 * 
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取参数html控件名称(text,select,radio等)
	 * 
	 * @return
	 */
	public String getHtmlElem() {
		return htmlElem;
	}

	/**
	 * 设置参数html控件名称(text,select,radio等)
	 * 
	 * @param htmlElem
	 */
	public void setHtmlElem(String htmlElem) {
		this.htmlElem = htmlElem;
	}

	/**
	 * 获取设备参数选项对应配置表(config_dict)中key值
	 * 
	 * @return
	 */
	public String getHtmlElemKey() {
		return htmlElemKey == null ? "" : this.htmlElemKey;
	}

	/**
	 * 设置设备参数选项对应配置表(config_dict)中key值
	 * 
	 * @param htmlElemKey
	 */
	public void setHtmlElemKey(String htmlElemKey) {
		this.htmlElemKey = htmlElemKey;
	}
}
