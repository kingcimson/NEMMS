package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public class DefaultTask extends AbstractTask implements ITask {

	private final static Logger logger = LoggerFactory.getLogger(DefaultTask.class);

	protected DefaultTask(ChannelHandlerContext ctx, CMCCFDSMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		logger.warn("this is default task.");
	}

}
