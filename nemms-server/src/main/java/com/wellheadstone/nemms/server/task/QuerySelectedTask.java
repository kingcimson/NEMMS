package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.util.Converter;

public class QuerySelectedTask extends AbstractTask implements ITask {
	private final static Logger logger = LoggerFactory.getLogger(QuerySelectedTask.class);

	protected QuerySelectedTask(ChannelHandlerContext ctx, TcpUdpMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		try {
			String siteUid = Converter.getHexStringWith0X(Converter.getHexString(msg.getSiteId()));
			logger.info(">>>获取参数列表查询完成<<<");
		} catch (Exception ex) {
			logger.error("GetParamListTask execute error.", ex);
		}
	}

}
