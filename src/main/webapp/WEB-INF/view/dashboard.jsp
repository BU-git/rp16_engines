<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
    <script src="<c:url value="/resources/js/upload.js"/>"></script>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <script>
        $(window).load(function() {
            $('#menu-toggle')
                    .click(function(){
                        $('body').toggleClass('menu-on');
                    });
        });
    </script>
</head>
<body>
    <div id='menu-toggle' class='menu-toggle' style="cursor: pointer;">
        <span class='bar bar-1'></span>
        <span class='bar bar-2'></span>
        <span class='bar bar-3'></span>
    </div>

    <div id="left-menu">
        <div class="logo">
            <a href="http://www.kvt.nl/">
                <img src="<c:url value="/resources/images/logo_kvt.png"/>">
            </a>
        </div>
        <div class="left-part-container">
            <div class="left-part">
                <a href="<spring:url value="/logout"/>">
                    <div class="button">
                        Logout
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
                        Dashboard
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/orders">
                        Orders overview
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/templates">
                        Create template
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/templates/overview">
                        Templates overview
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/register">
                        New User
                    </a>
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
                <span style="text-align: center;"><h2>Welcome ${loggedInUser.name}</h2></span>
            </div>
            <div id="buttons">
                <a href="<spring:url value="/orders"/>" style="text-align: center; display: block">
                    <div class="button">Order overview</div>
                </a>
                <a href="<spring:url value="/templates"/>" style="text-align: center; display: block">
                    <div class="button">Create template</div>
                </a>
                <a href="<spring:url value="/templates/overview"/>" style="text-align: center; display: block">
                    <div class="button">Template overview</div>
                </a>
                <a href="<spring:url value="/register"/>" style="text-align: center; display: block">
                    <div class="button">New user</div>
                </a>
            </div>
            <form method="post" id="uploadForm" action="upload" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td colspan="3">
                            <legend>Upload XML files</legend>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="file" name="files[]" id="files" multiple="multiple" onchange="getFileSizeandName(this);"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <button class="btn" type="submit" id="uploadButton" onClick="CloseAndRefresh();">Upload</button>
                            <button class="btn" id="cancelButton">Cancel</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>