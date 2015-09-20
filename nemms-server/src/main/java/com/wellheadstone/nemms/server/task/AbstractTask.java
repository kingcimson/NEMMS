package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public abstract class AbstractTask {
	protected ChannelHandlerContext ctx;
	protected CMCCFDSMessage msg;

	protected AbstractTask(ChannelHandlerContext ctx, CMCCFDSMessage msg) {
		this.ctx = ctx;
		this.msg = msg;
	}
}
