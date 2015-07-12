package com.wellheadstone.nemms.server.protocol.socketio;

import java.io.Serializable;

public class SocketIOMessage implements Serializable {
	private static final long serialVersionUID = -5122436055704695237L;
	private SokcetIOHeader header;
	private Object body;

	public SokcetIOHeader getHeader() {
		return header;
	}

	public void setHeader(SokcetIOHeader header) {
		this.header = header;
	}

	public Object getBody() {
		return body;
	}

	public void setBody(Object body) {
		this.body = body;
	}
}
