package com.wellheadstone.nemms.server.handler.tcp;

import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.ProtocolEncoderAdapter;
import org.apache.mina.filter.codec.ProtocolEncoderOutput;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.ByteObjConverter;
import com.wellheadstone.nemms.server.util.Converter;

public class TcpMessageEncoder extends ProtocolEncoderAdapter {
	private final static Logger logger = LoggerFactory.getLogger(TcpMessageEncoder.class);

	@Override
	public void encode(IoSession session, Object message, ProtocolEncoderOutput out) throws Exception {
		byte[] bytes = ByteObjConverter.objectToBytes((CMCCFDSMessage) message);
		out.write(IoBuffer.wrap(bytes, 0, bytes.length));

		logger.info("send to tcp device [{}][{}] bytes:{}", session.getRemoteAddress(), bytes.length,
				Converter.bytesToHexString(bytes));

	}
}
