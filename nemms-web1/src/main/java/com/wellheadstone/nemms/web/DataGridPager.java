package com.wellheadstone.nemms.web;

import org.apache.commons.lang3.StringUtils;

public class DataGridPager {
	private Integer page;
	private Integer rows;
	private String sort;
	private String order;

	public DataGridPager() {
	}

	public Integer getPage() {
		return page == null ? 1 : this.page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows == null ? 30 : this.rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return StringUtils.isBlank(order) ? "desc" : this.order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public void setDefaultSort(String sort) {
		if (StringUtils.isBlank(this.sort)) {
			this.sort = sort;
		}
	}
}
