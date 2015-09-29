package com.wellheadstone.nemms.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
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
	private static final long serialVersionUID = -543080867482799985L;

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
	 * 列名device_ip,客户端设备IP
	 */
	public final static String DeviceIp = "device_ip";

	/**
	 * 列名device_port,客户端设备Port
	 */
	public final static String DevicePort = "device_port";

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
	 * 列名create_time,建立连接时间
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,更新连接时间
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "id", isIgnored = true)
	private Integer id;

	@Column(name = "site_uid")
	private String siteUid;

	@Column(name = "device_ip")
	private String deviceIp;

	@Column(name = "device_port")
	private Integer devicePort;

	@Column(name = "server_ip")
	private String serverIp;

	@Column(name = "server_port")
	private Integer serverPort;

	@Column(name = "status")
	private Integer status = 1;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	private Integer decUid;

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
	 * @return
	 */
	public String getDeviceIp() {
		return deviceIp;
	}

	/**
	 * 设置客户端设备IP
	 * 
	 * @param deviceIp
	 */
	public void setDeviceIp(String deviceIp) {
		this.deviceIp = deviceIp;
	}

	/**
	 * 获取客户端设备IP端口
	 * 
	 * @return
	 */
	public Integer getDevicePort() {
		return devicePort;
	}

	/**
	 * 设置客户端设备IP端口
	 * 
	 * @param devicePort
	 */
	public void setDevicePort(Integer devicePort) {
		this.devicePort = devicePort;
	}

	/**
	 * 
	 * 获取连接的服务器IP
	 * 
	 * @return
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
	 * 获取建立连接时间
	 * 
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置建立连接时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取更新连接时间
	 * 
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置更新连接时间
	 * 
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取十六制的uid对应的十进制
	 * 
	 * @return the decUid
	 */
	public Integer getDecUid() {
		String hexUid = StringUtils.substring(this.siteUid, 2, 10);
		if (StringUtils.isNotBlank(hexUid)) {
			this.decUid = Integer.valueOf(hexUid, 16);
		}
		return this.decUid;
	}

	/**
	 * 设置十六制的uid对应的十进制
	 * 
	 * @param decUid
	 *            the decUid to set
	 */
	public void setDecUid(Integer decUid) {
		this.decUid = decUid;
		this.siteUid = "0x" + String.format("%08x", this.decUid).toUpperCase();
	}
}
