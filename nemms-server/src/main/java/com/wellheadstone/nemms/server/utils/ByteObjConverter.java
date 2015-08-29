package com.wellheadstone.nemms.server.utils;

import java.nio.ByteBuffer;

import com.wellheadstone.nemms.server.protocol.TcpUdpMessage;

public class ByteObjConverter {
	public static TcpUdpMessage bytesToObject(byte[] bytes) {
		if (bytes == null || bytes.length < 17) {
			return null;
		}

		TcpUdpMessage obj = new TcpUdpMessage();
		obj.setStartFlag(bytes[0]);
		obj.setAp(bytes[1]);
		obj.setVp(bytes[2]);
		obj.setSiteId(bytes[0]);
		obj.setDeviceId(bytes[7]);
		obj.setPacketId(bytes[0]);
		return obj;
	}

	public static byte[] objectToBytes(TcpUdpMessage obj) {
		int length = 13 + (obj.getPDU() == null ? 0 : obj.getPDU().length);
		ByteBuffer srcBuf = ByteBuffer.allocate(length);
		srcBuf.put(obj.getAp());
		srcBuf.put(obj.getVp());
		srcBuf.put(Converter.getReverseBytes(obj.getSiteId()));
		srcBuf.put(obj.getDeviceId());
		srcBuf.put(Converter.getReverseBytes(obj.getPacketId()));
		srcBuf.put(obj.getVpLayerFlag());
		srcBuf.put(obj.getMcp());
		srcBuf.put(obj.getCmdId());
		srcBuf.put(obj.getRespFlag());
		srcBuf.put(Converter.getReverseBytes(obj.getPDU()));

		ByteBuffer crcBuf = ByteBuffer.allocate(srcBuf.array().length + 2);
		crcBuf.put(srcBuf.array());
		crcBuf.put(Converter.getReverseBytes(CRC16.getCRC(srcBuf.array())));
		byte[] crcBytes = crcBuf.array();

		srcBuf.clear();
		crcBuf.clear();

		byte[] escapeBytes = escapeEncodeBytes(crcBytes);
		ByteBuffer byteBuf = ByteBuffer.allocate(escapeBytes.length + 2);
		byteBuf.put(obj.getStartFlag());
		byteBuf.put(escapeBytes);
		byteBuf.put(obj.getEndFlag());
		return byteBuf.array();
	}

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

	public static byte[] escapeDecodeBytes(byte[] srcBytes) {
		ByteBuffer byteBuf = ByteBuffer.allocate(getDecodeByteCount(srcBytes));
		for (byte b : srcBytes) {
		}
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
		return 0;
	}
}
