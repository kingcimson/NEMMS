package com.wellheadstone.nemms.server.task;

import com.wellheadstone.nemms.server.message.TcpUdpMessage;

import io.netty.channel.ChannelHandlerContext;

public abstract class AbstractTask {
	protected ChannelHandlerContext ctx;
	protected TcpUdpMessage msg;
	
	protected AbstractTask(ChannelHandlerContext ctx,TcpUdpMessage msg) {
		this.ctx = ctx;
		this.msg = msg;
	}
}
