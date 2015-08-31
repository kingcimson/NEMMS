package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.util.Converter;

public class TaskFactory {

	public static ITask creator(ChannelHandlerContext ctx, TcpUdpMessage msg) {
		// 上报
		if (msg.getCmdId() == 0x01) {
			return new HeartTask(ctx, msg);
		}
		// 查询
		if (msg.getCmdId() == 0x02) {
			// 获取全部参数列表
			if (isGetParamListCmd(msg.getMcp(), msg.getPDU())) {
				return new GetParamListTask(ctx, msg);
			}
			// 查询全部或选中参数
			return new QuerySelectedTask(ctx, msg);
		}
		// 设置
		if (msg.getCmdId() == 0x03) {
			return new SetupTask(ctx, msg);
		}

		return new DefaultTask(ctx, msg);
	}

	private static boolean isGetParamListCmd(byte mcp, byte[] pdu) {
		if (pdu == null) {
			return false;
		}

		// mcp:a 参数标识为2字节
		if (mcp == 1 && pdu.length > 4) {
			return (0x09 == Converter.getReverseShort(pdu, 1, 3));
		}
		// mcp:c 参数标识为4字节
		if (mcp == 3 && pdu.length > 7) {
			return (0x0009 == Converter.getReverseInt(pdu, 1, 5));
		}
		return false;
	}
}
