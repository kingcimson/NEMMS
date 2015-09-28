package com.wellheadstone.nemms.server.domain.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 配置字典表持久类
 */
public class ConfigSettingsPo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -4796399815228799364L;

	/**
	 * 实体config_settings名称
	 */
	public static String EntityName = "config_settings";

	/**
	 * 列名id,配置字典ID
	 */
	public final static String Id = "id";

	/**
	 * 列名name,名称
	 */
	public final static String Name = "name";

	/**
	 * 列名key,
	 */
	public final static String Key = "`key`";

	/**
	 * 列名value,
	 */
	public final static String Value = "`value`";

	/**
	 * 列名sequence,
	 */
	public final static String Sequence = "sequence";

	/**
	 * 列名comment,
	 */
	public final static String Comment = "comment";

	/**
	 * 列名create_time,
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "id", isIgnored = true)
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "`key`")
	private String key;

	@Column(name = "`value`")
	private String value;

	@Column(name = "sequence")
	private Integer sequence;

	@Column(name = "comment")
	private String comment;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	/**
	 * 获取配置字典ID
	 *
	 * @return 配置字典ID
	 */
	public Integer getId() {
		return this.id;
	}

	/**
	 * 设置配置字典ID
	 *
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取名称
	 *
	 * @return 名称
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 设置名称
	 *
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取
	 *
	 * @return
	 */
	public String getKey() {
		return this.key;
	}

	/**
	 * 设置
	 *
	 * @param key
	 */
	public void setKey(String key) {
		this.key = key;
	}

	/**
	 * 获取
	 *
	 * @return
	 */
	public String getValue() {
		return this.value;
	}

	/**
	 * 设置
	 *
	 * @param value
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * 获取
	 *
	 * @return
	 */
	public Integer getSequence() {
		return this.sequence;
	}

	/**
	 * 设置
	 *
	 * @param sequence
	 */
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	/**
	 * 获取
	 *
	 * @return
	 */
	public String getComment() {
		return this.comment;
	}

	/**
	 * 设置
	 *
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * 获取
	 *
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置
	 *
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取
	 *
	 * @return
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置
	 *
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
