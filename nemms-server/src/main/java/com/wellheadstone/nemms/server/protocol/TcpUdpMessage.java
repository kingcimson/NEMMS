package com.wellheadstone.nemms.server.protocol;

import java.io.Serializable;

import com.wellheadstone.nemms.server.utils.ByteObjConverter;
import com.wellheadstone.nemms.server.utils.Converter;

public class TcpUdpMessage implements Serializable {
	private static final long serialVersionUID = 7625190637270731504L;
	private byte startFlag;// 起始标志
	private byte ap;// ap层办议类型
	private byte vp;// 承载协议类型
	private int siteId;// 地址单元 组成部分1:站点编号,多字节倒序
	private byte deviceId;// 地址单元 组成部分2:设备编号
	private short packetId;// 通信包标识号
	private byte vpLayerFlag;// vp层协议标识
	private byte mcp;// mcp层协议标识
	private byte cmdId;// 命令标识
	private byte respFlag;// 应答标志
	private byte[] pdu;// 监控数据单元(多字节倒例)
	private short crc;// CRC校验单元 2字节倒序
	private byte endFlag;// 结束标志

	public TcpUdpMessage() {
	}

	/**
	 * 
	 * @return
	 */
	public byte getStartFlag() {
		return startFlag;
	}

	/**
	 * 
	 * @param startFlag
	 */
	public void setStartFlag(byte startFlag) {
		this.startFlag = startFlag;
	}

	/**
	 * 
	 * @return
	 */
	public byte getAp() {
		return ap;
	}

	/**
	 * 
	 * @param ap
	 */
	public void setAp(byte ap) {
		this.ap = ap;
	}

	/**
	 * 
	 * @return
	 */
	public byte getVp() {
		return vp;
	}

	/**
	 * 
	 * @param vp
	 */
	public void setVp(byte vp) {
		this.vp = vp;
	}

	/**
	 * 
	 * @return
	 */
	public int getSiteId() {
		return siteId;
	}

	/**
	 * 
	 * @param siteId
	 */
	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}

	/**
	 * 
	 * @return
	 */
	public byte getDeviceId() {
		return deviceId;
	}

	/**
	 * 
	 * @param deviceId
	 */
	public void setDeviceId(byte deviceId) {
		this.deviceId = deviceId;
	}

	/**
	 * 
	 * @return
	 */
	public short getPacketId() {
		return packetId;
	}

	/**
	 * 
	 * @param packetId
	 */
	public void setPacketId(short packetId) {
		this.packetId = packetId;
	}

	/**
	 * 
	 * @return
	 */
	public byte getVpLayerFlag() {
		return vpLayerFlag;
	}

	/**
	 * 
	 * @param vpLayerFlag
	 */
	public void setVpLayerFlag(byte vpLayerFlag) {
		this.vpLayerFlag = vpLayerFlag;
	}

	/**
	 * 
	 * @return
	 */
	public byte getMcp() {
		return mcp;
	}

	/**
	 * 
	 * @param mcp
	 */
	public void setMcp(byte mcp) {
		this.mcp = mcp;
	}

	/**
	 * 
	 * @return
	 */
	public byte getCmdId() {
		return cmdId;
	}

	/**
	 * 
	 * @param cmdId
	 */
	public void setCmdId(byte cmdId) {
		this.cmdId = cmdId;
	}

	/**
	 * 
	 * @return
	 */
	public byte getRespFlag() {
		return respFlag;
	}

	/**
	 * 
	 * @param respFlag
	 */
	public void setRespFlag(byte respFlag) {
		this.respFlag = respFlag;
	}

	/**
	 * 
	 * @return
	 */
	public byte[] getPDU() {
		return pdu;
	}

	/**
	 * 
	 * @param pdu
	 */
	public void setPDU(byte[] pdu) {
		this.pdu = pdu;
	}

	/**
	 * 
	 * @return
	 */
	public short getCrc() {
		return crc;
	}

	/**
	 * 
	 * @param crc
	 */
	public void setCrc(short crc) {
		this.crc = crc;
	}

	/**
	 * 
	 * @return
	 */
	public byte getEndFlag() {
		return endFlag;
	}

	/**
	 * 
	 * @param endFlag
	 */
	public void setEndFlag(byte endFlag) {
		this.endFlag = endFlag;
	}

	@Override
	public String toString() {
		return Converter.bytesToHexString(ByteObjConverter.objectToBytes(this));
	}
}
