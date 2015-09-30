package com.wellheadstone.nemms.server.handler.udp;

import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.ProtocolEncoderAdapter;
import org.apache.mina.filter.codec.ProtocolEncoderOutput;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.CodecUtils;
import com.wellheadstone.nemms.server.util.Converter;

public class UdpMessageEncoder extends ProtocolEncoderAdapter {
	private final static Logger logger = LoggerFactory.getLogger(UdpMessageEncoder.class);

	@Override
	public void encode(IoSession session, Object message, ProtocolEncoderOutput out) throws Exception {
		byte[] bytes = CodecUtils.messageToBytes((CMCCFDSMessage) message);
		out.write(IoBuffer.wrap(bytes, 0, bytes.length));

		logger.info("send to udp device [{}][{}] bytes:{}",
				session.getRemoteAddress(), bytes.length, Converter.bytesToHexString(bytes));

	}
}
