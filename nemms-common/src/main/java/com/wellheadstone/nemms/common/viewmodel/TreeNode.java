package com.wellheadstone.nemms.common.viewmodel;

import java.util.ArrayList;
import java.util.List;

/**
 * 树节点视图数据模型类
 */
public class TreeNode<T> {
	private String id;
	private String pid;
	private String text;
	private String state;
	private String iconCls;
	private boolean checked;
	private T attributes;
	private List<TreeNode<T>> children = new ArrayList<TreeNode<T>>();

	public TreeNode(String id, String pid, String text) {
		this(id, pid, text, "closed", "", false, null);
	}

	public TreeNode(String id, String text, String state, T attributes) {
		this(id, "0", text, state, "", false, attributes);
	}

	public TreeNode(String id, String pid, String text, String state, T attributes) {
		this(id, pid, text, state, "", false, attributes);
	}

	public TreeNode(String id, String pid, String text, String state, String iconCls, boolean checked, T attributes) {
		this.id = id;
		this.pid = pid;
		this.text = text;
		this.state = state;
		this.iconCls = iconCls;
		this.checked = checked;
		this.attributes = attributes;
	}

	public String getId() {
		return this.id;
	}

	public String getPid() {
		return this.pid;
	}

	public String getText() {
		return this.text;
	}

	public String getIconCls() {
		return this.iconCls == null ? "" : this.iconCls;
	}

	public boolean getChecked() {
		return this.checked;
	}

	public String getState() {
		return this.state;
	}

	public T getAttributes() {
		return this.attributes;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public void setAttributes(T attributes) {
		this.attributes = attributes;
	}

	public List<TreeNode<T>> getChildren() {
		return this.children;
	}
}
