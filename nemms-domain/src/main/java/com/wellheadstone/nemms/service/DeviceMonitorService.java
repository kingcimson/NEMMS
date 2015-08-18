package com.wellheadstone.nemms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceMonitorDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceMonitorPo;
import com.wellheadstone.nemms.po.SiteParamPo;

@Service
public class DeviceMonitorService extends BaseService<DeviceMonitorDao, DeviceMonitorPo> {
	@Autowired
	public DeviceMonitorService(DeviceMonitorDao dao) {
		super(dao);
	}
	
	public Map<Integer,List<SiteParamPo>> queryAllValuesForMap(int siteId){
		Map<Integer,List<SiteParamPo>> map = new HashMap<Integer,List<SiteParamPo>>(10);
		List<SiteParamPo> list = this.dao.queryAllValues(siteId);
		for(SiteParamPo po : list){
			if(!map.containsKey(po.getCategoryId())){
				map.put(po.getCategoryId(), new ArrayList<SiteParamPo>(60));
			}
			map.get(po.getCategoryId()).add(po);
		}
		return map;
	}
}