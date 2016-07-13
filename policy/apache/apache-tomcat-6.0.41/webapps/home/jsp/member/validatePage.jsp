<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse"%>
<html>
<head>
<title>CAPTCHA in Java using reCAPTCHA</title>
</head>
<body>
<h2>CAPTCHA in Java Application using reCAPTCHA</h2>
<p>
	<%
		String remoteAddr = request.getRemoteAddr();
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY");

		String challenge = request
				.getParameter("recaptcha_challenge_field");
		String uresponse = request.getParameter("recaptcha_response_field");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(
				remoteAddr, challenge, uresponse);

		if (reCaptchaResponse.isValid()) {
			String user = request
					.getParameter("user");
			out.print("CAPTCHA Validation Success! User "+user+" registered.");
		} else {
			out.print("CAPTCHA Validation Failed! Try Again.");
		}
	%>
</p>
<a href=".">Home</a>	
</body>
</html>