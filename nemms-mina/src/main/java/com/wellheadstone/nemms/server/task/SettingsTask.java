package com.wellheadstone.nemms.server.task;

import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.collection.SocketIOClientMap;
import com.wellheadstone.nemms.server.handler.socketio.SocketIOClientRequest;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.MessageUtils;
import com.wellheadstone.nemms.server.util.SocketIOClientUtils;

public class SettingsTask extends AbstractTask implements ITask {
	private final static Logger logger = LoggerFactory.getLogger(SettingsTask.class);

	protected SettingsTask(IoSession session, CMCCFDSMessage msg) {
		super(session, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		try {
			String siteUid = MessageUtils.getSiteUid(msg);
			MessageUtils.parseDataUnit(siteUid, msg.getMcp(), msg.getPDU());

			SocketIOClientRequest request = SocketIOClientMap.get(msg.getKey());
			request.getData().setResponseText(msg.toString());
			request.getData().setRespFlag(Converter.byteToShort(msg.getRespFlag()));
			request.setFinished(true);
		} catch (Exception ex) {
			logger.error("set params task execute error.", ex);
			SocketIOClientUtils.setErrorResponse(this.msg, "解析响应数据时发生程序异常");
		}
	}
}
