package com.wellheadstone.nemms.server.handler.udp;

import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.collection.UdpSessionMap;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.task.TaskFactory;
import com.wellheadstone.nemms.server.util.SocketAddressUtils;

public class UdpServerHandler extends IoHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(UdpServerHandler.class);

	@Override
	public void sessionCreated(IoSession session) throws Exception {
		String ip = SocketAddressUtils.getIP(session.getRemoteAddress());
		Integer port = SocketAddressUtils.getPort(session.getRemoteAddress());
		logger.info("udp device [{}:{}] is actived", ip, port);
		UdpSessionMap.add(ip, session);
	}

	@Override
	public void sessionClosed(IoSession session) throws Exception {
		String ip = SocketAddressUtils.getIP(session.getRemoteAddress());
		Integer port = SocketAddressUtils.getPort(session.getRemoteAddress());
		logger.info("udp device [{}:{}] is inactived", ip, port);
		UdpSessionMap.remove(ip);
		ServiceFacade.removeDeviceConnByIP(ip);
	}

	@Override
	public void messageReceived(IoSession session, Object message) throws Exception {
		if (message instanceof CMCCFDSMessage) {
			TaskFactory.creator(session, (CMCCFDSMessage) message).execute();
		}
	}

	@Override
	public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
		logger.info("udp exception {}:{}", session.getRemoteAddress(), cause);
	}
}
