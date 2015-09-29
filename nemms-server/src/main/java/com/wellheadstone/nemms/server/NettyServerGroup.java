package com.wellheadstone.nemms.server;

import java.util.ArrayList;
import java.util.List;

public class NettyServerGroup implements IServerGroup {
	@Override
	public List<IServer> getServers() {
		List<IServer> servers = new ArrayList<IServer>(5);
		servers.add(new MySocketIOServer());
		servers.add(new TcpServer());
		servers.add(new UDPServer());
		servers.add(new NbiTcpServer());
		return servers;
	}
}
