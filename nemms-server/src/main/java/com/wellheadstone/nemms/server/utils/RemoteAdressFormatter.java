package com.wellheadstone.nemms.server.utils;

import java.net.SocketAddress;

public class RemoteAdressFormatter {
	public static String getIP(SocketAddress remoteAddres) {
		if (remoteAddres == null) {
			throw new NullPointerException("remoteAddres is null");
		}
		String address = remoteAddres.toString();
		return address.substring(1, address.indexOf(':'));
	}
}
