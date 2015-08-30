package com.wellheadstone.nemms.po;

import java.io.Serializable;

import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 持久类
 */
public class NmsStatusPo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 9121369669068235094L;

	/**
	 * 实体nms_status名称
	 */
	public static String EntityName = "nms_status";

	/**
	 * 列名id,配置字典ID
	 */
	public final static String Id = "id";

	/**
	 * 列名nms_name
	 */
	public final static String NmsName = "nms_name";

	/**
	 * 列名service_name
	 */
	public final static String ServiceName = "service_name";

	/**
	 * 列名service_url,
	 */
	public final static String ServiceUrl = "service_url";

	/**
	 * 列名service_status,
	 */
	public final static String ServiceStatus = "service_status";

	/**
	 * 列名update_time,
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "id", isIgnored = true)
	private Integer id;

	@Column(name = "nms_name")
	private String nmsName;

	@Column(name = "service_name")
	private String serviceName;

	@Column(name = "service_url")
	private String serviceUrl;

	@Column(name = "service_status")
	private Integer serviceStatus;

	@Column(name = "update_time")
	private String updateTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNmsName() {
		return nmsName;
	}

	public void setNmsName(String nmsName) {
		this.nmsName = nmsName;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceUrl() {
		return serviceUrl;
	}

	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}

	public Integer getServiceStatus() {
		return serviceStatus;
	}

	public void setServiceStatus(Integer serviceStatus) {
		this.serviceStatus = serviceStatus;
	}

	public String getUpdateTime() {
		return updateTime == null ? "" : updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
}
