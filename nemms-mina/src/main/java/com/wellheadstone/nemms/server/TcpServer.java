package com.wellheadstone.nemms.server;

import java.net.InetSocketAddress;

import org.apache.mina.core.service.IoAcceptor;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.handler.tcp.TcpCodecFactory;
import com.wellheadstone.nemms.server.handler.tcp.TcpServerHandler;

public class TcpServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(TcpServer.class);

	@Override
	public String getName() {
		return "TcpServer";
	}

	@Override
	public void start() {
		try {
			this.bind(Config.getServerIP(), Config.getTcpPort());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void bind(String ip, int port) throws Exception {
		IoAcceptor acceptor = new NioSocketAcceptor();
		acceptor.getFilterChain().addLast("codec", new ProtocolCodecFilter(new TcpCodecFactory((byte) 0x7e, 2048)));
		acceptor.setHandler(new TcpServerHandler());
		acceptor.getSessionConfig().setReadBufferSize(2048);
		acceptor.getSessionConfig().setIdleTime(IdleStatus.BOTH_IDLE, 10);
		acceptor.bind(new InetSocketAddress(ip, port));

		logger.info("TCP server started at port: {}", port);
	}
}
