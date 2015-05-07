package com.wellheadstone.nemms.membership.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 系统角色表持久类
 */
public class RolePo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4433447420482347058L;

	/**
	 * 实体role名称
	 */
	public static String EntityName = "role";

	/**
	 * 列名role_id,系统角色标识
	 */
	public final static String RoleId = "role_id";

	/**
	 * 列名modules,系统角色所拥有的模块集合(module_id以英文逗号分隔)
	 */
	public final static String Modules = "modules";

	/**
	 * 列名operations,系统角色所拥有的操作集合(operation_id以英文逗号分隔)
	 */
	public final static String Operations = "operations";

	/**
	 * 列名name,系统角色名称
	 */
	public final static String Name = "name";

	/**
	 * 列名code,系统角色英文名称
	 */
	public final static String Code = "code";

	/**
	 * 列名is_system,是否为系统角色,1表示是，0表示否,默认为0
	 */
	public final static String IsSystem = "is_system";

	/**
	 * 列名status,系统角色的状态,1表示启用,0表示禁用,默认为1,其他保留
	 */
	public final static String Status = "status";

	/**
	 * 列名sequence,系统角色的排序顺序
	 */
	public final static String Sequence = "sequence";

	/**
	 * 列名comment,系统角色备注
	 */
	public final static String Comment = "comment";

	/**
	 * 列名create_user,系统角色创建者
	 */
	public final static String CreateUser = "create_user";

	/**
	 * 列名create_time,系统角色记录创建时间
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,系统角色记录更新时间戳
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "role_id", isIgnored = true)
	private Integer roleId;

	@Column(name = "modules")
	private String modules;

	@Column(name = "operations")
	private String operations;

	@Column(name = "name")
	private String name;

	@Column(name = "code")
	private String code;

	@Column(name = "is_system")
	private Byte isSystem;

	@Column(name = "status")
	private Byte status;

	@Column(name = "sequence")
	private Integer sequence;

	@Column(name = "comment")
	private String comment;

	@Column(name = "create_user")
	private String createUser;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	/**
	 * 获取系统角色标识
	 * 
	 * @return 系统角色标识
	 */
	public Integer getRoleId() {
		return this.roleId;
	}

	/**
	 * 设置系统角色标识
	 * 
	 * @param roleId
	 */
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	/**
	 * 获取系统角色所拥有的模块集合(module_id以英文逗号分隔)
	 * 
	 * @return 系统角色所拥有的模块集合(module_id以英文逗号分隔)
	 */
	public String getModules() {
		return this.modules;
	}

	/**
	 * 设置系统角色所拥有的模块集合(module_id以英文逗号分隔)
	 * 
	 * @param modules
	 */
	public void setModules(String modules) {
		this.modules = modules;
	}

	/**
	 * 获取系统角色所拥有的操作集合(operation_id以英文逗号分隔)
	 * 
	 * @return 系统角色所拥有的操作集合(operation_id以英文逗号分隔)
	 */
	public String getOperations() {
		return this.operations;
	}

	/**
	 * 设置系统角色所拥有的操作集合(operation_id以英文逗号分隔)
	 * 
	 * @param operations
	 */
	public void setOperations(String operations) {
		this.operations = operations;
	}

	/**
	 * 获取系统角色名称
	 * 
	 * @return 系统角色名称
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 设置系统角色名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取是否为系统角色,1表示是，0表示否,默认为0
	 * 
	 * @return 是否为系统角色,1表示是，0表示否,默认为0
	 */
	public Byte getIsSystem() {
		return this.isSystem;
	}

	/**
	 * 获取系统角色英文名称
	 * 
	 * @param name
	 *            角色英文名称
	 */
	public String getCode() {
		return this.code == null ? "" : this.code;
	}

	/**
	 * 设置系统角色英文名称
	 * 
	 * @return 角色英文名称
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * 设置是否为系统角色,1表示是，0表示否,默认为0
	 * 
	 * @param isSystem
	 */
	public void setIsSystem(Byte isSystem) {
		this.isSystem = isSystem;
	}

	/**
	 * 获取系统角色的状态,1表示启用,0表示禁用,默认为1,其他保留
	 * 
	 * @return 系统角色的状态,1表示启用,0表示禁用,默认为1,其他保留
	 */
	public Byte getStatus() {
		return this.status;
	}

	/**
	 * 设置系统角色的状态,1表示启用,0表示禁用,默认为1,其他保留
	 * 
	 * @param status
	 */
	public void setStatus(Byte status) {
		this.status = status;
	}

	/**
	 * 获取系统角色的排序顺序
	 * 
	 * @return 系统角色的排序顺序
	 */
	public Integer getSequence() {
		return this.sequence;
	}

	/**
	 * 设置系统角色的排序顺序
	 * 
	 * @param sequence
	 */
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	/**
	 * 获取系统角色备注
	 * 
	 * @return 系统角色备注
	 */
	public String getComment() {
		return this.comment == null ? "" : this.comment;
	}

	/**
	 * 设置系统角色备注
	 * 
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * 获取系统角色创建用户
	 * 
	 * @return 系统角色创建用户
	 */
	public String getCreateUser() {
		return this.createUser == null ? "" : this.createUser;
	}

	/**
	 * 设置系统角色创建用户
	 * 
	 * @param createUser
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * 获取系统角色记录创建时间
	 * 
	 * @return 系统角色记录创建时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置系统角色记录创建时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取系统角色记录更新时间戳
	 * 
	 * @return 系统角色记录更新时间戳
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置系统角色记录更新时间戳
	 * 
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
