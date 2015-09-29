package com.wellheadstone.nemms.server.handler.tcp;

import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.ProtocolCodecFactory;
import org.apache.mina.filter.codec.ProtocolDecoder;
import org.apache.mina.filter.codec.ProtocolEncoder;

public class TcpCodecFactory implements ProtocolCodecFactory {
	private final TcpMessageEncoder encoder;
	private final TcpMessageDecoder decoder;

	public TcpCodecFactory(byte decodingDelimiter, int decodingMaxPacketLength) {
		encoder = new TcpMessageEncoder();
		decoder = new TcpMessageDecoder(decodingDelimiter, decodingMaxPacketLength);
	}

	@Override
	public ProtocolEncoder getEncoder(IoSession session) throws Exception {
		return this.encoder;
	}

	@Override
	public ProtocolDecoder getDecoder(IoSession session) throws Exception {
		return this.decoder;
	}

}
