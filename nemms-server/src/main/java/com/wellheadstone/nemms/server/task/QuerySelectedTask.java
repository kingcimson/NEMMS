package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import com.wellheadstone.nemms.server.message.TcpUdpMessage;

public class QuerySelectedTask extends AbstractTask implements ITask {

	protected QuerySelectedTask(ChannelHandlerContext ctx, TcpUdpMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void execute() {
		// TODO Auto-generated method stub
		
	}

}
