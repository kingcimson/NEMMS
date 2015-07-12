package com.wellheadstone.nemms.server.domain.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

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
	 * 列名id,自增ID
	 */
	public final static String Id = "id";

	/**
	 * 列名site_id,站点id
	 */
	public final static String SiteId = "site_id";

	/**
	 * 列名param_id,设备参数ID
	 */
	public final static String ParamId = "param_id";

	/**
	 * 列名value,监控值
	 */
	public final static String Value = "value";

	/**
	 * 列名create_time,监控时间
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,监控更新时间
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "id")
	private Long id;

	@Column(name = "site_id")
	private Integer siteId;

	@Column(name = "param_id")
	private Integer paramId;

	@Column(name = "value")
	private String value;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "update_time")
	private Date updateTime;

	/**
	 * 获取自增ID
	 * 
	 * @return 自增ID
	 */
	public Long getId() {
		return this.id;
	}

	/**
	 * 设置自增ID
	 * 
	 * @param id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 获取站点id
	 * 
	 * @return 站点id
	 */
	public Integer getSiteId() {
		return this.siteId;
	}

	/**
	 * 设置站点id
	 * 
	 * @param siteId
	 */
	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	/**
	 * 获取设备参数ID
	 * 
	 * @return 设备参数ID
	 */
	public Integer getParamId() {
		return this.paramId;
	}

	/**
	 * 设置设备参数ID
	 * 
	 * @param paramId
	 */
	public void setParamId(Integer paramId) {
		this.paramId = paramId;
	}

	/**
	 * 获取监控值
	 * 
	 * @return 监控值
	 */
	public String getValue() {
		return this.value;
	}

	/**
	 * 设置监控值
	 * 
	 * @param value
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * 获取监控时间
	 * 
	 * @return 监控时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置监控时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取监控更新时间
	 * 
	 * @return 监控更新时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置监控更新时间
	 * 
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
