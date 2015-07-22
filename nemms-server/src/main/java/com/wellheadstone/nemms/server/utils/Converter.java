package com.wellheadstone.nemms.server.utils;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class Converter {
	public static byte[] getBytes(short value) {
		ByteBuffer buffer = ByteBuffer.allocate(2).order(ByteOrder.nativeOrder());
		buffer.putShort(value);
		return buffer.array();
	}

	public static byte[] getBytes(int value) {
		ByteBuffer buffer = ByteBuffer.allocate(4).order(ByteOrder.nativeOrder());
		buffer.putInt(value);
		return buffer.array();
	}

	public static byte[] getBytes(long value) {
		ByteBuffer buffer = ByteBuffer.allocate(8).order(ByteOrder.nativeOrder());
		buffer.putLong(value);
		return buffer.array();
	}

	public static String byteToBit(byte b) {
		return ""
				+ (byte) ((b >> 7) & 0x1) + (byte) ((b >> 6) & 0x1)
				+ (byte) ((b >> 5) & 0x1) + (byte) ((b >> 4) & 0x1)
				+ (byte) ((b >> 3) & 0x1) + (byte) ((b >> 2) & 0x1)
				+ (byte) ((b >> 1) & 0x1) + (byte) ((b >> 0) & 0x1);
	}

	public static byte[] getSwapOrderBytes(int[] x) {
		int capacity = x.length * 4;
		ByteBuffer buffer = ByteBuffer.allocate(capacity).order(ByteOrder.nativeOrder());
		for (int i = 0; i < x.length; i++) {
			buffer.put(getSwapOrderBytes(getBytes(x[i])));
		}
		return buffer.array();
	}

	public static byte[] getSwapOrderBytes(short x) {
		return getSwapOrderBytes(getBytes(x));
	}

	public static byte[] getSwapOrderBytes(int x) {
		return getSwapOrderBytes(getBytes(x));
	}

	public static byte[] getSwapOrderBytes(long x) {
		return getSwapOrderBytes(getBytes(x));
	}

	public static byte[] getSwapOrderBytes(byte[] src) {
		for (int i = 0; i < src.length; i++) {
			src[i] = getSwapOrderByte(src[i]);
		}
		return src;
	}

	public static byte getSwapOrderByte(byte x) {
		return (byte) (((x & 0XF0) >> 4) + ((x & 0XF) << 4));
	}

	public static String bytesToHexString(byte[] src) {
		StringBuilder stringBuilder = new StringBuilder("");
		if (src == null || src.length <= 0) {
			return null;
		}
		for (int i = 0; i < src.length; i++) {
			int v = src[i] & 0xFF;
			String hv = Integer.toHexString(v);
			if (hv.length() < 2) {
				stringBuilder.append(0);
			}
			stringBuilder.append(hv);
		}
		return stringBuilder.toString();
	}

	public static byte[] hexStringToBytes(String hexString) {
		if (hexString == null || hexString.equals("")) {
			return null;
		}
		hexString = hexString.toUpperCase();
		int length = hexString.length() / 2;
		char[] hexChars = hexString.toCharArray();
		byte[] d = new byte[length];
		for (int i = 0; i < length; i++) {
			int pos = i * 2;
			d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));
		}
		return d;
	}

	private static byte charToByte(char c) {
		return (byte) "0123456789ABCDEF".indexOf(c);
	}

}
