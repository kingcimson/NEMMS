package com.wellheadstone.nemms.server;

import com.wellheadstone.nemms.common.util.PropertiesUtils;

public class Config {
	/**
	 * @return the serverIP
	 */
	public static String getServerIP() {
		return PropertiesUtils.getValue("nemms.server.ip").trim();
	}

	/**
	 * @return the socketIOPort
	 */
	public static int getSocketIOPort() {
		return Integer.valueOf(PropertiesUtils.getValue("nemms.server.socketio.port").trim());
	}

	/**
	 * @return the tcpPort
	 */
	public static int getTcpPort() {
		return Integer.valueOf(PropertiesUtils.getValue("nemms.server.tcp.port").trim());
	}

	/**
	 * @return the udpPort
	 */
	public static int getUdpPort() {
		return Integer.valueOf(PropertiesUtils.getValue("nemms.server.udp.port").trim());
	}

	/**
	 * @return the nbiPort
	 */
	public static int getNbiPort() {
		return Integer.valueOf(PropertiesUtils.getValue("nemms.server.nbi.port").trim());
	}
}
