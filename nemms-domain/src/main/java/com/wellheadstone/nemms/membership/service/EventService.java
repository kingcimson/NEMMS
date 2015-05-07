package com.wellheadstone.nemms.membership.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.lf5.LogLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.PageInfo;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.membership.dao.EventDao;
import com.wellheadstone.nemms.membership.po.EventPo;

@Service
public class EventService extends BaseService<EventDao, EventPo> {
	@Autowired
	public EventService(EventDao dao) {
		super(dao);
	}

	public void append(String source, String message, int userId, String account, LogLevel level) {
		EventPo event = new EventPo();
		event.setSource(source);
		event.setMessage(message);
		event.setUserId(userId);
		event.setAccount(account);
		event.setLevel(level.toString());
		event.setCreateTime(event.getCreateTime());
		event.setUrl("");
		this.add(event);
	}

	public List<EventPo> getEventsByKeyword(PageInfo page, String fieldName, String keyword) {
		String condition = "";
		if (StringUtils.isNotBlank(keyword)) {
			condition = fieldName + " like '%" + keyword + "%' ";
		}
		return this.getDao().query(condition, page);
	}
}