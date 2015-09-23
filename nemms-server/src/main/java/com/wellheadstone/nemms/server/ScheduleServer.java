package com.wellheadstone.nemms.server;

import java.util.Timer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.schedule.QueryParamsJob;
import com.wellheadstone.nemms.server.schedule.UpdateCacheJob;

public class ScheduleServer implements IServer {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleServer.class);

	@Override
	public void start() {
		try {
			Timer timer = new Timer();
			timer.schedule(new QueryParamsJob(), 0, 1000);
			timer.schedule(new UpdateCacheJob(), 0, 60 * 60 * 1000);
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
		}
	}
}
