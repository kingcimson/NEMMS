package com.wellheadstone.nemms.server.handler.socketio;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.message.SocketIOTelnetMessage;
import com.wellheadstone.nemms.server.util.TelnetUtils;

public class TelentListener implements DataListener<SocketIOTelnetMessage> {
	private final static Logger logger = LoggerFactory.getLogger(TelentListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOTelnetMessage data, AckRequest ackSender) throws Exception {
		try {
			TelnetUtils telnetUtils = new TelnetUtils();
			telnetUtils.login(data.getTelnetIP(), data.getTelnetPort(), data.getTelnetUser(), data.getTelnetPwd());
			String respText = telnetUtils.execute(data.getTelnetCmd());
			data.setResponseText(respText);
		} catch (Exception e) {
			logger.error("TelentListener error.", e);
			data.setRespFlag((short) 0xFE);
			data.setResponseText(e.getMessage());
		}
		data.setRequestText(String.format("ip:%s,port:%s，user:%s,pwd:%s,cmd:%s",
				data.getTelnetIP(), data.getTelnetPort(), data.getTelnetUser(), data.getTelnetPwd(),
				data.getTelnetCmd()));
		client.sendEvent(EventName.Telnet, data);
	}
}
