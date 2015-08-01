package com.wellheadstone.nemms.server.task;

import com.alibaba.fastjson.JSONObject;
import com.wellheadstone.nemms.server.protocol.SocketIOMessage;

public interface ITask {

	int init();

	void execute(SocketIOMessage message, JSONObject req);
}
