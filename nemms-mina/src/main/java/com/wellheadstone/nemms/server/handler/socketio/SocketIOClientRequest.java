package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.SocketIOClient;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

public class SocketIOClientRequest {
	private final SocketIOClient client;
	private final SocketIOMessage data;
	private short packetId;
	private boolean finished;

	public SocketIOClientRequest(SocketIOClient client, SocketIOMessage data) {
		this.client = client;
		this.data = data;
	}

	/**
	 * @return the client
	 */
	public SocketIOClient getClient() {
		return client;
	}

	/**
	 * @return the data
	 */
	public SocketIOMessage getData() {
		return data;
	}

	/**
	 * @return the packetId
	 */
	public short getPacketId() {
		return packetId;
	}

	/**
	 * @param packetId
	 *            the packetId to set
	 */
	public void setPacketId(short packetId) {
		this.packetId = packetId;
	}

	public boolean isFinished() {
		return finished;
	}

	public void setFinished(boolean finished) {
		this.finished = finished;
	}

}
