package com.wellheadstone.nemms.server.util;

import java.nio.ByteBuffer;
import java.util.Arrays;

public class Converter {
	public static byte[] getBytes(short value) {
		ByteBuffer buffer = ByteBuffer.allocate(2);
		buffer.putShort(value);
		return buffer.array();
	}

	public static byte[] getBytes(int value) {
		ByteBuffer buffer = ByteBuffer.allocate(4);
		buffer.putInt(value);
		return buffer.array();
	}

	public static byte[] getBytes(long value) {
		ByteBuffer buffer = ByteBuffer.allocate(8);
		buffer.putLong(value);
		return buffer.array();
	}

	public static short getReverseShort(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return getShort(getReverseBytes(bytes));
	}

	public static short getReverseShort(byte[] src) {
		return getShort(getReverseBytes(src));
	}

	public static short getShort(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return getShort(bytes);
	}

	public static short getShort(byte[] bytes) {
		ByteBuffer buffer = ByteBuffer.allocate(2);
		buffer.put(bytes, 0, bytes.length);
		buffer.flip();
		return buffer.getShort();
	}

	public static int getReverseInt(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return getInt(getReverseBytes(bytes));
	}

	public static int getReverseInt(byte[] src) {
		return getInt(getReverseBytes(src));
	}

	public static int getInt(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return getInt(bytes);
	}

	public static int getInt(byte[] bytes) {
		ByteBuffer buffer = ByteBuffer.allocate(4);
		buffer.put(bytes, 0, bytes.length);
		buffer.flip();
		return buffer.getInt();
	}

	public static long getReverseLong(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return getLong(getReverseBytes(bytes));
	}

	public static long getReverseLong(byte[] src) {
		return getLong(getReverseBytes(src));
	}

	public static long getLong(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return getLong(bytes);
	}

	public static long getLong(byte[] bytes) {
		ByteBuffer buffer = ByteBuffer.allocate(8);
		buffer.put(bytes, 0, bytes.length);
		buffer.flip();
		return buffer.getLong();
	}

	public static String bytesToBit(byte[] bytes) {
		StringBuilder sb = new StringBuilder();
		for (byte b : bytes) {
			sb.append(byteToBit(b));
		}
		return sb.toString();
	}

	public static String byteToBit(byte b) {
		return "" + (byte) ((b >> 7) & 0x1) + (byte) ((b >> 6) & 0x1) + (byte) ((b >> 5) & 0x1)
				+ (byte) ((b >> 4) & 0x1) + (byte) ((b >> 3) & 0x1) + (byte) ((b >> 2) & 0x1) + (byte) ((b >> 1) & 0x1)
				+ (byte) ((b >> 0) & 0x1);
	}

	public static byte[] getReverseBytes(short x) {
		return getReverseBytes(getBytes(x));
	}

	public static byte[] getReverseBytes(int x) {
		return getReverseBytes(getBytes(x));
	}

	public static byte[] getReverseBytes(long x) {
		return getReverseBytes(getBytes(x));
	}

	public static byte[] getReverseBytes(byte[] src) {
		return getReverseBytes(src, 0, src.length);
	}

	public static byte[] getReverseBytes(byte[] src, int startIndexInclusive, int endIndexExclusive) {
		if (src == null) {
			return null;
		}

		int start = startIndexInclusive < 0 ? 0 : startIndexInclusive;
		int end = Math.min(src.length, endIndexExclusive);
		int length = end - start;
		byte[] dest = new byte[length];
		for (int i = 0; i < length; i++) {
			dest[i] = src[end - i - 1];
		}
		return dest;
	}

	public static String getHexStringWith0X(String hexStr) {
		return "0x" + hexStr;
	}

	public static String getHexString(byte src) {
		byte[] bytes = new byte[] { src };
		return bytesToHexString(bytes, "").trim();
	}

	public static String getHexString(short src) {
		byte[] bytes = getBytes(src);
		return bytesToHexString(bytes, "").trim();
	}

	public static String getHexString(int src) {
		byte[] bytes = getBytes(src);
		return bytesToHexString(bytes, "").trim();
	}

	public static String getHexString(long src) {
		byte[] bytes = getBytes(src);
		return bytesToHexString(bytes, "").trim();
	}

	public static String getHexString(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return bytesToHexString(bytes, "").trim();
	}

	public static String getReverseHexString(byte[] src, int startIndex, int endIndex) {
		byte[] bytes = Arrays.copyOfRange(src, startIndex, endIndex);
		return getReverseHexString(bytes);
	}

	public static String getReverseHexString(byte[] src) {
		byte[] bytes = getReverseBytes(src);
		return bytesToHexString(bytes, "").trim();
	}

	public static String bytesToHexString(byte[] src) {
		return bytesToHexString(src, " ");
	}

	public static String bytesToHexString(byte[] src, String space) {
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
			stringBuilder.append(hv).append(space);
		}
		return stringBuilder.toString().toUpperCase();
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

	public static byte[] getBytes(byte[] src, int length) {
		if (length <= src.length) {
			return src;
		}
		byte[] bytes = new byte[length];
		for (int i = 0; i < bytes.length; i++) {
			bytes[i] = 0;
		}
		for (int i = 0; i < src.length; i++) {
			bytes[bytes.length - 1 - i] = src[src.length - 1 - i];
		}
		return bytes;
	}

	public static byte[] getFixedLengthBytes(int length) {
		if (length <= 0) {
			return new byte[] { 0x0 };
		}
		byte[] bytes = new byte[length];
		for (int i = 0; i < bytes.length; i++) {
			bytes[i] = 0;
		}
		return bytes;
	}

	private static byte charToByte(char c) {
		return (byte) "0123456789ABCDEF".indexOf(c);
	}

	public static void main(String[] args) {
		short value = 6234;
		System.out.println(getInt(getBytes(getBytes(value), 4)));
		// System.out.println(bytesToBit(getBytes(value)));
		// System.out.println(bytesToBit(getReverseBytes(value)));
	}
}
