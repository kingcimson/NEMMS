package com.wellheadstone.nemms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.DeviceReportDao;
import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.DeviceReportPo;

@Service
public class DeviceReportService extends BaseService<DeviceReportDao, DeviceReportPo> {
	@Autowired
	public DeviceReportService(DeviceReportDao dao) {
		super(dao);
	}

	public List<DeviceReportPo> getByPage(String siteUid, PageInfo page) {
		String condition = Restrictions.equal(DeviceReportPo.SiteUid, "?").toString();
		return this.dao.query(condition, page, new Object[] { siteUid });
	}
}