package com.wellheadstone.nemms.server.domain.service;

import com.wellheadstone.nemms.data.util.SpringContextUtils;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceReportPo;

public class ServiceFacade {
	private static DeviceConnInfoService connInfoService = SpringContextUtils.getBean(DeviceConnInfoService.class);
	private static DeviceReportService reportService = SpringContextUtils.getBean(DeviceReportService.class);

	public static DeviceConnInfoPo getConnInfoBy(String siteUid) {
		return connInfoService.getDao().queryBy(siteUid);
	}

	public static void addNewDeviceConn(DeviceConnInfoPo po) {
		connInfoService.getDao().replaceInsert(po);
	}
	
	public static void removeDeviceConnByIP(String clientIP) {
		connInfoService.getDao().deleteByClientIP(clientIP);
	}
	
	public static void removeDeviceConnBySiteUid(String siteUid) {
		connInfoService.getDao().deleteBySiteUid(siteUid);
	}

	public static void addAlarmReport(DeviceReportPo po) {
		reportService.add(po);
	}

}
