package com.wellheadstone.nemms.server.protocol.tcp;

public class TcpDeviceHeader {
	private byte startFlag;
	private byte ap;
	private byte vp;
	private int siteId;
	private byte deviceId;
	private short packetId;
	private byte vpLayerFlag;
	private byte mcp;
	private byte orderId;
	private byte respFlag;
	private short crc;
	private byte endFlag;
	private long[] body;

	public TcpDeviceHeader() {
	}

	public byte getStartFlag() {
		return startFlag;
	}

	public void setStartFlag(byte startFlag) {
		this.startFlag = startFlag;
	}

	public byte getAp() {
		return ap;
	}

	public void setAp(byte ap) {
		this.ap = ap;
	}

	public byte getVp() {
		return vp;
	}

	public void setVp(byte vp) {
		this.vp = vp;
	}

	public int getSiteId() {
		return siteId;
	}

	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}

	public byte getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(byte deviceId) {
		this.deviceId = deviceId;
	}

	public short getPacketId() {
		return packetId;
	}

	public void setPacketId(short packetId) {
		this.packetId = packetId;
	}

	public byte getVpLayerFlag() {
		return vpLayerFlag;
	}

	public void setVpLayerFlag(byte vpLayerFlag) {
		this.vpLayerFlag = vpLayerFlag;
	}

	public byte getMcp() {
		return mcp;
	}

	public void setMcp(byte mcp) {
		this.mcp = mcp;
	}

	public byte getOrderId() {
		return orderId;
	}

	public void setOrderId(byte orderId) {
		this.orderId = orderId;
	}

	public byte getRespFlag() {
		return respFlag;
	}

	public void setRespFlag(byte respFlag) {
		this.respFlag = respFlag;
	}

	public short getCrc() {
		return crc;
	}

	public void setCrc(short crc) {
		this.crc = crc;
	}

	public byte getEndFlag() {
		return endFlag;
	}

	public void setEndFlag(byte endFlag) {
		this.endFlag = endFlag;
	}

	public long[] getBody() {
		return body;
	}

	public void setBody(long[] body) {
		this.body = body;
	}
}
