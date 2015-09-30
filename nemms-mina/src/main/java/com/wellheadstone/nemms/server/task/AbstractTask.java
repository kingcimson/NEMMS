package com.wellheadstone.nemms.server.task;

import org.apache.mina.core.session.IoSession;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public abstract class AbstractTask {
	protected IoSession session;
	protected CMCCFDSMessage msg;

	protected AbstractTask(IoSession session, CMCCFDSMessage msg) {
		this.session = session;
		this.msg = msg;
	}
}
