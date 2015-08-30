package com.wellheadstone.nemms.server.util;

import java.net.SocketAddress;

public class RemoteAdressFormatter {
	public static String getIP(SocketAddress remoteAddres) {
		if (remoteAddres == null) {
			throw new NullPointerException("remoteAddres is null");
		}
		String address = remoteAddres.toString();
		return address.substring(1, address.indexOf(':'));
	}

	public static Integer getPort(SocketAddress remoteAddres) {
		if (remoteAddres == null) {
			throw new NullPointerException("remoteAddres is null");
		}
		String address = remoteAddres.toString();
		return Integer.valueOf(address.substring(address.indexOf(':') + 1));
	}
}
