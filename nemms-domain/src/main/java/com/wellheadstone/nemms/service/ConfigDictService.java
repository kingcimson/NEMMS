package com.wellheadstone.nemms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.ConfigDictDao;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.ConfigDictPo;

@Service
public class ConfigDictService extends BaseService<ConfigDictDao, ConfigDictPo> {
	@Autowired
	public ConfigDictService(ConfigDictDao dao) {
		super(dao);
	}

	public List<ConfigDictPo> findByKeyword(PageInfo page, String fieldName, String keyword) {
		String condition = "";
		if (StringUtils.isNotBlank(keyword)) {
			condition = fieldName + " like '%" + keyword + "%' ";
		}
		return this.getDao().query(condition, page);
	}

	public List<ConfigDictPo> getConfigWithPageById(PageInfo page, Integer id) {
		String condition = "pid = " + id;
		return this.getDao().query(condition, page);
	}

	public Map<String, List<ConfigDictPo>> getConfigItems(String parentKey) {
		Map<String, List<ConfigDictPo>> itemMap = new HashMap<String, List<ConfigDictPo>>(10);

		List<ConfigDictPo> items = this.getDao().queryAllItem();
		ConfigDictPo parentItem = items.stream()
				.filter(x -> x.getKey().equals(parentKey))
				.findFirst()
				.get();
		List<ConfigDictPo> subItems = items.stream()
				.filter(x -> x.getPid() == parentItem.getId())
				.collect(Collectors.toList());
		for (ConfigDictPo subItem : subItems) {
			itemMap.put(subItem.getKey(), items.stream()
					.filter(x -> x.getPid() == subItem.getId())
					.collect(Collectors.toList()));
		}

		return itemMap;
	}

	public List<ConfigDictPo> getDeviceTypes() {
		return this.getDao().queryBy("deviceType");
	}
}