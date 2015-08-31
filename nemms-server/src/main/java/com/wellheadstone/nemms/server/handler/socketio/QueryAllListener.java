package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.socket.SocketChannel;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.RemoteAdressFormatter;

public class QueryAllListener implements DataListener<SocketIOMessage> {
	private final static Logger logger = LoggerFactory.getLogger(QueryAllListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(client.getRemoteAddress());
		SocketIOClientMap.add(clientIP, client);

		TcpUdpMessage message = MessageUtils.getQueryAllReqMessage(data);
		data.setRequestText(message.toString());

		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			data.setResponseText("未找到当前站点与设备的连接服务器ip与port.");
		} else {
			SocketChannel channel = (SocketChannel) TcpSocketChannelMap.get(connInfo.getClientIp());
			if (channel == null) {
				data.setRequestText("未找到当前站点或设备的连接通道.");
			} else {
				this.sendMessage(channel, data, message);
			}
		}

		data.setEventName(EventName.QueryALL);
		client.sendEvent(data.getEventName(), data);
	}

	private void sendMessage(SocketChannel channel, SocketIOMessage data, TcpUdpMessage message) {
		try {
			String[] paramIdList = StringUtils.split(data.getParamUids(), ',');
			Map<String, DeviceParamPo> paramMap = ServiceFacade.getParamList(message.getMcp());
			ArrayList<Byte> list = new ArrayList<Byte>(235);
			for (int i = 0; i < paramIdList.length; i++) {
				String paramId = paramIdList[i].trim().toUpperCase();
				DeviceParamPo po = paramMap.get(paramId);
				if (po == null) {
					continue;
				}
				byte[] unit = this.getUnitBytes(message.getMcp(), po);
				if (list.size() + unit.length < 235) {
					this.setPdu(list, unit);
					if (i < paramIdList.length) {
						continue;
					}
				}
				message.setPDU(this.getPdu(list));
				channel.writeAndFlush(message);
				list.clear();
				this.setPdu(list, unit);
			}
		} catch (Exception ex) {
			logger.error("QueryAllListener send message error.", ex);
		}
	}

	private byte[] getUnitBytes(int mcp, DeviceParamPo po) {
		int length = (mcp == 1) ? (3 + po.getValueLen()) : (5 + po.getValueLen());
		ByteBuffer buffer = ByteBuffer.allocate(length);
		buffer.put((byte) length);
		buffer.put(this.getParamIdBytes(mcp, po.getUid().trim()));
		buffer.put(Converter.getFixedLengthBytes(po.getValueLen()));
		buffer.flip();
		return buffer.array();
	}

	private byte[] getPdu(ArrayList<Byte> list) {
		byte[] bytes = new byte[list.size()];
		for (int i = 0; i < list.size(); i++) {
			bytes[i] = list.get(i).byteValue();
		}
		return bytes;
	}

	private void setPdu(ArrayList<Byte> list, byte[] unit) {
		for (byte b : unit) {
			list.add(b);
		}
	}

	private byte[] getParamIdBytes(int mcp, String id) {
		if (mcp == 1) {
			return Converter.getReverseBytes(Short.valueOf(id.substring(2)).shortValue());
		}
		return Converter.getReverseBytes(Integer.valueOf(id.substring(2)).intValue());
	}
}
