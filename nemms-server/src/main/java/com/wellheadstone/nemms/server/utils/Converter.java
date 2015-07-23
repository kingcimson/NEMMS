package com.wellheadstone.nemms.server.utils;

import java.nio.ByteBuffer;

import org.apache.commons.lang3.ArrayUtils;

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

	public static byte[] getLittleEndianBytes(short x) {
		return getLittleEndianBytes(getBytes(x));
	}

	public static byte[] getLittleEndianBytes(int x) {
		return getLittleEndianBytes(getBytes(x));
	}

	public static byte[] getLittleEndianBytes(long x) {
		return getLittleEndianBytes(getBytes(x));
	}

	public static byte[] getLittleEndianBytes(byte[] src) {
		ArrayUtils.reverse(src);
		return src;
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
			stringBuilder.append(hv).append(" ");
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

	private static byte charToByte(char c) {
		return (byte) "0123456789ABCDEF".indexOf(c);
	}

	public static void main(String[] args){
		short value = 0x66f9;
		System.out.println(bytesToBit(getBytes(value)));
		System.out.println(bytesToBit(getLittleEndianBytes(value)));
	}
}
