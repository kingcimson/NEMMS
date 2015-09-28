package com.wellheadstone.nemms.server;

import java.util.ArrayList;
import java.util.List;

public class MinaServerGroup implements IServerGroup {
	@Override
	public List<IServer> getServers() {
		List<IServer> servers = new ArrayList<IServer>(4);
		servers.add(new MySocketIOServer());
		servers.add(new TcpServer());
		return servers;
	}

}
