package com.wellheadstone.nemms.membership.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 用户操作日志表持久类
 */
public class EventPo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6302776313165715038L;

	/**
	 * 实体face_event名称
	 */
	public static String EntityName = "event";

	/**
	 * 列名event_id,日志标识
	 */
	public final static String EventId = "event_id";

	/**
	 * 列名source,日志来源
	 */
	public final static String Source = "source";

	/**
	 * 列名user_id,操作用户id
	 */
	public final static String UserId = "user_id";

	/**
	 * 列名account,操作用户账号
	 */
	public final static String Account = "account";

	/**
	 * 列名level,日志级别
	 */
	public final static String Level = "level";

	/**
	 * 列名message,日志信息
	 */
	public final static String Message = "message";

	/**
	 * 列名url,url
	 */
	public final static String Url = "url";

	/**
	 * 列名create_time,日志发生的时间
	 */
	public final static String CreateTime = "create_time";

	@Column(name = "event_id", isIgnored = true)
	private Integer eventId;

	@Column(name = "source")
	private String source;

	@Column(name = "user_id")
	private Integer userId;

	@Column(name = "account")
	private String account;

	@Column(name = "level")
	private String level;

	@Column(name = "message")
	private String message;

	@Column(name = "url")
	private String url;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	/**
	 * 获取日志标识
	 * 
	 * @return 日志标识
	 */
	public Integer getEventId() {
		return this.eventId;
	}

	/**
	 * 设置日志标识
	 * 
	 * @param eventId
	 */
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	/**
	 * 获取日志来源
	 * 
	 * @return 日志来源
	 */
	public String getSource() {
		return this.source;
	}

	/**
	 * 设置日志来源
	 * 
	 * @param source
	 */
	public void setSource(String source) {
		this.source = source;
	}

	/**
	 * 获取操作用户id
	 * 
	 * @return 操作用户id
	 */
	public Integer getUserId() {
		return this.userId;
	}

	/**
	 * 设置操作用户id
	 * 
	 * @param userId
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/**
	 * 获取操作用户账号
	 * 
	 * @return 操作用户账号
	 */
	public String getAccount() {
		return this.account;
	}

	/**
	 * 设置操作用户账号
	 * 
	 * @param account
	 */
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * 获取日志级别
	 * 
	 * @return 日志级别
	 */
	public String getLevel() {
		return this.level;
	}

	/**
	 * 设置日志级别
	 * 
	 * @param level
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * 获取日志信息
	 * 
	 * @return 日志信息
	 */
	public String getMessage() {
		return this.message;
	}

	/**
	 * 设置日志信息
	 * 
	 * @param message
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 获取url
	 * 
	 * @return url
	 */
	public String getUrl() {
		return this.url;
	}

	/**
	 * 设置url
	 * 
	 * @param url
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * 获取日志发生的时间
	 * 
	 * @return 日志发生的时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置日志发生的时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
