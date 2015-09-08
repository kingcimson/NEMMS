package com.wellheadstone.nemms.server.message;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.util.Converter;

public class MessageUtils {

	public static TcpUdpMessage getHeartResMessage(TcpUdpMessage msg) {
		msg.setVpLayerFlag((byte) 0x00);
		msg.setRespFlag((byte) 0x00);
		return msg;
	}

	public static TcpUdpMessage getParamListReqMessage(TcpUdpMessage msg) {
		msg.setVpLayerFlag((byte) 0x80);
		msg.setRespFlag((byte) 0xff);
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
		message.setPDU(new byte[] { 0x00 });
		return message;
	}

	public static TcpUdpMessage getQuerySelectedReqMessage(SocketIOMessage data) {
		TcpUdpMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x02);
		message.setPDU(new byte[] { 0x00 });
		return message;
	}

	public static TcpUdpMessage getSetupReqMessage(SocketIOMessage data) {
		TcpUdpMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x03);
		message.setPDU(new byte[] { 0x00 });
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

	public static void parseDataUnit(String siteUid, byte mcp, byte[] pdu) {
		if (pdu == null || pdu.length < 4) {
			return;
		}

		int byteCount = mcp == 1 ? 2 : 4;
		int size = pdu.length / byteCount;
		List<DeviceDataPo> entities = new ArrayList<DeviceDataPo>(size);
		Map<String, DeviceParamPo> paramMap = ServiceFacade.getDeviceParamMap();
		for (int i = 0; i < pdu.length;) {
			int unitLength = pdu[i];
			int startIndex = i + 1;
			int endIndex = startIndex + byteCount;

			String paramUid = Converter.getReverseHexString(pdu, startIndex, endIndex);
			DeviceDataPo po = new DeviceDataPo();
			po.setSiteUid(siteUid);
			po.setParamUid(Converter.getHexStringWith0X(paramUid));
			po.setMcpId((int) mcp);
			po.setValue(MessageUtils.getParamValue(pdu, endIndex, i + unitLength,
					paramMap.get(MessageUtils.getDeviceParamKey(po.getParamUid(), mcp))));
			entities.add(po);

			i = i + unitLength;
		}
		ServiceFacade.updateParamListValue(entities);
	}

	public static String getParamValue(byte[] pdu, int startIndex, int endIndex, DeviceParamPo po) {
		if (po == null) {
			return StringUtils.EMPTY;
		}
		byte[] bytes = Arrays.copyOfRange(pdu, startIndex, endIndex);
		if (po.getValueType().equals("uint1")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return String.valueOf(Converter.getShort(src));
		}
		if (po.getValueType().equals("uint2")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 4);
			return String.valueOf(Converter.getInt(src));
		}
		if (po.getValueType().equals("uint3")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 4);
			return String.valueOf(Converter.getInt(src));
		}
		if (po.getValueType().equals("uint4")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 8);
			return String.valueOf(Converter.getLong(src));
		}
		if (po.getValueType().equals("sint1")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return String.valueOf(Converter.getShort(src));
		}
		if (po.getValueType().equals("sint2")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return String.valueOf(Converter.getShort(src));
		}
		if (po.getValueType().equals("bit")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return String.valueOf(Converter.getShort(src));
		}
		if (po.getValueType().equals("str")) {
			return new String(bytes, Charset.forName("US-ASCII"));
		}
		if (po.getValueType().equals("dstr")) {
			return getDStringValue(po.getFormat(), bytes);
		}

		return StringUtils.EMPTY;
	}

	public static byte[] getUnitBytes(int mcp, DeviceParamPo po) {
		int length = (mcp == 1) ? (3 + po.getValueLen()) : (5 + po.getValueLen());
		ByteBuffer buffer = ByteBuffer.allocate(length);
		buffer.put((byte) length);
		buffer.put(getParamIdBytes(mcp, po.getUid().trim()));
		buffer.put(Converter.getFixedLengthBytes(po.getValueLen()));
		buffer.flip();
		return buffer.array();
	}

	public static byte[] getPdu(ArrayList<Byte> list) {
		byte[] bytes = new byte[list.size()];
		for (int i = 0; i < list.size(); i++) {
			bytes[i] = list.get(i).byteValue();
		}
		return bytes;
	}

	public static void setPdu(ArrayList<Byte> list, byte[] unit) {
		for (byte b : unit) {
			list.add(b);
		}
	}

	public static byte[] getParamIdBytes(int mcp, String id) {
		if (mcp == 1) {
			return Converter.getReverseBytes(Short.valueOf(id.substring(2), 16).shortValue());
		}
		return Converter.getReverseBytes(Integer.valueOf(id.substring(2), 16).intValue());
	}

	private static byte[] getParamListPDU(byte mcp) {
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

	public static String getDeviceParamKey(String uid, int mcpId) {
		return String.format("%s-%s", uid.trim().toUpperCase(), mcpId);
	}

	public static String getDStringValue(String format, byte[] bytes) {
		if ("ip".equals(format.trim().toLowerCase())) {
			return String.format("%s.%s.%s.%s",
					Converter.byteToShort(bytes[0]),
					Converter.byteToShort(bytes[1]),
					Converter.byteToShort(bytes[2]),
					Converter.byteToShort(bytes[3]));
		}
		if ("dt".equals(format.trim().toLowerCase())) {
			return String.format("%s %s %s %s  %s:%s:%s",
					Converter.byteToShort(bytes[0]),
					Converter.byteToShort(bytes[1]),
					Converter.byteToShort(bytes[2]),
					Converter.byteToShort(bytes[3]),
					Converter.byteToShort(bytes[4]),
					Converter.byteToShort(bytes[5]),
					Converter.byteToShort(bytes[6]),
					Converter.byteToShort(bytes[7]));
		}
		return "";
	}
}
