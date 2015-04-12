package com.wellheadstone.nemms.common.serializer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

public class CustomDateTimeSerializer extends JsonSerializer<Date> {
	@Override
	public void serialize(final Date value, final JsonGenerator jsonGenerator, final SerializerProvider provider)
			throws IOException, JsonProcessingException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedDate = formatter.format(value);
		jsonGenerator.writeString(formattedDate);
	}
}
