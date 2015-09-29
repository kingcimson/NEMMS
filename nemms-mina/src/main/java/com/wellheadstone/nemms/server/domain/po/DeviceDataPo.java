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
public class DeviceDataPo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -735508049732725862L;

	/**
	 * 实体device_monitor名称
	 */
	public static String EntityName = "device_data";

	/**
	 * 列名id,自增ID
	 */
	public final static String Id = "id";

	/**
	 * 列名site_uid,站点uid
	 */
	public final static String SiteUid = "site_uid";

	/**
	 * 列名param_uid,设备参数uid
	 */
	public final static String ParamUid = "param_uid";

	/**
	 * 列名mcp_id,(1:MCP_A,2:MCP_B,3:MCP_C 其他保留)
	 */
	public final static String McpId = "mcp_id";

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

	@Column(name = "id", isIgnored = true)
	private Long id;

	@Column(name = "site_uid")
	private String siteUid;

	@Column(name = "param_uid")
	private String paramUid;

	@Column(name = "mcp_id")
	private Integer mcpId;

	@Column(name = "value")
	private String value = "";

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

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
	 * 获取站点uid
	 *
	 * @return 站点uid
	 */
	public String getSiteUid() {
		return this.siteUid;
	}

	/**
	 * 设置站点Uid
	 *
	 * @param siteUid
	 */
	public void setSiteUid(String siteUid) {
		this.siteUid = siteUid;
	}

	/**
	 * 获取设备参数Uid
	 *
	 * @return 设备参数UID
	 */
	public String getParamUid() {
		return this.paramUid;
	}

	/**
	 * 设置设备参数Uid
	 *
	 * @param paramUid
	 */
	public void setParamUid(String paramUid) {
		this.paramUid = paramUid;
	}

	/**
	 * 获取参数mcp协议类型标识(1:MCP_A,2:MCP_B,3:MCP_C 其他保留)
	 *
	 * @return 1:MCP_A,2:MCP_B,3:MCP_C 其他保留
	 */
	public Integer getMcpId() {
		return mcpId;
	}

	/**
	 * 设置参数mcp协议类型标识(1:MCP_A,2:MCP_B,3:MCP_C 其他保留)
	 *
	 * @param mcpId
	 *            (1:MCP_A,2:MCP_B,3:MCP_C 其他保留)
	 */
	public void setMcpId(Integer mcpId) {
		this.mcpId = mcpId;
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
