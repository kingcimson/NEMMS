package com.wellheadstone.nemms.server.util;

import java.io.InputStream;
import java.io.PrintStream;

import org.apache.commons.net.telnet.TelnetClient;

public class TelnetUtils {
	private TelnetClient telnet;
	private InputStream in;
	private PrintStream out;
	private String prompt;// '#' default

	public TelnetUtils() {
		this("#");
	}

	public TelnetUtils(String prompt) {
		this(prompt, "VT220");
	}

	public TelnetUtils(String prompt, String termtype) {
		this.telnet = new TelnetClient(termtype);
		this.prompt = prompt;
	}

	public void login(String ip, int port, String user, String password) {
		try {
			telnet.connect(ip, port);
			in = telnet.getInputStream();
			out = new PrintStream(telnet.getOutputStream());
			read("login:");
			write(user);
			read("password:");
			write(password);
			String rs = read(prompt);
			if (rs != null && rs.contains("Login Failed")) {
				throw new RuntimeException("登录失败");
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public String execute(String command) {
		try {
			write(command);
			return read(prompt);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void quit() {
		try {
			telnet.disconnect();
			out.close();
			in.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public String read(String pattern) {
		try {
			char lastChar = pattern.charAt(pattern.length() - 1);
			StringBuffer sb = new StringBuffer();
			char ch = (char) in.read();
			while (true) {
				sb.append(ch);
				if (ch == lastChar) {
					if (sb.toString().endsWith(pattern)) {
						return sb.toString();
					}
				}
				ch = (char) in.read();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void write(String value) {
		try {
			out.println(value);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		try {
			TelnetUtils telnetUtils = new TelnetUtils();
			telnetUtils.login("", 23, "root", "");
			String rs = telnetUtils.execute("fun display");
			telnetUtils.quit();
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
