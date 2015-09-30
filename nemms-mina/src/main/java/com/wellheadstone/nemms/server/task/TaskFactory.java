package com.wellheadstone.nemms.server.task;

import org.apache.mina.core.session.IoSession;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.Converter;

public class TaskFactory {

	public static ITask creator(IoSession session, CMCCFDSMessage msg) {
		// 上报
		if (msg.getCmdId() == 0x01) {
			return new HeartTask(session, msg);
		}
		// 查询
		if (msg.getCmdId() == 0x02) {
			// 获取全部参数列表
			if (isGetParamListCmd(msg.getMcp(), msg.getPDU())) {
				return new GetParamListTask(session, msg);
			}
			// 查询全部或选中参数
			return new QuerySelectedTask(session, msg);
		}
		// 设置
		if (msg.getCmdId() == 0x03) {
			return new SettingsTask(session, msg);
		}

		return new DefaultTask(session, msg);
	}

	private static boolean isGetParamListCmd(byte mcp, byte[] pdu) {
		if (pdu == null) {
			return false;
		}

		// mcp:a 参数标识为2字节
		if (mcp == 1 && pdu.length >= 4) {
			return (0x09 == Converter.getReverseShort(pdu, 1, 3));
		}
		// mcp:c 参数标识为4字节
		if (mcp == 3 && pdu.length >= 7) {
			return (0x0009 == Converter.getReverseInt(pdu, 1, 5));
		}
		return false;
	}
}
