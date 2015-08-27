package com.wellheadstone.nemms.server.domain.service;

import com.wellheadstone.nemms.data.util.SpringContextUtils;

public class ServiceFacade {
	public static void addNewDeviceConn() {
		DeviceConnInfoService connInfoService = SpringContextUtils.getBean(DeviceConnInfoService.class);
		// connInfoService.add(entity)
	}
}
