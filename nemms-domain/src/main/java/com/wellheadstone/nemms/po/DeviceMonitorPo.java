package com.wellheadstone.nemms.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 持久类
 */
public class DeviceMonitorPo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -735508049732725862L;

	/**
	 * 实体device_monitor名称
	 */
	public static String EntityName = "device_monitor";

	/**
	 * 列名id,
	 */
	public final static String Id = "id";

	/**
	 * 列名param_id,
	 */
	public final static String ParamId = "param_id";

	/**
	 * 列名value,
	 */
	public final static String Value = "value";

	/**
	 * 列名create_time,
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "id")
	private Long id;

	@Column(name = "param_id")
	private Integer paramId;

	@Column(name = "value")
	private String value;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "update_time")
	private Date updateTime;

	/**
	 * 获取
	 * 
	 * @return
	 */
	public Long getId() {
		return this.id;
	}

	/**
	 * 设置
	 * 
	 * @param id
	 */
	public void setId(Long id) {
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
	public String getValue() {
		return this.value;
	}

	/**
	 * 设置
	 * 
	 * @param value
	 */
	public void setValue(String value) {
		this.value = value;
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
