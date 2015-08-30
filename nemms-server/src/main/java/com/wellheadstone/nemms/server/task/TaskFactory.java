package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import com.wellheadstone.nemms.server.message.TcpUdpMessage;

public class TaskFactory {
	
	public static ITask creator(ChannelHandlerContext ctx,TcpUdpMessage msg){
				//上报
				if(msg.getCmdId() == 0x01){
					return new HeartTask(ctx,msg);
				}
				//查询
				if(msg.getCmdId() == 0x02){
					return new GetParamListTask(ctx,msg);
				}
				//设置
				if(msg.getCmdId() == 0x03){
					return new SetupTask(ctx,msg);
				}
				
				return new DefaultTask(ctx,msg);
	}
}
