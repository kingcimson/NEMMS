package com.wellheadstone.nemms.service;

import java.util.List;

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

	public List<ConfigDictPo> getDictConfigMapById(PageInfo page, Integer id) {
		String condition = "pid = " + id;
		return this.getDao().query(condition, page);
	}

	public double getPublishExceptedRatio() {
		ConfigDictPo po = this.getDao().queryBy(1, "PublishExceptedRatio");
		if (po == null) {
			return 1.0;
		}
		try {
			return Double.valueOf(po.getValue());
		} catch (NumberFormatException ex) {
			throw new RuntimeException(ex);
		}
	}
}