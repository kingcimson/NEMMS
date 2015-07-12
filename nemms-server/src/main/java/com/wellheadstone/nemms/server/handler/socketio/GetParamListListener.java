package com.wellheadstone.nemms.server.handler.socketio;

import java.util.List;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.data.util.SpringContextUtils;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.DeviceParamService;
import com.wellheadstone.nemms.server.protocol.socketio.SocketIOMessage;

public class GetParamListListener implements DataListener<SocketIOMessage> {

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		SocketIOMessage response = new SocketIOMessage();
		response.setBody(this.getAllParams());
		client.sendEvent(EventName.GetParamList, response);
	}

	private List<DeviceParamPo> getAllParams() {
		DeviceParamService deviceParamService = SpringContextUtils.getBean(DeviceParamService.class);
		return deviceParamService.getAll();
	}
}
