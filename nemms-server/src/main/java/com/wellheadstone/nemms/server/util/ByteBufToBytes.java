package com.wellheadstone.nemms.server.util;

import io.netty.buffer.ByteBuf;

public class ByteBufToBytes {
	public static byte[] read(ByteBuf datas) {
		byte[] bytes = new byte[datas.readableBytes()];
		datas.readBytes(bytes);
		return bytes;
	}
}
