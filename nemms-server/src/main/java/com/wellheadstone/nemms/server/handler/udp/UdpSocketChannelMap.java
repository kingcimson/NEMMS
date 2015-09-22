package com.wellheadstone.nemms.server.handler.udp;

import io.netty.channel.Channel;
import io.netty.channel.socket.DatagramChannel;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class UdpSocketChannelMap {
	private static Map<String, DatagramChannel> map = new ConcurrentHashMap<String, DatagramChannel>(200);

	public static void add(String clientId, DatagramChannel socketChannel) {
		map.put(clientId, socketChannel);
	}

	public static Channel get(String clientId) {
		return map.get(clientId);
	}

	public static void remove(DatagramChannel socketChannel) {
		for (Map.Entry<String, DatagramChannel> entry : map.entrySet()) {
			if (entry.getValue() == socketChannel) {
				map.remove(entry.getKey());
			}
		}
	}
}
