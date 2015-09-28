package com.wellheadstone.nemms.server.handler.udp;

import io.netty.channel.Channel;
import io.netty.channel.socket.DatagramChannel;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class UdpSocketChannelMap {
	private static Map<String, DatagramChannel> map = new ConcurrentHashMap<String, DatagramChannel>(200);

	public static void add(String clientId, DatagramChannel channel) {
		map.put(clientId, channel);
	}

	public static Channel get(String key) {
		return map.get(key);
	}

	public static void remove(String key) {
		map.remove(key);
	}
}