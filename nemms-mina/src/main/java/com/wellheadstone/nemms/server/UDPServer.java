package com.wellheadstone.nemms.server;

import java.net.InetSocketAddress;

import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.transport.socket.nio.NioDatagramAcceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.handler.udp.UdpCodecFactory;
import com.wellheadstone.nemms.server.handler.udp.UdpServerHandler;

public class UDPServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(UDPServer.class);

	@Override
	public String getName() {
		return "UDPServer";
	}

	@Override
	public void start() {
		try {
			this.bind(Config.getServerIP(), Config.getUdpPort());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void bind(String ip, int port) throws Exception {
		NioDatagramAcceptor acceptor = new NioDatagramAcceptor();
		acceptor.getFilterChain().addLast("codec", new ProtocolCodecFilter(new UdpCodecFactory((byte) 0x7e, 2048)));
		acceptor.setHandler(new UdpServerHandler());
		acceptor.getSessionConfig().setReuseAddress(true);
		acceptor.getSessionConfig().setReadBufferSize(2048);
		acceptor.getSessionConfig().setIdleTime(IdleStatus.BOTH_IDLE, 120);
		acceptor.bind(new InetSocketAddress(ip, port));

		logger.info("UDP server started at port: {}", port);
	}
}
