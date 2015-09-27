package com.wellheadstone.nemms.server.util;

import java.net.SocketAddress;

public class SocketAddressUtils {
	public static String getIP(SocketAddress socketAddress) {
		if (socketAddress == null) {
			throw new NullPointerException("remoteAddres is null");
		}
		String address = socketAddress.toString();
		return address.substring(1, address.indexOf(':'));
	}

	public static Integer getPort(SocketAddress socketAddress) {
		if (socketAddress == null) {
			throw new NullPointerException("remoteAddres is null");
		}
		String address = socketAddress.toString();
		return Integer.valueOf(address.substring(address.indexOf(':') + 1));
	}
}
