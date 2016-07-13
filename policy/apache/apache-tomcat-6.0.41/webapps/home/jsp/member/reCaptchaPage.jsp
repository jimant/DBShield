<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<html>
<head>
<title>CAPTCHA in Java using reCAPTCHA</title>
</head>
<body>
<h2>CAPTCHA in Java Application using reCAPTCHA</h2>
<form action="./validate.do" method="post">
<p>Username: <input type="text" name="user"></p>
<p>Password: <input type="password" name="password"></p>
<p>
<%
	ReCaptcha c = ReCaptchaFactory.newReCaptcha(
       		  	"6LdlHOsSAAAAAM8ypy8W2KXvgMtY2dFsiQT3HVq-", 
        		"6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY", false);
	out.print(c.createRecaptchaHtml(null, null));
%>
   <input type="submit" value="submit" />
</p>        
        </form>
</body>
</html>