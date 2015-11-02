package com.wellheadstone.nemms.server.handler.socketio;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.domain.po.DeviceSitePo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.SocketIOTelnetMessage;
import com.wellheadstone.nemms.server.util.TelnetUtils;

public class TelentListener implements DataListener<SocketIOTelnetMessage> {
	private final static Logger logger = LoggerFactory.getLogger(TelentListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOTelnetMessage data, AckRequest ackSender) throws Exception {
		try {
			TelnetUtils telnetUtils = new TelnetUtils();
			telnetUtils.login(data.getTelnetIP(), data.getTelnetPort(), data.getTelnetUser(), data.getTelnetPwd());
			String respText = telnetUtils.execute(data.getTelnetCmd());
			data.setResponseText(respText);
			List<String> lines = this.parseTelnetResult(respText);
			List<DeviceSitePo> devices = this.getSiteDevices(lines, data);
			ServiceFacade.addSiteDevices(devices);
			ServiceFacade.setSiteHasChild(data.getId());
		} catch (Exception e) {
			logger.error("TelentListener error.", e);
			data.setRespFlag((short) 0xFE);
			data.setResponseText(e.getMessage());
		}
		data.setRequestText(String.format("ip:%s;port:%s;user:%s;pwd:%s;cmd:%s",
				data.getTelnetIP(), data.getTelnetPort(), data.getTelnetUser(), data.getTelnetPwd(),
				data.getTelnetCmd()));
		client.sendEvent(EventName.Telnet, data);
	}

	private List<String> parseTelnetResult(String respText) {
		String regex = "\\d+\\:.*?\\r";
		Matcher matcher = Pattern.compile(regex).matcher(respText);
		List<String> list = new ArrayList<String>(42);
		while (matcher.find()) {
			list.add(matcher.group());
		}
		return list;
	}

	private List<DeviceSitePo> getSiteDevices(List<String> lines, SocketIOTelnetMessage data) {
		List<DeviceSitePo> devices = new ArrayList<DeviceSitePo>(lines.size());
		for (String line : lines) {
			String newline = line.replaceAll("\\d+\\:|client (type|ip|number) is|[ ]", "");
			String[] fields = StringUtils.splitPreserveAllTokens(newline, ';');
			if (fields != null && fields.length >= 4) {
				String type = StringUtils.substring(fields[0], 0, 3);
				String decUid = String.format("%02x", Integer.valueOf(fields[2])).toUpperCase();
				String level = fields.length == 5 ? fields[4] : fields[3];
				String name = type + "-" + level;
				DeviceSitePo po = new DeviceSitePo();
				po.setApMaxLen(data.getApMaxLen());
				po.setApProtocol(data.getApProtocol());
				po.setCreateUser("admin");
				po.setDeviceType(data.getDeviceType());
				po.setFlag(1);
				po.setHasChild(false);
				po.setLocation(data.getLocation());
				po.setManufactor(data.getManufactor());
				po.setMcpMode(data.getMcpMode());
				po.setMcpProtocol(data.getMcpProtocol());
				po.setName(name);
				po.setNc(data.getNc());
				po.setPath(data.getPid().toString());
				po.setPid(data.getId());
				po.setProtocol(data.getProtocol());
				po.setSequence(10);
				po.setStatus(data.getStatus());
				po.setTg(data.getTg());
				po.setTot1(data.getTot1());
				po.setUid(data.getUid() + decUid);
				devices.add(po);
			}
		}
		devices.sort(new Comparator<DeviceSitePo>() {
			@Override
			public int compare(DeviceSitePo o1, DeviceSitePo o2) {
				return o1.getName().compareToIgnoreCase(o2.getName());
			}
		});
		return devices;
	}
}
