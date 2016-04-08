<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
    <script src="<c:url value="/resources/js/template.js"/>"></script>
    <link href="<c:url value="/resources/css/templates.css"/>" rel="stylesheet" type="text/css">
    <title>Make template</title>
</head>

<body>
<div id="header">
    <a href="/orders" class="left">
        <span>Orderoverzicht</span>
    </a>
    <a href="/templates" class="left">
        <span>Maak template</span>
    </a>
    <a href="/404 error" class="left">
        <span>Template overzicht</span>
    </a>
    <span style="text-align: center;">Welkom ${loggedInUser}</span>
    <a href="/logout.html" class="right">
        <span>logout</span>
    </a>
</div>
<div id="content-wrapper">
    <div id="content">
        <div id="container">
            <table class="middle" id="title"><tr><td><input id="template_name" placeholder="Template name" type="text"></td></tr></table>
            <div id="main_screen">
                <table class="middle" id="table_header"><tr><th colspan="2">Form Controls</th><th id="prev">Form Preview</th></tr></table>
                <div id="battlefield"></div>

            </div>

        </div>
    </div>
</div>

</body>
</html>
