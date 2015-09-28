package com.wellheadstone.nemms.server.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.server.domain.dao.ConfigSettingsDao;
import com.wellheadstone.nemms.server.domain.po.ConfigSettingsPo;

@Service
public class ConfigSettingsService extends BaseService<ConfigSettingsDao, ConfigSettingsPo> {
	@Autowired
	public ConfigSettingsService(ConfigSettingsDao dao) {
		super(dao);
	}
}