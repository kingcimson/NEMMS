package com.wellheadstone.nemms.server.handler.udp;

import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.CumulativeProtocolDecoder;
import org.apache.mina.filter.codec.ProtocolDecoderOutput;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.ByteObjConverter;
import com.wellheadstone.nemms.server.util.Converter;

public class UdpMessageDecoder extends CumulativeProtocolDecoder {
	private final static Logger logger = LoggerFactory.getLogger(UdpMessageDecoder.class);
	private final byte delimiter;
	private int maxPacketLength = 2048;

	public UdpMessageDecoder(byte delimiter, int maxPacketLength) {
		this.delimiter = delimiter;
		this.maxPacketLength = maxPacketLength;
	}

	@Override
	protected boolean doDecode(IoSession session, IoBuffer in, ProtocolDecoderOutput out) throws Exception {
		if (!in.hasRemaining()) {
			return false;
		}

		byte delim = this.delimiter;
		int maxLength = this.maxPacketLength;

		IoBuffer buf = IoBuffer.allocate(255);
		buf.setAutoExpand(true);

		int count = 0;
		byte flag = in.get();
		while (in.hasRemaining() && flag != delim && count < maxLength) {
			flag = in.get();
			count++;
		}
		if (flag != delim || !in.hasRemaining()) {
			return false;
		}

		count = 0;
		flag = in.get();
		if (flag != delim) {
			buf.put(flag);
			count++;
		}
		while (in.hasRemaining() && flag != delim && count < maxLength) {
			flag = in.get();
			buf.put(flag);
			count++;
		}
		buf.flip();

		if (flag != delim) {
			return false;
		}

		byte[] bytes = new byte[count - 1];
		buf.get(bytes, 0, count - 1);
		byte[] escapeBytes = ByteObjConverter.escapeDecodeBytes(bytes);
		CMCCFDSMessage msg = ByteObjConverter.bytesToObject(escapeBytes);

		if (msg == null) {
			logger.info("receive from udp device [{}] incorrect packet!", session.getRemoteAddress());
		} else {
			logger.info("receive from udp device [{}][{}] bytes:{}", session.getRemoteAddress(), escapeBytes.length,
					Converter.bytesToHexString(escapeBytes));
			out.write(msg);
		}

		return in.hasRemaining();
	}
}
