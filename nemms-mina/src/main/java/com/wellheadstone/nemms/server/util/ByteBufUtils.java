package com.wellheadstone.nemms.server.util;

import io.netty.buffer.ByteBuf;

public class ByteBufUtils {
	public static byte[] toBytes(ByteBuf byteBuf) {
		byte[] bytes = new byte[byteBuf.readableBytes()];
		byteBuf.readBytes(bytes);
		return bytes;
	}
}
