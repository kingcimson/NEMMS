package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.util.Converter;

public class SettingsTask extends AbstractTask implements ITask {
	private final static Logger logger = LoggerFactory.getLogger(SettingsTask.class);

	protected SettingsTask(ChannelHandlerContext ctx, TcpUdpMessage msg) {
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
		} catch (Exception ex) {
			logger.error("SettingsTask execute error.", ex);
		}
	}
}
