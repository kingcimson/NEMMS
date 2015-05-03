package com.wellheadstone.nemms.web;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.wellheadstone.nemms.data.PageInfo;

public class DataTablePageInfo {
	private Integer draw;
	private Integer start;
	private Integer length;

	public Integer getDraw() {
		return this.draw == null ? -1 : this.draw;
	}

	public void setDraw(Integer draw) {
		this.draw = draw;
	}

	public Integer getStart() {
		return this.start == null ? 0 : this.start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLength() {
		return this.length == null ? 20 : this.length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public PageInfo toPageInfo(Map<?, ?> reqMap, String defaultSortItem) {
		String sortItem = this.getSortItem(reqMap);
		String sortType = this.getSortType(reqMap);
		PageInfo page = new PageInfo(this.getStart(), this.getLength());
		page.setSortItem(StringUtils.isBlank(sortItem) ? defaultSortItem : sortItem);
		page.setSortType(StringUtils.isBlank(sortType) ? "asc" : sortType);
		return page;
	}

	private String getSortItem(Map<?, ?> reqMap) {
		String[] values = (String[]) reqMap.get("order[0][column]");
		String index = (values == null || values.length == 0) ? "" : values[0];
		if (StringUtils.isNotBlank(index)) {
			values = (String[]) reqMap.get(String.format("columns[%s][name]", index));
			return (values == null || values.length == 0) ? "" : values[0];
		}
		return StringUtils.EMPTY;
	}

	private String getSortType(Map<?, ?> reqMap) {
		String[] values = (String[]) reqMap.get("order[0][dir]");
		return (values == null || values.length == 0) ? "" : values[0];
	}
}
