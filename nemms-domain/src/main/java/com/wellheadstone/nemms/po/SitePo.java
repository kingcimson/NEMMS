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
public class SitePo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5904439898771651854L;

	/**
	 * 实体site名称
	 */
	public static String EntityName = "site";

	/**
	 * 列名id,
	 */
	public final static String Id = "id";

	/**
	 * 列名pid,站点父id
	 */
	public final static String Pid = "pid";

	/**
	 * 列名name,
	 */
	public final static String Name = "name";

	/**
	 * 列名uid,站点编号
	 */
	public final static String Uid = "uid";

	/**
	 * 列名has_child,
	 */
	public final static String HasChild = "has_child";

	/**
	 * 列名status,站点状态（1表示锁定，0表示编辑)
	 */
	public final static String Status = "status";

	/**
	 * 列名sequence,节点在其父节点中的顺序
	 */
	public final static String Sequence = "sequence";

	/**
	 * 列名device_no,设备编号
	 */
	public final static String DeviceNo = "device_no";

	/**
	 * 列名port,远端端口
	 */
	public final static String Port = "port";

	/**
	 * 列名device_type,设备类型
	 */
	public final static String DeviceType = "device_type";

	/**
	 * 列名manufactor,设备厂商
	 */
	public final static String Manufactor = "manufactor";

	/**
	 * 列名type,站点类型
	 */
	public final static String Type = "type";

	/**
	 * 列名protocol,协议类型
	 */
	public final static String Protocol = "protocol";

	/**
	 * 列名comment,说明备注
	 */
	public final static String Comment = "comment";

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

	@Column(name = "pid")
	private Integer pid;

	@Column(name = "name")
	private String name;

	@Column(name = "uid")
	private String uid;

	@Column(name = "has_child")
	private Byte hasChild;

	@Column(name = "status")
	private Integer status;

	@Column(name = "sequence")
	private Integer sequence;

	@Column(name = "device_no")
	private String deviceNo;

	@Column(name = "port")
	private String port;

	@Column(name = "device_type")
	private String deviceType;

	@Column(name = "manufactor")
	private String manufactor;

	@Column(name = "type")
	private String type;

	@Column(name = "protocol")
	private String protocol;

	@Column(name = "comment")
	private String comment;

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
	 * 获取站点父id
	 * 
	 * @return 站点父id
	 */
	public Integer getPid() {
		return this.pid;
	}

	/**
	 * 设置站点父id
	 * 
	 * @param pid
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}

	/**
	 * 获取
	 * 
	 * @return
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 设置
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取站点编号
	 * 
	 * @return 站点编号
	 */
	public String getUid() {
		return this.uid;
	}

	/**
	 * 设置站点编号
	 * 
	 * @param uid
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * 获取
	 * 
	 * @return
	 */
	public Byte getHasChild() {
		return this.hasChild;
	}

	/**
	 * 设置
	 * 
	 * @param hasChild
	 */
	public void setHasChild(Byte hasChild) {
		this.hasChild = hasChild;
	}

	/**
	 * 获取站点状态（1表示锁定，0表示编辑)
	 * 
	 * @return 站点状态（1表示锁定，0表示编辑)
	 */
	public Integer getStatus() {
		return this.status;
	}

	/**
	 * 设置站点状态（1表示锁定，0表示编辑)
	 * 
	 * @param status
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 获取节点在其父节点中的顺序
	 * 
	 * @return 节点在其父节点中的顺序
	 */
	public Integer getSequence() {
		return this.sequence;
	}

	/**
	 * 设置节点在其父节点中的顺序
	 * 
	 * @param sequence
	 */
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	/**
	 * 获取设备编号
	 * 
	 * @return 设备编号
	 */
	public String getDeviceNo() {
		return this.deviceNo;
	}

	/**
	 * 设置设备编号
	 * 
	 * @param deviceNo
	 */
	public void setDeviceNo(String deviceNo) {
		this.deviceNo = deviceNo;
	}

	/**
	 * 获取远端端口
	 * 
	 * @return 远端端口
	 */
	public String getPort() {
		return this.port;
	}

	/**
	 * 设置远端端口
	 * 
	 * @param port
	 */
	public void setPort(String port) {
		this.port = port;
	}

	/**
	 * 获取设备类型
	 * 
	 * @return 设备类型
	 */
	public String getDeviceType() {
		return this.deviceType;
	}

	/**
	 * 设置设备类型
	 * 
	 * @param deviceType
	 */
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	/**
	 * 获取设备厂商
	 * 
	 * @return 设备厂商
	 */
	public String getManufactor() {
		return this.manufactor;
	}

	/**
	 * 设置设备厂商
	 * 
	 * @param manufactor
	 */
	public void setManufactor(String manufactor) {
		this.manufactor = manufactor;
	}

	/**
	 * 获取站点类型
	 * 
	 * @return 站点类型
	 */
	public String getType() {
		return this.type;
	}

	/**
	 * 设置站点类型
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 获取协议类型
	 * 
	 * @return 协议类型
	 */
	public String getProtocol() {
		return this.protocol;
	}

	/**
	 * 设置协议类型
	 * 
	 * @param protocol
	 */
	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	/**
	 * 获取说明备注
	 * 
	 * @return 说明备注
	 */
	public String getComment() {
		return this.comment;
	}

	/**
	 * 设置说明备注
	 * 
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
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
