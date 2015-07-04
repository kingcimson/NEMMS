package com.wellheadstone.nemms.server.task;

import com.alibaba.fastjson.JSONObject;
import com.wellheadstone.nemms.server.message.Message;

public interface ITask {

	int init();

	void execute(Message message, JSONObject req);
}
