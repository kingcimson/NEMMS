package com.wellheadstone.nemms.server.handler.tcp;

import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.collection.TcpSessionMap;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.task.TaskFactory;
import com.wellheadstone.nemms.server.util.SocketAddressUtils;

public class TcpServerHandler extends IoHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(TcpServerHandler.class);

	@Override
	public void sessionCreated(IoSession session) throws Exception {
		String ip = SocketAddressUtils.getIP(session.getRemoteAddress());
		Integer port = SocketAddressUtils.getPort(session.getRemoteAddress());
		logger.info("tcp device [{}:{}] is actived", ip, port);
		session.getConfig().setUseReadOperation(true);
		TcpSessionMap.add(ip, session);
	}

	@Override
	public void sessionClosed(IoSession session) throws Exception {
		String ip = SocketAddressUtils.getIP(session.getRemoteAddress());
		Integer port = SocketAddressUtils.getPort(session.getRemoteAddress());
		logger.info("tcp device [{}:{}] is inactived", ip, port);
		TcpSessionMap.remove(ip);
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
		logger.error("tcp exception {}:{}", session.getRemoteAddress(), cause);
	}
}
