package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import com.wellheadstone.nemms.server.message.TcpUdpMessage;

public abstract class AbstractTask {
	protected ChannelHandlerContext ctx;
	protected TcpUdpMessage msg;

	protected AbstractTask(ChannelHandlerContext ctx, TcpUdpMessage msg) {
		this.ctx = ctx;
		this.msg = msg;
	}
}
