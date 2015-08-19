package com.wellheadstone.nemms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceDataDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceDataPo;
import com.wellheadstone.nemms.po.DeviceSiteParamPo;

@Service
public class DeviceDataService extends BaseService<DeviceDataDao, DeviceDataPo> {
	@Autowired
	public DeviceDataService(DeviceDataDao dao) {
		super(dao);
	}

	public Map<Integer, List<DeviceSiteParamPo>> queryAllValuesForMap(String siteUid) {
		Map<Integer, List<DeviceSiteParamPo>> map = new HashMap<Integer, List<DeviceSiteParamPo>>(10);
		List<DeviceSiteParamPo> list = this.dao.queryAllValues(siteUid);
		for (DeviceSiteParamPo po : list) {
			if (!map.containsKey(po.getCategoryId())) {
				map.put(po.getCategoryId(), new ArrayList<DeviceSiteParamPo>(60));
			}
			map.get(po.getCategoryId()).add(po);
		}
		return map;
	}
}