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

	@Override
	protected boolean doDecode(IoSession session, IoBuffer in, ProtocolDecoderOutput out) throws Exception {
		byte[] bytes = in.array();
		byte[] escapeBytes = ByteObjConverter.escapeDecodeBytes(bytes);
		CMCCFDSMessage msg = ByteObjConverter.bytesToObject(escapeBytes);

		if (msg == null) {
			logger.info("receive from tcp device [{}] incorrect packet!", session.getRemoteAddress());
		} else {
			logger.info("receive from tcp device [{}][{}] bytes:{}", session.getRemoteAddress(), escapeBytes.length,
					Converter.bytesToHexString(escapeBytes));
			out.write(msg);
		}
		return false;
	}
}
