<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" 	prefix="cf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	<link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
	<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
	<div id="login-form">
		<h1>Authorization form</h1>
		<fieldset>
			<c:choose>
				<c:when test="${message != null}">
					<p id="message">${message}</p><br>
				</c:when>
				<c:otherwise>
					<p id="message"></p><br>
				</c:otherwise>
			</c:choose>
			<cf:form id="loginForm" method="post" action="/dashboard" modelAttribute="user">
			<cf:label path="email"><p>Please enter your email</p></cf:label>
			<cf:input id="mail" name="email" path="email" /><br>
			<cf:label path="passwordHash"><p>Password</p></cf:label>
			<cf:password id="passwordHash" name="passwordHash" path="passwordHash" /><br>
			<input type="submit" value="Login" />
			</cf:form>
		</fieldset>
	</div>
</body>
</html>