package com.wellheadstone.nemms.client;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.common.util.PropertiesUtils;

public class StartUp {

	protected final static Logger logger = LoggerFactory.getLogger(StartUp.class);

	public static void main(String[] args) {
		try {
			initializeConfiguration();
			// TcpClient.run();
			byte b = swap((byte) 0x9f);
			System.out.println(byteToBit((byte) 0x9f));
			System.out.println(byteToBit(b));
		} catch (Exception e) {
			logger.debug(e.toString());
		}
	}

	private static void initializeConfiguration() {
		PropertyConfigurator.configure("target/conf/log4j.properties");
		PropertiesUtils.configure("target/conf/resource.properties");
	}

	public static byte swap(byte x) {
		return (byte) (((x & 0XF0) >> 4) + ((x & 0XF) << 4));
	}

	public static String byteToBit(byte b) {
		return ""
				+ (byte) ((b >> 7) & 0x1) + (byte) ((b >> 6) & 0x1)
				+ (byte) ((b >> 5) & 0x1) + (byte) ((b >> 4) & 0x1)
				+ (byte) ((b >> 3) & 0x1) + (byte) ((b >> 2) & 0x1)
				+ (byte) ((b >> 1) & 0x1) + (byte) ((b >> 0) & 0x1);
	}
}
