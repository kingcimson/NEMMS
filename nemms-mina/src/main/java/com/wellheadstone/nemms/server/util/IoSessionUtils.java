package com.wellheadstone.nemms.server.util;

import java.util.concurrent.TimeUnit;

import org.apache.mina.core.future.ReadFuture;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

public class IoSessionUtils {
	private final static Logger logger = LoggerFactory.getLogger(IoSessionUtils.class);

	public static CMCCFDSMessage writeAndRead(IoSession session, SocketIOMessage data, CMCCFDSMessage reqMsg) {
		try {
			data.setRequestText(reqMsg.toString());
			session.write(reqMsg).awaitUninterruptibly();
			ReadFuture readFuture = session.read();
			if (readFuture.awaitUninterruptibly(5, TimeUnit.SECONDS)) {
				CMCCFDSMessage resMsg = (CMCCFDSMessage) readFuture.getMessage();
				data.setResponseText(resMsg.toString());
				return resMsg;
			}
		} catch (Exception ex) {
			logger.info("error:{}", ex);
		}
		data.setResponseText("数据接收失败");
		return null;
	}
}
