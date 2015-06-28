package com.wellheadstone.nemms.server;

public class StartUp {
	public static void main(String[] args) {
		int port = 8080;

		if (args.length > 0) {
			try {
				port = Integer.parseInt(args[0]);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		try {
			new WebSocketServer().run(port);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
