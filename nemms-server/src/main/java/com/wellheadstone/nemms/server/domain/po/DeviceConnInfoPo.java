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
public class DeviceConnInfoPo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -5386843424285389784L;

	/**
	 * 实体device_conn_info名称
	 */
	public static String EntityName = "device_conn_info";

	/**
	 * 列名id,
	 */
	public final static String Id = "id";

	/**
	 * 列名site_uid,站点与设备唯一编号（十六进制)
	 */
	public final static String SiteUid = "site_uid";

	/**
	 * 列名client_ip,客户端设备IP
	 */
	public final static String ClientIp = "client_ip";

	/**
	 * 列名server_ip,连接的服务器IP
	 */
	public final static String ServerIp = "server_ip";

	/**
	 * 列名server_port,连接的服务器端口
	 */
	public final static String ServerPort = "server_port";

	/**
	 * 列名status,当前连接状态
	 */
	public final static String Status = "status";

	/**
	 * 列名startTime,连接时间
	 */
	public final static String StartTime = "startTime";

	/**
	 * 列名heartTime,上次心跳时间
	 */
	public final static String HeartTime = "heartTime";

	@Column(name = "id")
	private Integer id;

	@Column(name = "site_uid")
	private String siteUid;

	@Column(name = "client_ip")
	private String clientIp;

	@Column(name = "server_ip")
	private String serverIp;

	@Column(name = "server_port")
	private Integer serverPort;

	@Column(name = "status")
	private Integer status = 1;

	@Column(name = "startTime")
	private Date startTime = Calendar.getInstance().getTime();

	@Column(name = "heartTime")
	private Date heartTime = Calendar.getInstance().getTime();

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
	 * 获取站点与设备唯一编号（十六进制)
	 *
	 * @return 站点与设备唯一编号（十六进制)
	 */
	public String getSiteUid() {
		return this.siteUid;
	}

	/**
	 * 设置站点与设备唯一编号（十六进制)
	 *
	 * @param siteUid
	 */
	public void setSiteUid(String siteUid) {
		this.siteUid = siteUid;
	}

	/**
	 * 获取客户端设备IP
	 *
	 * @return 客户端设备IP
	 */
	public String getClientIp() {
		return this.clientIp;
	}

	/**
	 * 设置客户端设备IP
	 *
	 * @param clientIp
	 */
	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	/**
	 * 获取连接的服务器IP
	 *
	 * @return 连接的服务器IP
	 */
	public String getServerIp() {
		return this.serverIp;
	}

	/**
	 * 设置连接的服务器IP
	 *
	 * @param serverIp
	 */
	public void setServerIp(String serverIp) {
		this.serverIp = serverIp;
	}

	/**
	 * 获取连接的服务器端口
	 *
	 * @return 连接的服务器端口
	 */
	public Integer getServerPort() {
		return this.serverPort;
	}

	/**
	 * 设置连接的服务器端口
	 *
	 * @param serverPort
	 */
	public void setServerPort(Integer serverPort) {
		this.serverPort = serverPort;
	}

	/**
	 * 获取当前连接状态
	 *
	 * @return 当前连接状态
	 */
	public Integer getStatus() {
		return this.status;
	}

	/**
	 * 设置当前连接状态
	 *
	 * @param status
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 获取连接时间
	 *
	 * @return 连接时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getStartTime() {
		return startTime == null ? Calendar.getInstance().getTime() : startTime;
	}

	/**
	 * 设置连接时间
	 *
	 * @param startTime
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * 获取上次心跳时间
	 *
	 * @return 上次心跳时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getHeartTime() {
		return heartTime == null ? Calendar.getInstance().getTime() : heartTime;
	}

	/**
	 * 设置上次心跳时间
	 *
	 * @param heartTime
	 */
	public void setHeartTime(Date heartTime) {
		this.heartTime = heartTime;
	}
}
