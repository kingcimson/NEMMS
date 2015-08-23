package com.wellheadstone.nemms.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 定时任务信息表持久类
 */
public class DeviceSchedulePo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 2897805664117451332L;

	/**
	 * 实体device_schedule名称
	 */
	public static String EntityName = "device_schedule";

	/**
	 * 列名id,任务ID
	 */
	public final static String Id = "id";

	/**
	 * 列名peroid,任务执行频率(取值：y每年|M每月|w每周|d每天|h每小时|m每分|s每秒)
	 */
	public final static String Peroid = "peroid";

	/**
	 * 列名interval,任务执行间隔
	 */
	public final static String Interval = "interval";

	/**
	 * 列名start_time,任务执行时间,指定任务什么时间执行
	 */
	public final static String StartTime = "start_time";

	/**
	 * 列名times,任务执次数
	 */
	public final static String Times = "times";

	/**
	 * 列名params,定时任务参数(json数据结构)
	 */
	public final static String Params = "params";

	/**
	 * 列名comment,任务说明
	 */
	public final static String Comment = "comment";

	/**
	 * 列名create_time,任务记录创建时间
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,任务记录修改时间
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "id", isIgnored = true)
	private Integer id;

	@Column(name = "peroid")
	private String peroid;

	@Column(name = "interval")
	private Integer interval;

	@Column(name = "start_time")
	private String startTime;

	@Column(name = "times")
	private Integer times;

	@Column(name = "params")
	private String params;

	@Column(name = "comment")
	private String comment;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "update_time")
	private Date updateTime;

	/**
	 * 获取任务ID
	 *
	 * @return 任务ID
	 */
	public Integer getId() {
		return this.id;
	}

	/**
	 * 设置任务ID
	 *
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取任务执行频率(取值：y每年|M每月|w每周|d每天|h每小时|m每分|s每秒)
	 *
	 * @return 任务执行频率(取值：y每年|M每月|w每周|d每天|h每小时|m每分|s每秒)
	 */
	public String getPeroid() {
		return this.peroid;
	}

	/**
	 * 设置任务执行频率(取值：y每年|M每月|w每周|d每天|h每小时|m每分|s每秒)
	 *
	 * @param peroid
	 */
	public void setPeroid(String peroid) {
		this.peroid = peroid;
	}

	/**
	 * 获取任务执行间隔
	 *
	 * @return 任务执行间隔
	 */
	public Integer getInterval() {
		return this.interval;
	}

	/**
	 * 设置任务执行间隔
	 *
	 * @param interval
	 */
	public void setInterval(Integer interval) {
		this.interval = interval;
	}

	/**
	 * 获取任务执行时间,指定任务什么时间执行
	 *
	 * @return 任务执行时间,指定任务什么时间执行
	 */
	public String getStartTime() {
		return this.startTime;
	}

	/**
	 * 设置任务执行时间,指定任务什么时间执行
	 *
	 * @param startTime
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * 获取定时任务执行次数
	 * 
	 * @return 执行次数
	 */
	public Integer getTimes() {
		return times;
	}

	/**
	 * 设置定时任务执行次数
	 * 
	 * @param times
	 *            执行次数
	 */
	public void setTimes(Integer times) {
		this.times = times;
	}

	/**
	 * 获取定时任务参数(json数据结构)
	 *
	 * @return 定时任务参数(json数据结构)
	 */
	public String getParams() {
		return this.params;
	}

	/**
	 * 设置定时任务参数(json数据结构)
	 *
	 * @param params
	 */
	public void setParams(String params) {
		this.params = params;
	}

	/**
	 * 获取任务说明
	 *
	 * @return 任务说明
	 */
	public String getComment() {
		return this.comment;
	}

	/**
	 * 设置任务说明
	 *
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * 获取任务记录创建时间
	 *
	 * @return 任务记录创建时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置任务记录创建时间
	 *
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取任务记录修改时间
	 *
	 * @return 任务记录修改时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置任务记录修改时间
	 *
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public static String getColumnName(String name) {
		if ("startTime".equals(name)) {
			return DeviceSchedulePo.StartTime;
		}
		if ("createTime".equals(name)) {
			return DeviceSchedulePo.CreateTime;
		}
		if ("updateTime".equals(name)) {
			return DeviceSchedulePo.UpdateTime;
		}
		return DeviceParamPo.Id;
	}
}
