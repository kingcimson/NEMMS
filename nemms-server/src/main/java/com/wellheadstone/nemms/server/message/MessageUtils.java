package com.wellheadstone.nemms.server.message;

import com.wellheadstone.nemms.server.util.Converter;

public class MessageUtils {

	public static TcpUdpMessage getHeartReqMessage(TcpUdpMessage msg) {
		msg.setVpLayerFlag((byte) 0x00);
		msg.setRespFlag((byte) 0x00);
		return msg;
	}

	public static TcpUdpMessage getParamListReqMessage(SocketIOMessage data) {
		TcpUdpMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		byte[] pdu = Converter.getReverseBytes(MessageUtils.getParamListPDU(message.getMcp()));
		message.setCmdId((byte) 0x02);
		message.setPDU(pdu);
		return message;
	}

	public static TcpUdpMessage getQueryAllReqMessage(SocketIOMessage data) {
		TcpUdpMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x02);
		message.setPDU(MessageUtils.getParamListPDU(message.getMcp()));
		return message;
	}

	public static TcpUdpMessage getQuerySelectedReqMessage(SocketIOMessage data) {
		TcpUdpMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x02);
		message.setPDU(MessageUtils.getParamListPDU(message.getMcp()));
		return message;
	}

	public static TcpUdpMessage getSetupReqMessage(SocketIOMessage data) {
		TcpUdpMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x03);
		message.setPDU(MessageUtils.getParamListPDU(message.getMcp()));
		return message;
	}

	public static TcpUdpMessage SocketIOMessage2TcpUdpMessage(SocketIOMessage msg) {
		TcpUdpMessage message = new TcpUdpMessage();
		message.setStartFlag((byte) 0x7e);
		message.setAp(Byte.valueOf(msg.getApProtocol()));
		message.setVp((byte) 0x01);
		message.setSiteId(getSiteId(msg.getUid()));
		message.setDeviceId(getDeviceId(msg.getUid()));
		message.setPacketId((short) 0x00);
		message.setVpLayerFlag((byte) 0x80);
		message.setMcp(Byte.valueOf(msg.getMcpProtocol()));
		message.setRespFlag((byte) 0xff);
		message.setEndFlag((byte) 0x7e);
		return message;
	}

	public static int getSiteId(String siteId) {
		if (siteId.length() < 10 || siteId.length() > 12) {
			return -1;
		}

		String uid = siteId.substring(2, 10);
		return Integer.valueOf(uid, 16);
	}

	public static byte getDeviceId(String siteId) {
		if (siteId.length() < 10 || siteId.length() > 12) {
			return -1;
		}

		if (siteId.length() == 10) {
			return Byte.valueOf("0");
		}

		String uid = siteId.substring(10);
		return Byte.valueOf(uid, 16);
	}

	public static byte[] getParamListPDU(byte mcp) {
		// mcp:a 参数标识为2字节
		if (mcp == 1) {
			return new byte[] { 0x01, 0x01, 0x00, 0x09, 0x05 };
		}
		// mcp:c 参数标识为4字节
		if (mcp == 3) {
			return new byte[] { 0x01, 0x01, 0x00, 0x00, 0x00, 0x09, 0x07 };
		}

		return new byte[] { 0x00 };
	}

	public static byte[] getHeartPDU(byte mcp) {
		// mcp:a 参数标识为2字节
		if (mcp == 1) {
			return new byte[] { 0x07, 0x01, 0x41, 0x04 };
		}
		// mcp:c 参数标识为4字节
		if (mcp == 3) {
			return new byte[] { 0x07, 0x01, 0x41, 0x00, 0x00, 0x05 };
		}

		return new byte[] { 0x00 };
	}
}
