package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.handler.socketio.SocketIOClientMap;
import com.wellheadstone.nemms.server.handler.socketio.SocketIOClientRequest;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.util.Converter;

public class SettingsTask extends AbstractTask implements ITask {
	private final static Logger logger = LoggerFactory.getLogger(SettingsTask.class);

	protected SettingsTask(ChannelHandlerContext ctx, CMCCFDSMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void execute() {
		try {
			String siteUid = Converter.getHexStringWith0X(Converter.getHexString(msg.getSiteId()));
			MessageUtils.parseDataUnit(siteUid, msg.getMcp(), msg.getPDU());

			SocketIOClientRequest request = SocketIOClientMap.get(msg.getKey());
			if (request == null) {
				logger.error("not found socketio client request object");
				return;
			}

			request.getData().setResponseText(msg.toString());
			request.getData().setRespFlag(Converter.byteToShort(msg.getRespFlag()));
			request.getClient().sendEvent(request.getEventName(), request.getData().clone());
			request.setFinished(true);

			if (request.getData().isEof()) {
				request.getData().setRequestText("无");
				request.getData().setResponseText(">>设置参数操作全部完成<<");
				request.getClient().sendEvent(request.getEventName(), request.getData());
			}
		} catch (Exception ex) {
			logger.error("set params task execute error.", ex);
		}
	}
}
