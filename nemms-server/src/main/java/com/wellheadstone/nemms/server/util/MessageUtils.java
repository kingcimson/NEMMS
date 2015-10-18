package com.wellheadstone.nemms.server.util;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

public class MessageUtils {
	private final static Logger logger = LoggerFactory.getLogger(MessageUtils.class);

	public static CMCCFDSMessage getHeartResMessage(CMCCFDSMessage msg) {
		msg.setVpLayerFlag((byte) 0x00);
		msg.setRespFlag((byte) 0x00);
		return msg;
	}

	public static CMCCFDSMessage getParamListReqMessage(CMCCFDSMessage msg) {
		msg.setVpLayerFlag((byte) 0x80);
		msg.setRespFlag((byte) 0xff);
		return msg;
	}

	public static CMCCFDSMessage getParamListReqMessage(SocketIOMessage data) {
		CMCCFDSMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		byte[] pdu = Converter.getReverseBytes(MessageUtils.getParamListPDU(message.getMcp()));
		message.setCmdId((byte) 0x02);
		message.setPDU(pdu);
		return message;
	}

	public static CMCCFDSMessage getQueryAllReqMessage(SocketIOMessage data) {
		CMCCFDSMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x02);
		message.setPDU(new byte[] { 0x00 });
		return message;
	}

	public static CMCCFDSMessage getQuerySelectedReqMessage(SocketIOMessage data) {
		CMCCFDSMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x02);
		message.setPDU(new byte[] { 0x00 });
		return message;
	}

	public static CMCCFDSMessage getSetupReqMessage(SocketIOMessage data) {
		CMCCFDSMessage message = MessageUtils.SocketIOMessage2TcpUdpMessage(data);
		message.setCmdId((byte) 0x03);
		message.setPDU(new byte[] { 0x00 });
		return message;
	}

	public static CMCCFDSMessage SocketIOMessage2TcpUdpMessage(SocketIOMessage msg) {
		CMCCFDSMessage message = new CMCCFDSMessage();
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

			String paramUid = MessageUtils.getParamUid(Converter.getReverseHexString(pdu, startIndex, endIndex));
			DeviceParamPo paramPo = paramMap.get(MessageUtils.getDeviceParamKey(paramUid, mcp));
			DeviceDataPo po = new DeviceDataPo();
			po.setSiteUid(siteUid);
			po.setParamUid(paramUid);
			po.setMcpId((int) mcp);
			po.setValue(MessageUtils.getParamValue(pdu, endIndex, i + unitLength, paramPo));
			entities.add(po);

			i = i + unitLength;
		}
		ServiceFacade.updateParamListValue(entities);
	}

	public static String getParamValue(byte[] pdu, int startIndex, int endIndex, DeviceParamPo po) {
		if (po == null) {
			return "N/A";
		}
		byte[] bytes = Arrays.copyOfRange(pdu, startIndex, endIndex);
		if (po.getValueType().equals("uint1")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return getFormattedParamValue(String.valueOf(Converter.getShort(src) / po.getRatio()));
		}
		if (po.getValueType().equals("uint2")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 4);
			return getFormattedParamValue(String.valueOf(Converter.getInt(src) / po.getRatio()));
		}
		if (po.getValueType().equals("uint3")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 4);
			return getFormattedParamValue(String.valueOf(Converter.getInt(src) / po.getRatio()));
		}
		if (po.getValueType().equals("uint4")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 8);
			return getFormattedParamValue(String.valueOf(Converter.getLong(src) / po.getRatio()));
		}
		if (po.getValueType().equals("sint1")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return getFormattedParamValue(String.valueOf(Converter.getShort(src) / po.getRatio()));
		}
		if (po.getValueType().equals("sint2")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return getFormattedParamValue(String.valueOf(Converter.getShort(src) / po.getRatio()));
		}
		if (po.getValueType().equals("bit")) {
			byte[] src = Converter.getBytes(Converter.getReverseBytes(bytes), 2);
			return String.valueOf(Converter.getShort(src));
		}
		if (po.getValueType().equals("str")) {
			if (bytes[0] == 0x30) {
				return "0";
			}
			int index = ArrayUtils.indexOf(bytes, (byte) 0x00);
			if (index <= 0) {
				return "0";
			}
			return new String(Arrays.copyOfRange(bytes, 0, index), Charset.forName("ISO-8859-1"));
		}
		if (po.getValueType().equals("dstr")) {
			return getDStringValue(po.getFormat(), bytes);
		}

		return "N/A";
	}

	private static String getFormattedParamValue(String value) {
		String[] seg = StringUtils.split(value, '.');
		if (seg.length == 2) {
			return Integer.valueOf(seg[1]) > 0 ? value : seg[0];
		}
		if (seg.length == 1) {
			return seg[0];
		}
		return StringUtils.EMPTY;
	}

	public static byte[] getParamValueBytes(String value, DeviceParamPo po) {
		try {
			double ratio = po.getRatio();
			if (po.getValueType().equals("uint1")) {
				byte[] src = Converter.getShortBytes(Double.valueOf(value), ratio);
				return Converter.getReverseBytes(src, 1, 2);
			}
			if (po.getValueType().equals("uint2")) {
				byte[] src = Converter.getIntBytes(Double.valueOf(value), ratio);
				return Converter.getReverseBytes(src, 2, 4);
			}
			if (po.getValueType().equals("uint3")) {
				byte[] src = Converter.getIntBytes(Double.valueOf(value), ratio);
				return Converter.getReverseBytes(src, 1, 4);
			}
			if (po.getValueType().equals("uint4")) {
				byte[] src = Converter.getLongBytes(Double.valueOf(value), ratio);
				return Converter.getReverseBytes(src, 4, 8);
			}
			if (po.getValueType().equals("sint1")) {
				byte[] src = Converter.getShortBytes(Double.valueOf(value), ratio);
				return Converter.getReverseBytes(src, 1, 2);
			}
			if (po.getValueType().equals("sint2")) {
				byte[] src = Converter.getIntBytes(Double.valueOf(value), ratio);
				return Converter.getReverseBytes(src, 2, 4);
			}
			if (po.getValueType().equals("bit")) {
				return Converter.getReverseBytes(Byte.valueOf(value));
			}
			if (po.getValueType().equals("str")) {
				return value.getBytes("ISO-8859-1");
			}
			if (po.getValueType().equals("dstr")) {
				return getDStringValueBytes(po.getFormat(), value);
			}
		} catch (Exception e) {
			logger.error("getParamValueBytes error", e);
		}

		return null;
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

	public static byte[] getUnitBytes(int mcp, DeviceParamPo po, String value) {
		byte[] valueBytes = getParamValueBytes(value, po);
		if (valueBytes == null) {
			return null;
		}

		int length = (mcp == 1) ? (3 + po.getValueLen()) : (5 + po.getValueLen());
		ByteBuffer buffer = ByteBuffer.allocate(length);
		buffer.put((byte) length);
		buffer.put(getParamIdBytes(mcp, po.getUid().trim()));
		buffer.put(valueBytes);
		buffer.flip();
		return buffer.array();
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
		if ("ip".equals(format.trim().toLowerCase()) && bytes != null && bytes.length > 3) {
			return String.format("%s.%s.%s.%s",
					Converter.byteToShort(bytes[0]),
					Converter.byteToShort(bytes[1]),
					Converter.byteToShort(bytes[2]),
					Converter.byteToShort(bytes[3]));
		}
		if ("dt".equals(format.trim().toLowerCase()) && bytes != null && bytes.length > 6) {
			return String.format("%02x%02x%02x%02x  %02x:%02x:%02x",
					Converter.byteToShort(bytes[0]),
					Converter.byteToShort(bytes[1]),
					Converter.byteToShort(bytes[2]),
					Converter.byteToShort(bytes[3]),
					Converter.byteToShort(bytes[4]),
					Converter.byteToShort(bytes[5]),
					Converter.byteToShort(bytes[6]));
		}
		return "";
	}

	public static byte[] getDStringValueBytes(String format, String value) {
		if ("ip".equals(format.trim().toLowerCase())) {
			String[] seg = StringUtils.split(value, '.');
			if (seg == null || seg.length < 3) {
				return null;
			}
			return new byte[] {
					Short.valueOf(seg[0]).byteValue(),
					Short.valueOf(seg[1]).byteValue(),
					Short.valueOf(seg[2]).byteValue(),
					Short.valueOf(seg[3]).byteValue()
			};
		}
		if ("dt".equals(format.trim().toLowerCase())) {
			String[] seg = StringUtils.split(value, ' ');
			if (seg == null || seg.length < 2) {
				return null;
			}

			char[] date = seg[0].toCharArray();
			String[] times = StringUtils.split(seg[1], ':');
			if (date.length < 8 || times.length < 3) {
				return null;
			}
			return new byte[] {
					Byte.valueOf(String.copyValueOf(date, 0, 2), 16),
					Byte.valueOf(String.copyValueOf(date, 2, 2), 16),
					Byte.valueOf(String.copyValueOf(date, 4, 2), 16),
					Byte.valueOf(String.copyValueOf(date, 6, 2), 16),
					Byte.valueOf(times[0], 16),
					Byte.valueOf(times[1], 16),
					Byte.valueOf(times[2], 16)
			};
		}
		return null;
	}

	public static int getSiteId(String siteId) {
		if (siteId.length() < 10 || siteId.length() > 12) {
			return Integer.MAX_VALUE;
		}

		String uid = siteId.substring(2, 10);
		return Integer.valueOf(uid, 16);
	}

	public static byte getDeviceId(String siteId) {
		if (siteId.length() < 10 || siteId.length() > 12) {
			return 0;
		}

		if (siteId.length() == 10) {
			return Byte.valueOf("0");
		}

		String uid = siteId.substring(10);
		return Short.valueOf(uid, 16).byteValue();
	}

	public static String getSiteUid(CMCCFDSMessage msg) {
		String devId = Converter.getHexString(msg.getDeviceId());
		String siteUid = Converter.getHexStringWith0X(Converter.getHexString(msg.getSiteId()));
		if (devId.equals("00")) {
			return siteUid;
		}
		return siteUid + devId;
	}

	public static String getParamUid(String hexUid) {
		char[] chars = hexUid.toCharArray();
		if (chars[0] != '0') {
			chars[0] = '0';
			hexUid = new String(chars);
		}
		return Converter.getHexStringWith0X(hexUid);
	}

	public static String getParamValue(String hexUid, String value) {
		char[] chars = hexUid.toCharArray();
		if (chars[0] != '0') {
			return getErrorParamValue(chars[0]);
		}
		return value;
	}

	/**
	 * 
	 * 0：正常
	 * 1：监控数据标识无法识别。
	 * 2：监控数据的设置值超出范围。接收到此错误代码后，监控管理中心应提示“设置数据超出范围”。
	 * 3：监控数据标识与监控数据的值不符合要求，比如：非要求的ASCII码范围。
	 * 4：监控数据标识与监控数据长度不匹配。
	 * 5：监控数据的检测值低于工作范围。接收到此错误代码后，监控管理中心应显示该数据的值为“--”。
	 * 6：监控数据的检测值高于工作范围。接收到此错误代码后，监控管理中心应显示该数据的值为“++”。
	 * 7：监控数据无法检测。接收到此错误代码后，监控管理中心应显示该数据的值为“**”。
	 * 8：系统保留（厂家不能占用）。
	 * 9：未列出的其它错误。
	 * 10～15：厂家自定义（监控管理中心不作处理）。
	 */
	public static String getErrorParamValue(char errorCode) {
		if (errorCode == '5') {
			return "--";
		}
		if (errorCode == '6') {
			return "++";
		}
		if (errorCode == '7') {
			return "**";
		}
		return String.valueOf(errorCode);
	}
}
