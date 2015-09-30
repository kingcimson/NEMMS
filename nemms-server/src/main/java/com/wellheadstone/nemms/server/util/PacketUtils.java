package com.wellheadstone.nemms.server.util;

public class PacketUtils {
	public static String validRespFlag(byte respFlag) {
		if (respFlag == 0x00 || respFlag == 0xff) {
			return "正常";
		}
		return "异常";
	}
}
