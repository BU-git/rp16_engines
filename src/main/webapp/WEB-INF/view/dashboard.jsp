<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
    <div id="header">
        <span>Orderoverzicht</span>
        <span>Maak template</span>
        <span>Template overzicht</span>
        <span>Welkom Bob van Holland</span>
        <span>logout</span>
    </div>
    <div id="content-wrapper">
        <div id="content">

            <center>Welcome ${loggedInUser}</center>
        </div>
    </div>
</body>
</html>