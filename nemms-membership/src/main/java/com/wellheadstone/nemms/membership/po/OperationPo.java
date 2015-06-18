package com.wellheadstone.nemms.membership.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 系统操作表持久类
 */
public class OperationPo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4264885985505020855L;

	/**
	 * 实体face_operation名称
	 */
	public static String EntityName = "operation";

	/**
	 * 列名operation_id,系统操作标识
	 */
	public final static String OperationId = "operation_id";

	/**
	 * 列名module_id,系统模块标识
	 */
	public final static String ModuleId = "module_id";

	/**
	 * 列名name,系统操作名称
	 */
	public final static String Name = "name";

	/**
	 * 列名code,系统操作唯一代号
	 */
	public final static String Code = "code";

	/**
	 * 列名sequence,系统操作的排序顺序
	 */
	public final static String Sequence = "sequence";

	/**
	 * 列名comment,系统操作备注
	 */
	public final static String Comment = "comment";

	/**
	 * 列名create_time,系统操作记录创建时间
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,系统操作记录更新时间戳
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "operation_id", isIgnored = true)
	private Integer operationId;

	@Column(name = "module_id")
	private Integer moduleId;

	@Column(name = "name")
	private String name;

	@Column(name = "code")
	private String code;

	@Column(name = "sequence")
	private Integer sequence;

	@Column(name = "comment")
	private String comment;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	private String path;

	/**
	 * 获取系统操作标识
	 * 
	 * @return 系统操作标识
	 */
	public Integer getOperationId() {
		return this.operationId;
	}

	/**
	 * 设置系统操作标识
	 * 
	 * @param operationId
	 */
	public void setOperationId(Integer operationId) {
		this.operationId = operationId;
	}

	/**
	 * 获取系统模块标识
	 * 
	 * @return 系统模块标识
	 */
	public Integer getModuleId() {
		return this.moduleId;
	}

	/**
	 * 设置系统模块标识
	 * 
	 * @param moduleId
	 */
	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

	/**
	 * 获取系统操作名称
	 * 
	 * @return 系统操作名称
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 设置系统操作名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取系统操作唯一代号
	 * 
	 * @return 系统操作唯一代号
	 */
	public String getCode() {
		return this.code;
	}

	/**
	 * 设置系统操作唯一代号
	 * 
	 * @param code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * 获取系统操作的排序顺序
	 * 
	 * @return 系统操作的排序顺序
	 */
	public Integer getSequence() {
		return this.sequence;
	}

	/**
	 * 设置系统操作的排序顺序
	 * 
	 * @param sequence
	 */
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	/**
	 * 获取系统操作备注
	 * 
	 * @return 系统操作备注
	 */
	public String getComment() {
		return this.comment == null ? "" : this.comment;
	}

	/**
	 * 设置系统操作备注
	 * 
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * 获取系统操作记录创建时间
	 * 
	 * @return 系统操作记录创建时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置系统操作记录创建时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取系统操作记录更新时间戳
	 * 
	 * @return 系统操作记录更新时间戳
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置系统操作记录更新时间戳
	 * 
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取系统操作所属的模块树路径
	 * 
	 * @return 系统操作所属的模块树路径
	 */
	public String getPath() {
		return this.path;
	}

	/**
	 * 设置系统操作所属的模块树路径
	 * 
	 * @param path
	 *            系统操作所属的模块树路径
	 */
	public void setPath(String path) {
		this.path = path;
	}
}
