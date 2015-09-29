package com.wellheadstone.nemms.server.handler.udp;

import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.ProtocolCodecFactory;
import org.apache.mina.filter.codec.ProtocolDecoder;
import org.apache.mina.filter.codec.ProtocolEncoder;

public class UdpCodecFactory implements ProtocolCodecFactory {
	private final UdpMessageEncoder encoder;
	private final UdpMessageDecoder decoder;

	public UdpCodecFactory(byte decodingDelimiter, int decodingMaxPacketLength) {
		encoder = new UdpMessageEncoder();
		decoder = new UdpMessageDecoder(decodingDelimiter, decodingMaxPacketLength);
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
