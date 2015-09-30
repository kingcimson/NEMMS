package com.wellheadstone.nemms.server.util;

import java.nio.ByteBuffer;
import java.util.Arrays;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public class CodecUtils {
	public static CMCCFDSMessage bytesToMessage(byte[] bytes) {
		if (bytes == null || bytes.length < 17) {
			return null;
		}

		CMCCFDSMessage msg = new CMCCFDSMessage();
		msg.setStartFlag(bytes[0]);
		msg.setAp(bytes[1]);
		msg.setVp(bytes[2]);
		msg.setSiteId(Converter.getReverseInt(bytes, 3, 7));
		msg.setDeviceId(bytes[7]);
		msg.setPacketId(Converter.getReverseShort(bytes, 8, 10));
		msg.setVpLayerFlag(bytes[10]);
		msg.setMcp(bytes[11]);
		msg.setCmdId(bytes[12]);
		msg.setRespFlag(bytes[13]);
		msg.setPDU(getPDU(bytes, 14, bytes.length - 3));
		msg.setCrc(Converter.getReverseShort(bytes, bytes.length - 3, bytes.length - 1));
		msg.setEndFlag(bytes[bytes.length - 1]);

		return msg;
	}

	private static byte[] getPDU(byte[] src, int startIndex, int endIndex) {
		return Arrays.copyOfRange(src, startIndex, endIndex);
	}

	public static byte[] messageToBytes(CMCCFDSMessage msg) {
		int length = 13 + (msg.getPDU() == null ? 0 : msg.getPDU().length);
		ByteBuffer srcBuf = ByteBuffer.allocate(length);
		srcBuf.put(msg.getAp());
		srcBuf.put(msg.getVp());
		srcBuf.put(Converter.getReverseBytes(msg.getSiteId()));
		srcBuf.put(msg.getDeviceId());
		srcBuf.put(Converter.getReverseBytes(msg.getPacketId()));
		srcBuf.put(msg.getVpLayerFlag());
		srcBuf.put(msg.getMcp());
		srcBuf.put(msg.getCmdId());
		srcBuf.put(msg.getRespFlag());
		srcBuf.put(msg.getPDU());

		ByteBuffer crcBuf = ByteBuffer.allocate(srcBuf.array().length + 2);
		crcBuf.put(srcBuf.array());
		crcBuf.put(Converter.getReverseBytes(CRCUtils.getCRC16(srcBuf.array())));
		byte[] crcBytes = crcBuf.array();

		srcBuf.clear();
		crcBuf.clear();

		byte[] escapeBytes = escapeEncodeBytes(crcBytes);
		ByteBuffer byteBuf = ByteBuffer.allocate(escapeBytes.length + 2);
		byteBuf.put(msg.getStartFlag());
		byteBuf.put(escapeBytes);
		byteBuf.put(msg.getEndFlag());
		return byteBuf.array();
	}

	/**
	 * 编码转义，把0x5e转义为0x5e0x5d,把0x7e转义为0x5e0x7d
	 * 
	 * @param crcBytes
	 *            经过crc校检的字节序列
	 * @return 转义后的字节序列
	 */
	public static byte[] escapeEncodeBytes(byte[] crcBytes) {
		ByteBuffer byteBuf = ByteBuffer.allocate(getEncodeByteCount(crcBytes));
		for (byte b : crcBytes) {
			if (b == 0x5e) {
				byteBuf.put((byte) 0x5e);
				byteBuf.put((byte) 0x5d);
			} else if (b == 0x7e) {
				byteBuf.put((byte) 0x5e);
				byteBuf.put((byte) 0x7d);
			} else {
				byteBuf.put(b);
			}
		}
		return byteBuf.array();
	}

	/**
	 * 解码转义，把0x5e5d转成0x5e，把0x5e7d转义为0x7e
	 * 
	 * @param srcBytes
	 * @return 转义后的字节
	 */
	public static byte[] escapeDecodeBytes(byte[] srcBytes) {
		ByteBuffer byteBuf = ByteBuffer.allocate(getDecodeByteCount(srcBytes));
		byteBuf.put((byte) 0x7e);
		int count = srcBytes.length;
		int last2Count = count - 1;
		for (int i = 0; i < count; i++) {
			byte b1 = srcBytes[i];
			if (b1 == 0x5e && (i < last2Count)) {
				byte b2 = srcBytes[i + 1];
				if (b2 == 0x5d) {
					byteBuf.put((byte) 0x5e);
				} else if (b2 == 0x7d) {
					byteBuf.put((byte) 0x7e);
				}
				i++;
			} else {
				byteBuf.put(b1);
			}
		}
		byteBuf.put((byte) 0x7e);
		return byteBuf.array();
	}

	private static int getEncodeByteCount(byte[] bytes) {
		int count = bytes.length;
		for (byte b : bytes) {
			if (b == 0x5e || b == 0x7e) {
				count++;
			}
		}
		return count;
	}

	private static int getDecodeByteCount(byte[] bytes) {
		int count = 0;
		for (int i = 0; i < bytes.length; i++) {
			if (bytes[i] == 0x5e) {
				count++;
			}
		}
		return bytes.length + 2 - count;
	}
}
