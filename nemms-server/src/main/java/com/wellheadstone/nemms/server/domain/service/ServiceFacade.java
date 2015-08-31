package com.wellheadstone.nemms.server.domain.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wellheadstone.nemms.data.util.SpringContextUtils;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.po.DeviceReportPo;
import com.wellheadstone.nemms.server.domain.po.DeviceSitePo;

public class ServiceFacade {
	private static DeviceConnInfoService connInfoService = SpringContextUtils.getBean(DeviceConnInfoService.class);
	private static DeviceReportService reportService = SpringContextUtils.getBean(DeviceReportService.class);
	private static DeviceSiteService deviceSiteService = SpringContextUtils.getBean(DeviceSiteService.class);
	private static DeviceDataService deviceDataService = SpringContextUtils.getBean(DeviceDataService.class);
	private static DeviceParamService deviceParamService = SpringContextUtils.getBean(DeviceParamService.class);

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

	public static int addParamList(List<DeviceDataPo> entities) {
		return deviceDataService.getDao().batchInsert(entities);
	}

	public static int removeDeviceDataBy(String siteUid) {
		return deviceDataService.getDao().deleteBySiteUid(siteUid);
	}

	public static Map<String, DeviceParamPo> getParamList(int mcp) {
		List<DeviceParamPo> params = deviceParamService.getDao().queryParamListBy(mcp);
		Map<String, DeviceParamPo> paramMap = new HashMap<String, DeviceParamPo>(params.size());
		for (DeviceParamPo param : params) {
			paramMap.put(param.getUid().trim().toUpperCase(), param);
		}
		return paramMap;
	}

	public static void updateParamListValue(List<DeviceDataPo> entities) {
		for (DeviceDataPo entity : entities) {
			deviceDataService.getDao().replaceInsert(entity);
		}
	}
}
