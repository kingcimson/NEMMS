package com.wellheadstone.nemms.server.task;

import com.alibaba.fastjson.JSONObject;
import com.wellheadstone.nemms.server.socketio.EventRequest;

public interface ITask {

	int init();

	void execute(EventRequest message, JSONObject req);
}
