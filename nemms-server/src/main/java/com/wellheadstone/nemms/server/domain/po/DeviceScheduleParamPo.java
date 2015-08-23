package com.wellheadstone.nemms.server.domain.po;

import java.io.Serializable;

/**
 * 定时任务参数类
 */
public class DeviceScheduleParamPo implements Serializable {
	private static final long serialVersionUID = 5313937111380255033L;
	private String siteUid;
	private String paramUidList;
	private String cmd;

	public String getSiteUid() {
		return siteUid;
	}

	public void setSiteUid(String siteUid) {
		this.siteUid = siteUid;
	}

	public String getParamUidList() {
		return paramUidList;
	}

	public void setParamUidList(String paramUidList) {
		this.paramUidList = paramUidList;
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
}
