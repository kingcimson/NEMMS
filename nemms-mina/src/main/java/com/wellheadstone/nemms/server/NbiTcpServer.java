package com.wellheadstone.nemms.server;

import java.net.InetSocketAddress;
import java.nio.charset.Charset;

import org.apache.mina.core.service.IoAcceptor;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.handler.tcp.NbiTcpServerHandler;

/**
 * 北向接口服务端
 *
 */
public class NbiTcpServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(NbiTcpServer.class);

	@Override
	public String getName() {
		return "NbiServer";
	}

	@Override
	public void start() {
		try {
			this.bind(Config.getServerIP(), Config.getNbiPort());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void bind(String ip, int port) throws Exception {
		IoAcceptor acceptor = new NioSocketAcceptor();
		acceptor.getFilterChain().addLast("codec",
				new ProtocolCodecFilter(new TextLineCodecFactory(Charset.forName("UTF-8"))));
		acceptor.setHandler(new NbiTcpServerHandler());
		acceptor.getSessionConfig().setReadBufferSize(2048);
		acceptor.bind(new InetSocketAddress(ip, port));

		logger.info("NbiTCP server started at port: {}", port);
	}
}
