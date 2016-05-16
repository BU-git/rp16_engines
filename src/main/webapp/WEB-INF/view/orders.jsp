<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <meta charset="utf-8">
    <script src="<c:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.tabslet.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
    <script src="../../resources/js/jquery.ui.widget.js"></script>
    <script src="../../resources/js/jquery.iframe-transport.js"></script>
    <script src="../../resources/js/jquery.fileupload.js"></script>
    <script src="<c:url value="/resources/js/orders.js"/>"></script>
    <script src="<c:url value="/resources/js/upload.js"/>"></script>
    <link href="<c:url value="/resources/css/dashboard.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/tabslet.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/orders.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/images/logo.png"/>" rel="shortcut icon" type="image/png">
    <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/dataTables.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/upload/jquery.fileupload.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/upload/jquery.fileupload-ui.css"/>" rel="stylesheet" type="text/css">
    <script>
        $(window).load(function() {
            $('#menu-toggle')
                    .click(function(){
                        $('body').toggleClass('menu-on');
                    });

        });
        function allowDrop(event){
            $('.upload').css('border','dashed 3px #cccdce');
        }
        function leaveDrop(event){
            $('.upload').css('border','dashed 1px #cccdce')
        }
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
            <a href="<c:url value="/logout"/>">
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
                        <img src="<spring:url value="/resources/images/logo.png"/>">
                    </a>
                </div>
                <span style="text-align: center;"><h2>Welcome ${loggedInUser.name}</h2></span>
            </div>
            <div id="popup_ok" style="display: none">
                <div id="left_side"><img src="<spring:url value="/resources/images/templates/ok-icon.png"/>"></div>
                <div id="right_side"><p>Order deleted!</p></div>
            </div>
            <div id="popup_error" style="display: none">
                <div id="left_side_error"><img src="<spring:url value="/resources/images/templates/error-icon.png"/>"></div>
                <div id="right_side_error"><p>Oops.. something wrong=/</p></div>
            </div>
            <div id="title_banner"><p>Orders</p></div>
            <div class="content-place">
                <div class="upload" ondragover="allowDrop(event)" ondragleave="leaveDrop(event)" ondrop="leaveDrop(event)">
                    <span class="btn btn-success fileinput-button">
                        <i class="glyphicon glyphicon-plus"></i>
                        <span>Upload XML orders..</span>
                        <input id="fileupload" type="file" name="files[]" multiple accept="application/xml">
                    </span>
                    <br>
                    <!-- The global progress bar -->
                    <div id="progress" class="progress">
                        <div class="progress-bar" id="progress-bar"></div>
                    </div>
                    <p class="message"><span id="message"></span></p>
                    <!-- The container for the uploaded files -->
                    <div id="files" class="files"></div>
                </div>
                <div class='tabs'>
                    <ul>
                        <li><a id="all" href="#tab-1">All Orders</a></li>
                        <li><a id="not_comtleted" href="#tab-2">Not Completed</a></li>
                        <li><a id="completed" href="#tab-3">Completed</a></li>
                    </ul>
                    <div id='tab-1'>
                        <table id="table" align="center" class="display" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Order number</th>
                                <th>Service date</th>
                                <th>Status</th>
                                <th>Installation</th>
                                <th>Task</th>
                                <th>Address</th>
                                <th class="action">Action</th>
                            </tr>
                            </thead>
                            <tbody align="center">
                            </tbody>
                        </table>
                    </div>
                    <div id='tab-2'>
                        <table align="center" id="not_completed_table" class="display" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Order number</th>
                                <th>Service date</th>
                                <th>Status</th>
                                <th>Installation</th>
                                <th>Task</th>
                                <th>Address</th>
                                <th class="action">Action</th>
                            </tr>
                            </thead>
                            <tbody align="center">
                            </tbody>
                        </table>
                    </div>
                    <div id='tab-3'>
                        <table align="center" id="completed_table" class="display" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Order number</th>
                                <th>Service date</th>
                                <th>Status</th>
                                <th>Installation</th>
                                <th>Task</th>
                                <th>Address</th>
                                <th class="action">Action</th>
                            </tr>
                            </thead>
                            <tbody align="center">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>