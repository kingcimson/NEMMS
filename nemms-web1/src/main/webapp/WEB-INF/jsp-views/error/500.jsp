<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isErrorPage="true"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.StringReader"%>
<%@ page import="java.io.StringWriter"%>
<style>
.error-box {
	border: 1px solid #ddd;
	margin-top: 50px;
}
</style>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="row">
			<div class="col-sm-12">
				<div class="text-center error-box">
					<h1 class="error-text tada animated">
						<i class="fa fa-times-circle text-danger error-icon-shadow"></i> Error 500
					</h1>
					<h2 class="font-xl">
						<strong> 对不起,系统内部错误!</strong>
					</h2>
					<p style="display:none">
						<%
							if (exception == null || exception.getMessage() == null) {
								out.print("系统错误！");
							} else {
								String message = exception.getMessage();
								if (message.lastIndexOf("Exception:") > 0) {
									out.print(message.substring(message.lastIndexOf("Exception:") + 10));
								} else {
									out.print(message);
								}
								StringWriter outWriter = new StringWriter();
								exception.printStackTrace(new PrintWriter(outWriter));
								StringBuffer buffer = new StringBuffer();
								BufferedReader in = new BufferedReader(new StringReader(outWriter.toString()));
								while (true) {
									String line = in.readLine();
									if (line == null)
										break;
									buffer.append(line);
									buffer.append("<br>");
									if (buffer.length() > 3900)
										break;
								}
								out.print(buffer.toString());
							}
						%>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
