package com.wellheadstone.nemms.server.task;

import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public class DefaultTask extends AbstractTask implements ITask {

	private final static Logger logger = LoggerFactory.getLogger(DefaultTask.class);

	protected DefaultTask(IoSession session, CMCCFDSMessage msg) {
		super(session, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		logger.warn("this is default task.");
	}

}
