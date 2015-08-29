package com.wellheadstone.nemms.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.ConfigSettingsDao;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.ConfigSettingsPo;

@Service
public class ConfigSettingsService extends BaseService<ConfigSettingsDao, ConfigSettingsPo> {
	@Autowired
	public ConfigSettingsService(ConfigSettingsDao dao) {
		super(dao);
	}

	public List<ConfigSettingsPo> getByKeyword(PageInfo page, String fieldName, String keyword) {
		String condition = "";
		if (StringUtils.isNotBlank(keyword)) {
			condition += String.format(" %s LIKE '%%%s%%' ", fieldName, keyword);
		}
		return this.getDao().query(condition, page);
	}
}