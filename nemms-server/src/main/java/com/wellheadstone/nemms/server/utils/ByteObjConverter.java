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
		int length = 17 + (obj.getBody() == null ? 0 : obj.getBody().length * 4);
		ByteBuffer bb = ByteBuffer.allocate(length);
		bb.put(obj.getStartFlag());
		bb.put(obj.getAp());
		bb.put(obj.getVp());
		bb.put(Converter.getSwapOrderBytes(obj.getSiteId()));
		bb.put(obj.getDeviceId());
		bb.put(Converter.getSwapOrderBytes(obj.getPacketId()));
		bb.put(obj.getVpLayerFlag());
		bb.put(obj.getMcp());
		bb.put(obj.getCmdId());
		bb.put(obj.getRespFlag());
		bb.put(Converter.getSwapOrderBytes(obj.getBody()));
		bb.put(Converter.getSwapOrderBytes(obj.getCrc()));
		bb.put(obj.getEndFlag());
		return bb.array();
	}
}
