<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<spring:url value="/resources/images/logo.png"/>" rel="shortcut icon" type="image/png">
    <script src="<spring:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
    <script src="<spring:url value="/resources/js/upload.js"/>"></script>
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
    <title>Welcome</title>
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
                <img src="<spring:url value="/resources/images/logo_kvt.png"/>">
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
                    <a href="<spring:url value="/orders"/>">
                        Orders overview
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/templates/new"/>">
                        Create template
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/templates"/>">
                        Templates overview
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/users/new"/>">
                        New User
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<spring:url value="/users/all"/>">
                        Users
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
                <a href="<spring:url value="/templates/new"/>" style="text-align: center; display: block">
                    <div class="button">Create template</div>
                </a>
                <a href="<spring:url value="/templates"/>" style="text-align: center; display: block">
                    <div class="button">Template overview</div>
                </a>
                <a href="<spring:url value="/users/new"/>" style="text-align: center; display: block">
                    <div class="button">New user</div>
                </a>
                <a href="<spring:url value="/users/all"/>" style="text-align: center; display: block">
                    <div class="button">Users</div>
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
</body>
</html>