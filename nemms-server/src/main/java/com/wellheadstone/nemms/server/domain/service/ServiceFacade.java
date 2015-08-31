package com.wellheadstone.nemms.server.domain.service;

import com.wellheadstone.nemms.data.util.SpringContextUtils;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceReportPo;
import com.wellheadstone.nemms.server.domain.po.DeviceSitePo;

public class ServiceFacade {
	private static DeviceConnInfoService connInfoService = SpringContextUtils.getBean(DeviceConnInfoService.class); 
	private static DeviceReportService reportService = SpringContextUtils.getBean(DeviceReportService.class);
	private static DeviceSiteService deviceSiteService = SpringContextUtils.getBean(DeviceSiteService.class);
	private static DeviceDataService deviceDataService = SpringContextUtils.getBean(DeviceDataService.class);

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

	public static DeviceSitePo getDeviceSiteBy(String siteUid) {
		return deviceSiteService.getByUid(siteUid);
	}

	public static int updateAlarmReport(DeviceDataPo po) {
		return deviceDataService.getDao().updateAlarm(po);
	}
}
