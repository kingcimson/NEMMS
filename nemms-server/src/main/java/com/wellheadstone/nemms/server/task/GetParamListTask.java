package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.util.Converter;

public class GetParamListTask extends AbstractTask implements ITask {

	protected GetParamListTask(ChannelHandlerContext ctx, TcpUdpMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void execute() {
		Converter.getHexStringWith0X(Converter.getHexString(msg.getSiteId()));
		ctx.channel().writeAndFlush(MessageUtils.getParamListReqMessage(msg));
	}
}
