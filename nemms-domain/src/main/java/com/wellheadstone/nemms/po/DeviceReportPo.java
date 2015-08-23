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
public class DeviceReportPo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 8701410819980596051L;

	/**
	 * 实体device_report名称
	 */
	public static String EntityName = "device_report";

	/**
	 * 列名id,
	 */
	public final static String Id = "id";

	/**
	 * 列名site_uid,站点/设备编号
	 */
	public final static String SiteUid = "site_uid";

	/**
	 * 列名type,上报类型
	 */
	public final static String Type = "type";

	/**
	 * 列名content,上报内容
	 */
	public final static String Content = "content";

	/**
	 * 列名create_time,上报时间
	 */
	public final static String CreateTime = "create_time";

	@Column(name = "id", isIgnored = true)
	private Integer id;

	@Column(name = "site_uid")
	private String siteUid;

	@Column(name = "type")
	private Integer type;

	@Column(name = "content")
	private String content;

	@Column(name = "create_time")
	private Date createTime;

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
	 * 获取站点/设备编号
	 * 
	 * @return 站点/设备编号
	 */
	public String getSiteUid() {
		return this.siteUid;
	}

	/**
	 * 设置站点/设备编号
	 * 
	 * @param siteUid
	 */
	public void setSiteUid(String siteUid) {
		this.siteUid = siteUid;
	}

	/**
	 * 获取上报类型
	 * 
	 * @return 上报类型
	 */
	public Integer getType() {
		return this.type;
	}

	/**
	 * 设置上报类型
	 * 
	 * @param type
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 获取上报内容
	 * 
	 * @return 上报内容
	 */
	public String getContent() {
		return this.content;
	}

	/**
	 * 设置上报内容
	 * 
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 获取上报时间
	 * 
	 * @return 上报时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置上报时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
