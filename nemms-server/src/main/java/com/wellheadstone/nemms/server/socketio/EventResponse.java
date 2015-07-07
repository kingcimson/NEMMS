package com.wellheadstone.nemms.server.socketio;

import com.alibaba.fastjson.JSONObject;

public class EventResponse {
	private int siteId;
	private String sessionId;
	private String serverIP;
	private String userIP;
	private String responseText;
	private int status = 1;
	private long startTime = System.currentTimeMillis();
	private long timeStamp;
	private boolean isCallback = true;

	public EventResponse() {
	}

	public int getSiteId() {
		return siteId;
	}

	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getServerIP() {
		return serverIP;
	}

	public void setServerIP(String serverIP) {
		this.serverIP = serverIP;
	}

	public String getUserIP() {
		return userIP;
	}

	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}

	public String getResponseText() {
		return responseText;
	}

	public void setResponseText(String responseText) {
		this.responseText = responseText;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public long getStartTime() {
		return startTime;
	}

	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}

	public long getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(long timeStamp) {
		this.timeStamp = timeStamp;
	}

	public boolean isCallback() {
		return isCallback;
	}

	public void setCallback(boolean isCallback) {
		this.isCallback = isCallback;
	}

	public void setResponse(JSONObject response) {
		this.responseText = response.toJSONString();
	}

	public void setResponse(JSONObject response, JSONObject request) {
		response.put("ts", System.currentTimeMillis() / 1000);
		this.setCommonResponse(response, request, true);
		this.responseText = response.toJSONString();
	}

	public void setSuccessResponse(JSONObject request) {
		JSONObject response = getResponse(request, true);
		response.put("ts", System.currentTimeMillis() / 1000);
		this.responseText = response.toJSONString();
	}

	public void setErrorResponse(JSONObject request) {
		JSONObject response = this.getResponse(request, false);
		this.responseText = response.toJSONString();
	}

	public void setErrorResponse(JSONObject request, int errorNum) {
		this.setErrorResponse(request, errorNum, "");
	}

	public void setErrorResponse(JSONObject request, int errorNum, String errmsg) {
		JSONObject response = this.getResponse(request, false);
		response.put("errorno", errorNum);
		response.put("errmsg", errmsg);
		this.responseText = response.toJSONString();
	}

	private JSONObject getResponse(JSONObject request, Boolean isSuccess) {
		JSONObject response = new JSONObject();
		this.setCommonResponse(response, request, isSuccess);
		return response;
	}

	private void setCommonResponse(JSONObject response, JSONObject request,
			Boolean isSuccess) {
	}

}
