package com.wellheadstone.nemms.server.message;

import java.io.Serializable;

public class SocketIOTelnetMessage implements Serializable {
	private static final long serialVersionUID = -5122436055704695237L;
	private Integer id;
	private Integer pid = 0;
	private String uid;
	private String name;
	private String deviceType = "0";
	private String apProtocol = "0";
	private String mcpProtocol = "0";
	private String protocol = "0";
	private String manufactor = "";
	private String location = "";
	private Integer apMaxLen = 1024;
	private Short mcpMode = 0;
	private Short nc = 1;
	private Short tot1 = 30;
	private Integer tg = 1000;
	private Integer flag = 0;
	private Integer status = 0;
	private String paramUids = "";
	private String requestText = "";
	private String responseText = "";
	private String rowIds = "";
	private Short respFlag = 0;
	private boolean eof;
	private String eventName;
	private String telnetIP;
	private Integer telnetPort;
	private String telnetUser;
	private String telnetPwd;
	private String telnetCmd;
	private Long timeStamp = System.currentTimeMillis();

	/**
	 * 获取站点记录标识
	 *
	 * @return
	 */
	public Integer getId() {
		return this.id;
	}

	/**
	 * 设置站点标识
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
	 * 获取协议类型（1：tcp,2:udp,其他保留)
	 *
	 * @return 协议类型
	 */
	public String getProtocol() {
		return this.protocol == null ? "" : this.protocol;
	}

	/**
	 * 设置协议类型（1：tcp,2:udp,其他保留)
	 *
	 * @param protocol
	 */
	public void setProtocol(String protocol) {
		this.protocol = protocol;
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
		return this.apMaxLen <= 64 ? 235 : this.apMaxLen;
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
		return this.tot1 <= 0 ? 3 : this.tot1;
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
	 * 获取选中的参数uid列表
	 *
	 * @return
	 */
	public String getParamUids() {
		return paramUids == null ? "" : this.paramUids;
	}

	/**
	 * 设置选中的参数uid列表
	 *
	 * @param paramUids
	 */
	public void setParamUids(String paramUids) {
		this.paramUids = paramUids;
	}

	/**
	 * 获取请求信息
	 *
	 * @return
	 */
	public String getRequestText() {
		return requestText;
	}

	/**
	 * 设置请求信息
	 *
	 * @param requestText
	 */
	public void setRequestText(String requestText) {
		this.requestText = requestText;
	}

	/**
	 * 获取响应信息
	 *
	 * @return
	 */
	public String getResponseText() {
		return responseText;
	}

	/**
	 * 设置响应信息
	 *
	 * @param responseText
	 */
	public void setResponseText(String responseText) {
		this.responseText = responseText;
	}

	/**
	 * 获取当前参数所在界面的datagrid行中checkedbox元素id
	 *
	 * @return
	 */
	public String getRowIds() {
		return rowIds;
	}

	/**
	 * 设置当前参数所在界面的datagrid行中checkedbox元素id
	 *
	 * @param rowIds
	 */
	public void setRowIds(String rowIds) {
		this.rowIds = rowIds;
	}

	/**
	 * @return the respFlag
	 */
	public Short getRespFlag() {
		return respFlag;
	}

	/**
	 * @param respFlag
	 *            the respFlag to set
	 */
	public void setRespFlag(Short respFlag) {
		this.respFlag = respFlag;
	}

	/**
	 * 获取当前消息是否为最后一条
	 *
	 * @return the eof
	 */
	public boolean isEof() {
		return eof;
	}

	/**
	 * 设置当前消息是否为最后一条
	 *
	 * @param eof
	 *            the eof to set
	 */
	public void setEof(boolean eof) {
		this.eof = eof;
	}

	/**
	 * 获取socketio请求事件名
	 * 
	 * @return the eventName
	 */
	public String getEventName() {
		return eventName;
	}

	/**
	 * 设置socketio请求事件名
	 * 
	 * @param eventName
	 *            the eventName to set
	 */
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	/**
	 * @return the telnetIP
	 */
	public String getTelnetIP() {
		return telnetIP;
	}

	/**
	 * @param telnetIP
	 *            the telnetIP to set
	 */
	public void setTelnetIP(String telnetIP) {
		this.telnetIP = telnetIP;
	}

	/**
	 * @return the telnetPort
	 */
	public Integer getTelnetPort() {
		return telnetPort;
	}

	/**
	 * @param telnetPort
	 *            the telnetPort to set
	 */
	public void setTelnetPort(Integer telnetPort) {
		this.telnetPort = telnetPort;
	}

	/**
	 * @return the telnetUser
	 */
	public String getTelnetUser() {
		return telnetUser;
	}

	/**
	 * @param telnetUser
	 *            the telnetUser to set
	 */
	public void setTelnetUser(String telnetUser) {
		this.telnetUser = telnetUser;
	}

	/**
	 * @return the telnetPwd
	 */
	public String getTelnetPwd() {
		return telnetPwd;
	}

	/**
	 * @param telnetPwd
	 *            the telnetPwd to set
	 */
	public void setTelnetPwd(String telnetPwd) {
		this.telnetPwd = telnetPwd;
	}

	/**
	 * @return the telnetCmd
	 */
	public String getTelnetCmd() {
		return telnetCmd;
	}

	/**
	 * @param telnetCmd
	 *            the telnetCmd to set
	 */
	public void setTelnetCmd(String telnetCmd) {
		this.telnetCmd = telnetCmd;
	}

	/**
	 * 获取当前时间戳
	 *
	 * @return
	 */
	public Long getTimeStamp() {
		return timeStamp;
	}

	/**
	 * 设置当前时间戳
	 *
	 * @param timeStamp
	 */
	public void setTimeStamp(Long timeStamp) {
		this.timeStamp = timeStamp;
	}
}
