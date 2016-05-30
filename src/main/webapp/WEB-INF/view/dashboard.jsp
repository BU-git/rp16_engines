<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<spring:url value="/resources/images/logo.png"/>" rel="shortcut icon" type="image/png">
    <script src="<spring:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
    <link href="<spring:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link href="<spring:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <script>
        $(window).load(function() {
            $('#menu-toggle')
                    .click(function(){
                        $('body').toggleClass('menu-on');
                    });
        });
    </script>
    <title><spring:message code="label.title"/></title>
</head>
<body>
    <span id="locale" style="display: none"></span>
    <div id='menu-toggle' class='menu-toggle' style="cursor: pointer;">
        <span class='bar bar-1'></span>
        <span class='bar bar-2'></span>
        <span class='bar bar-3'></span>
    </div>
    <div id="left-menu">
        <div class="logo">
            <a href="http://www.kvt.nl/">
                <img src="<spring:url value="/resources/images/logo_kvt.png"/>">
            </a>
        </div>
        <div class="left-part-container">
            <div class="left-part">
                <a href="<spring:url value="/logout"/>">
                    <div class="button">
                        <spring:message code="label.logout"/>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div id="right-menu">
        <div class="sitemap">
            <ul class="site-menu">
                <li class="menu-item">
                    <a href="<spring:url value="/dashboard"/>">
                        <spring:message code="label.dashboard"/>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/orders"/>">
                        <spring:message code="label.orders"/>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/templates/new"/>">
                        <spring:message code="label.template"/>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/templates"/>">
                        <spring:message code="label.templates"/>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/users/new"/>">
                        <spring:message code="label.user"/>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/users/all"/>">
                        <spring:message code="label.users"/>
                    </a>
                </li>
            </ul>
            <ul>
                <li>
                    <span>
                        <a href="<spring:url value="?lang=en"/>">EN</a>
                    </span>
                </li>
                <li>
                    <span>
                        <a href="<spring:url value="?lang=nl"/>">NL</a>
                    </span>
                </li>
            </ul>
        </div>
    </div>
    <div id="content-wrapper" style="text-align: center; align-content: center">
        <div id="content" style="text-align: center">
            <div id="header">
                <div style="position: fixed; top: 0; left: 10px;">
                    <a href="<spring:url value="/"/>" id="logo">
                        <img src="../../resources/images/logo.png">
                    </a>
                </div>
                <span style="text-align: center;">
                    <h2>
                        <spring:message code="label.title"/> ${loggedInUser.name}
                    </h2>
                </span>
            </div>
            <div id="buttons">
                <a href="<spring:url value="/orders"/>" style="text-align: center; display: block">
                    <div class="button">
                        <spring:message code="label.orders"/>
                    </div>
                </a>
                <a href="<spring:url value="/templates/new"/>" style="text-align: center; display: block">
                    <div class="button">
                        <spring:message code="label.template"/>
                    </div>
                </a>
                <a href="<spring:url value="/templates"/>" style="text-align: center; display: block">
                    <div class="button">
                        <spring:message code="label.templates"/>
                    </div>
                </a>
                <a href="<spring:url value="/users/new"/>" style="text-align: center; display: block">
                    <div class="button">
                        <spring:message code="label.user"/>
                    </div>
                </a>
                <a href="<spring:url value="/users/all"/>" style="text-align: center; display: block">
                    <div class="button">
                        <spring:message code="label.users"/>
                    </div>
                </a>
            </div>
        </div>
    </div>
</body>
</html>