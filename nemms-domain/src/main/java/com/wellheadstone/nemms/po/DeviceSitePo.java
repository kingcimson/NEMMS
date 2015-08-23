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
public class DeviceSitePo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 5904439898771651854L;

	/**
	 * 实体site名称
	 */
	public static String EntityName = "device_site";

	/**
	 * 列名id,
	 */
	public final static String Id = "id";

	/**
	 * 列名pid,站点父id
	 */
	public final static String Pid = "pid";

	/**
	 * 列名uid,站点/设备编号
	 */
	public final static String Uid = "uid";

	/**
	 * 列名name,
	 */
	public final static String Name = "name";

	/**
	 * 列名device_type,设备类型
	 */
	public final static String DeviceType = "device_type";

	/**
	 * 列名ap_protocol,AP协议类型
	 */
	public final static String ApProtocol = "ap_protocol";

	/**
	 * 列名mcp_protocol,mcp协议类型
	 */
	public final static String McpProtocol = "mcp_protocol";

	/**
	 * 列名protocol,协议类型
	 */
	public final static String Protocol = "protocol";

	/**
	 * 列名ip_addr,设备ip地址
	 */
	public final static String IpAddr = "ip_addr";

	/**
	 * 列名port,远端端口
	 */
	public final static String Port = "port";

	/**
	 * 列名manufactor,设备厂商
	 */
	public final static String Manufactor = "manufactor";

	/**
	 * 列名comment,说明备注
	 */
	public final static String Comment = "comment";

	/**
	 * 列名location,设备安装地点
	 */
	public final static String Location = "location";

	/**
	 * 列名ap_max_len,ap:c协议包最大长度
	 */
	public final static String ApMaxLen = "ap_max_len";

	/**
	 * 列名mcp_mode,mcp:b交互机制
	 */
	public final static String McpMode = "mcp_mode";

	/**
	 * 列名nc,连发系数(Nc)
	 */
	public final static String Nc = "nc";

	/**
	 * 列名tot1,设备响应超时(s)
	 */
	public final static String Tot1 = "tot1";

	/**
	 * 列名tg,发送间隔时间(ms)
	 */
	public final static String Tg = "tg";

	/**
	 * 列名create_user,站点或设备创建用户
	 */
	public final static String CreateUser = "create_user";

	/**
	 * 列名flag,记录标志,0为站点，1为设备
	 */
	public final static String Flag = "flag";

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
	 * 列名path,站点树型结构路径
	 */
	public final static String Path = "path";

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
	private Integer pid = 0;

	@Column(name = "uid")
	private String uid;

	@Column(name = "name")
	private String name;

	@Column(name = "device_type")
	private String deviceType = "";

	@Column(name = "ap_protocol")
	private String apProtocol = "";

	@Column(name = "mcp_protocol")
	private String mcpProtocol = "";

	@Column(name = "protocol")
	private String protocol = "";

	@Column(name = "ip_addr")
	private String ipAddr = "";

	@Column(name = "port")
	private Integer port = 0;

	@Column(name = "manufactor")
	private String manufactor = "";

	@Column(name = "comment")
	private String comment = "";

	@Column(name = "location")
	private String location = "";

	@Column(name = "ap_max_len")
	private Integer apMaxLen = 1024;

	@Column(name = "mcp_mode")
	private Short mcpMode = 0;

	@Column(name = "nc")
	private Short nc = 1;

	@Column(name = "tot1")
	private Short tot1 = 30;

	@Column(name = "tg")
	private Integer tg = 1000;

	@Column(name = "create_user")
	private String createUser = "";

	@Column(name = "flag")
	private Integer flag = 0;

	@Column(name = "has_child")
	private Boolean hasChild = false;

	@Column(name = "status")
	private Integer status = 0;

	@Column(name = "sequence")
	private Integer sequence = 10;

	@Column(name = "path")
	private String path = "";

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	/**
	 * 获取记录标识
	 *
	 * @return
	 */
	public Integer getId() {
		return this.id;
	}

	/**
	 * 设置记录标识
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
		return this.pid == null ? 0 : this.pid;
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
	 * 获取站点/设备编号
	 *
	 * @return 站点/设备编号
	 */
	public String getUid() {
		return this.uid == null ? "" : this.uid;
	}

	/**
	 * 设置站点/设备编号
	 *
	 * @param uid
	 *            站点/设备编号
	 */
	public void setUid(String uid) {
		this.uid = uid;
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
	 * 获取设备类型
	 *
	 * @return 设备类型
	 */
	public String getDeviceType() {
		return this.deviceType == null ? "" : this.deviceType;
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
	 * 获取AP协议类型
	 *
	 * @return AP协议类型
	 */
	public String getApProtocol() {
		return this.apProtocol == null ? "" : this.apProtocol;
	}

	/**
	 * 设置AP协议类型
	 *
	 * @param apProtocol
	 */
	public void setApProtocol(String apProtocol) {
		this.apProtocol = apProtocol;
	}

	/**
	 * 获取mcp协议类型
	 *
	 * @return mcp协议类型
	 */
	public String getMcpProtocol() {
		return this.mcpProtocol == null ? "" : this.mcpProtocol;
	}

	/**
	 * 设置mcp协议类型
	 *
	 * @param mcpProtocol
	 */
	public void setMcpProtocol(String mcpProtocol) {
		this.mcpProtocol = mcpProtocol;
	}

	/**
	 * 获取协议类型
	 *
	 * @return 协议类型
	 */
	public String getProtocol() {
		return this.protocol == null ? "" : this.protocol;
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
	 * 获取设备ip地址
	 *
	 * @return 设备ip地址
	 */
	public String getIpAddr() {
		return this.ipAddr == null ? "" : this.ipAddr;
	}

	/**
	 * 设置设备ip地址
	 *
	 * @param ipAddr
	 */
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	/**
	 * 获取远端端口
	 *
	 * @return 远端端口
	 */
	public Integer getPort() {
		return this.port == null ? 0 : this.port;
	}

	/**
	 * 设置远端端口
	 *
	 * @param port
	 */
	public void setPort(Integer port) {
		this.port = port;
	}

	/**
	 * 获取设备厂商
	 *
	 * @return 设备厂商
	 */
	public String getManufactor() {
		return this.manufactor == null ? "" : this.manufactor;
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
	 * 获取说明备注
	 *
	 * @return 说明备注
	 */
	public String getComment() {
		return this.comment == null ? "" : this.comment;
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
	 * 获取设备安装地点
	 * 
	 * @return 设备安装地点
	 */
	public String getLocation() {
		return this.location;
	}

	/**
	 * 设置设备安装地点
	 * 
	 * @param location
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * 获取ap:c协议包最大长度(字节)
	 *
	 * @return ap:c协议包最大长度(字节)
	 */
	public Integer getApMaxLen() {
		return this.apMaxLen;
	}

	/**
	 * 设置ap:c协议包最大长度(字节)
	 *
	 * @param apMaxLen
	 */
	public void setApMaxLen(Integer apMaxLen) {
		this.apMaxLen = apMaxLen;
	}

	/**
	 * 获取mcp:b交互机制(0:每包确认,1:多问一答)
	 *
	 * @return mcp:b交互机制
	 */
	public Short getMcpMode() {
		return this.mcpMode;
	}

	/**
	 * 设置mcp:b交互机制(0:每包确认,1:多问一答)
	 *
	 * @param mcpMode
	 */
	public void setMcpMode(Short mcpMode) {
		this.mcpMode = mcpMode;
	}

	/**
	 * 获取连发系数(Nc)
	 *
	 * @return 连发系数(Nc)
	 */
	public Short getNc() {
		return this.nc;
	}

	/**
	 * 设置连发系数(Nc)
	 *
	 * @param nc
	 */
	public void setNc(Short nc) {
		this.nc = nc;
	}

	/**
	 * 获取设备响应超时(s)
	 *
	 * @return 设备响应超时
	 */
	public Short getTot1() {
		return this.tot1;
	}

	/**
	 * 设置设备响应超时(s)
	 *
	 * @param tot1
	 */
	public void setTot1(Short tot1) {
		this.tot1 = tot1;
	}

	/**
	 * 获取发送间隔时间（ms)
	 *
	 * @return 发送间隔时间
	 */
	public Integer getTg() {
		return this.tg;
	}

	/**
	 * 设置发送间隔时间（ms)
	 *
	 * @param tg
	 */
	public void setTg(Integer tg) {
		this.tg = tg;
	}

	/**
	 * 获取站点或设备创建用户
	 *
	 * @return 站点或设备创建用户
	 */
	public String getCreateUser() {
		return this.createUser == null ? "unknow" : this.createUser;
	}

	/**
	 * 设置站点或设备创建用户
	 *
	 * @param createUser
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * 获取记录标志,0为站点，1为设备
	 *
	 * @return 记录标志,0为站点，1为设备
	 */
	public Integer getFlag() {
		return this.flag == null ? 0 : this.flag;
	}

	/**
	 * 设置记录标志,0为站点，1为设备
	 *
	 * @param flag
	 */
	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	/**
	 * 获取是否有子节点
	 *
	 * @return
	 */
	public Boolean getHasChild() {
		return this.hasChild == null ? false : this.hasChild;
	}

	/**
	 * 设置是否有子节点
	 *
	 * @param hasChild
	 */
	public void setHasChild(Boolean hasChild) {
		this.hasChild = hasChild;
	}

	/**
	 * 获取站点状态（1表示锁定，0表示编辑)
	 *
	 * @return 站点状态（1表示锁定，0表示编辑)
	 */
	public Integer getStatus() {
		return this.status == null ? 0 : this.status;
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
		return this.sequence == null ? 10 : this.sequence;
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
	 * 获取站点树型结构路径
	 *
	 * @return 站点树型结构路径
	 */
	public String getPath() {
		return this.path == null ? "" : this.path;
	}

	/**
	 * 设置站点树型结构路径
	 *
	 * @param path
	 */
	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * 获取记录创建时间
	 *
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置记录创建时间
	 *
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取记录更新时间
	 *
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置记录更新时间
	 *
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
