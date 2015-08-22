package com.wellheadstone.nemms.membership.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wellheadstone.nemms.common.serializer.CustomDateTimeSerializer;
import com.wellheadstone.nemms.data.annotations.Column;

/**
 * 系统用户表持久类
 */
public class UserPo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3593360906866476886L;

	/**
	 * 实体face_user名称
	 */
	public static String EntityName = "user";

	/**
	 * 列名user_id,系统用户标识
	 */
	public final static String UserId = "user_id";

	/**
	 * 列名roles,系统用户所属角色集合(role_id以英文逗号分隔)
	 */
	public final static String Roles = "roles";

	/**
	 * 列名account,系统用户账号
	 */
	public final static String Account = "account";

	/**
	 * 列名password,系统用户密码
	 */
	public final static String Password = "password";

	/**
	 * 列名salt,系统用户盐
	 */
	public final static String Salt = "salt";

	/**
	 * 列名name,系统用户姓名
	 */
	public final static String Name = "name";

	/**
	 * 列名email,系统用户电子邮箱
	 */
	public final static String Email = "email";

	/**
	 * 列名telephone,系统用户用户电话号码,多个用英文逗号分开
	 */
	public final static String Telephone = "telephone";

	/**
	 * 列名status,系统用户的状态,1表示启用,0表示禁用,默认为1,其他保留
	 */
	public final static String Status = "status";

	/**
	 * 列名comment,系统用户备注
	 */
	public final static String Comment = "comment";

	/**
	 * 列名create_time,系统用户记录创建时间
	 */
	public final static String CreateTime = "create_time";

	/**
	 * 列名update_time,系统用户记录更新时间戳
	 */
	public final static String UpdateTime = "update_time";

	@Column(name = "user_id", isIgnored = true)
	private Integer userId;

	@Column(name = "roles")
	private String roles;

	@Column(name = "account")
	private String account;

	@Column(name = "password")
	private String password;

	@Column(name = "salt")
	private String salt;

	@Column(name = "name")
	private String name;

	@Column(name = "email")
	private String email;

	@Column(name = "telephone")
	private String telephone;

	@Column(name = "status")
	private Byte status;

	@Column(name = "comment")
	private String comment;

	@Column(name = "create_time")
	private Date createTime = Calendar.getInstance().getTime();

	@Column(name = "update_time")
	private Date updateTime = Calendar.getInstance().getTime();

	/**
	 * 获取系统用户标识
	 * 
	 * @return 系统用户标识
	 */
	public Integer getUserId() {
		return this.userId;
	}

	/**
	 * 设置系统用户标识
	 * 
	 * @param userId
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/**
	 * 获取系统用户所属角色集合(role_id以英文逗号分隔)
	 * 
	 * @return 系统用户所属角色集合(role_id以英文逗号分隔)
	 */
	public String getRoles() {
		return this.roles;
	}

	/**
	 * 设置系统用户所属角色集合(role_id以英文逗号分隔)
	 * 
	 * @param roles
	 */
	public void setRoles(String roles) {
		this.roles = roles;
	}

	/**
	 * 获取系统用户账号
	 * 
	 * @return 系统用户账号
	 */
	public String getAccount() {
		return this.account;
	}

	/**
	 * 设置系统用户账号
	 * 
	 * @param account
	 */
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * 获取系统用户密码
	 * 
	 * @return 系统用户密码
	 */
	public String getPassword() {
		return this.password;
	}

	/**
	 * 设置系统用户密码
	 * 
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取系统用户密码的加盐码
	 * 
	 * @return
	 */
	public String getSalt() {
		return salt;
	}

	/**
	 * 设置系统用户密码的加盐码
	 * 
	 * @param salt
	 */
	public void setSalt(String salt) {
		this.salt = salt;
	}

	/**
	 * 获取系统用户密码的凭证盐(account+salt)
	 * 
	 * @return account+salt
	 */
	public String getCredentialsSalt() {
		return this.account + this.salt;
	}

	/**
	 * 获取系统用户姓名
	 * 
	 * @return 系统用户姓名
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 设置系统用户姓名
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取系统用户电子邮箱
	 * 
	 * @return 系统用户电子邮箱
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * 设置系统用户电子邮箱
	 * 
	 * @param email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 获取系统用户用户电话号码,多个用英文逗号分开
	 * 
	 * @return
	 */
	public String getTelephone() {
		return this.telephone;
	}

	/**
	 * 设置系统用户用户电话号码,多个用英文逗号分开
	 * 
	 * @param telephone
	 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	/**
	 * 获取系统用户的状态,1表示启用,0表示禁用,默认为1,其他保留
	 * 
	 * @return 系统用户的状态,1表示启用,0表示禁用,默认为1,其他保留
	 */
	public Byte getStatus() {
		return this.status;
	}

	/**
	 * 设置系统用户的状态,1表示启用,0表示禁用,默认为1,其他保留
	 * 
	 * @param status
	 */
	public void setStatus(Byte status) {
		this.status = status;
	}

	/**
	 * 获取系统用户备注
	 * 
	 * @return 系统用户备注
	 */
	public String getComment() {
		return this.comment;
	}

	/**
	 * 设置系统用户备注
	 * 
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * 获取系统用户记录创建时间
	 * 
	 * @return 系统用户记录创建时间
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getCreateTime() {
		return createTime == null ? Calendar.getInstance().getTime() : createTime;
	}

	/**
	 * 设置系统用户记录创建时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取系统用户记录更新时间戳
	 * 
	 * @return 系统用户记录更新时间戳
	 */
	@JsonSerialize(using = CustomDateTimeSerializer.class)
	public Date getUpdateTime() {
		return updateTime == null ? Calendar.getInstance().getTime() : updateTime;
	}

	/**
	 * 设置系统用户记录更新时间戳
	 * 
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	public static String getColumnName(String name){
		if("userId".equals(name)) return UserPo.UserId;
		if("createTime".equals(name)) return UserPo.CreateTime;
		if("updateTime".equals(name)) return UserPo.UpdateTime;
		return UserPo.CreateTime;
	}
}
