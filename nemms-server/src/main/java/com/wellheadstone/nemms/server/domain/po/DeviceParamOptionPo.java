package com.wellheadstone.nemms.server.domain.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 持久类
 */
public class DeviceParamOptionPo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3343100368472839568L;

	/**
	 * 实体device_param_option名称
	 */
	public static String EntityName = "device_param_option";

	/**
	 * 列名id,
	 */
	public final static String Id = "id";

	/**
	 * 列名param_id,
	 */
	public final static String ParamId = "param_id";

	/**
	 * 列名param_value,
	 */
	public final static String ParamValue = "param_value";

	/**
	 * 列名param_text,
	 */
	public final static String ParamText = "param_text";

	/**
	 * 列名create_time,
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "id", isIgnored = true)
	private Integer id;

	@Column(name = "param_id")
	private Integer paramId;

	@Column(name = "param_value")
	private String paramValue;

	@Column(name = "param_text")
	private String paramText;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "update_time")
	private Date updateTime;

	/**
	 * 获取
	 * 
	 * @return
	 */
	public Integer getId() {
		return this.id;
	}

	/**
	 * 设置
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取
	 * 
	 * @return
	 */
	public Integer getParamId() {
		return this.paramId;
	}

	/**
	 * 设置
	 * 
	 * @param paramId
	 */
	public void setParamId(Integer paramId) {
		this.paramId = paramId;
	}

	/**
	 * 获取
	 * 
	 * @return
	 */
	public String getParamValue() {
		return this.paramValue;
	}

	/**
	 * 设置
	 * 
	 * @param paramValue
	 */
	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}

	/**
	 * 获取
	 * 
	 * @return
	 */
	public String getParamText() {
		return this.paramText;
	}

	/**
	 * 设置
	 * 
	 * @param paramText
	 */
	public void setParamText(String paramText) {
		this.paramText = paramText;
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
}
