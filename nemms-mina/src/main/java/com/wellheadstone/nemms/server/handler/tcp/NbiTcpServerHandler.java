package com.wellheadstone.nemms.server.handler.tcp;

import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.util.SocketAddressUtils;

public class NbiTcpServerHandler extends IoHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(NbiTcpServerHandler.class);

	@Override
	public void sessionCreated(IoSession session) throws Exception {
		String ip = SocketAddressUtils.getIP(session.getRemoteAddress());
		Integer port = SocketAddressUtils.getPort(session.getRemoteAddress());
		logger.info("nbi device [{}:{}] is actived", ip, port);
		session.getConfig().setUseReadOperation(true);
		TcpSessionMap.add("nbi", session);
	}

	@Override
	public void sessionClosed(IoSession session) throws Exception {
		String ip = SocketAddressUtils.getIP(session.getRemoteAddress());
		Integer port = SocketAddressUtils.getPort(session.getRemoteAddress());
		logger.info("nbi device [{}:{}] is inactived", ip, port);
		TcpSessionMap.remove("nbi");
		ServiceFacade.removeDeviceConnByIP(ip);
	}

	@Override
	public void messageReceived(IoSession session, Object message) throws Exception {
		logger.info("receive from nbi device [{}] data:{}", session.getRemoteAddress(), message);
	}

	@Override
	public void sessionIdle(IoSession session, IdleStatus status) throws Exception {
		logger.info("nbi idle :{}" + session.getIdleCount(status));
	}

	@Override
	public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
		logger.info("tcp exception {}:{}", session.getRemoteAddress(), cause);
	}

}
