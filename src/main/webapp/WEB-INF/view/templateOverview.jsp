<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
  <script src="<c:url value="/resources/js/modified.dataTables.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <script src="<c:url value="/resources/js/template.overview.js"/>"></script>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/template.overview.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/dataTables.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title>Template Overview</title>
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
          <img src="<spring:url value="/resources/images/logo.png"/>">
        </a>
      </div>
      <span style="text-align: center;"><h2>Welcome ${loggedInUser.name}</h2></span>
    </div>
    <div id="popup_ok" style="display: none">
      <div id="left_side"><img src="<spring:url value="/resources/images/templates/ok-icon.png"/>"></div>
      <div id="right_side"><p>Template deleted!</p></div>
    </div>
    <div id="popup_error" style="display: none">
      <div id="left_side_error"><img src="<spring:url value="/resources/images/templates/error-icon.png"/>"></div>
      <div id="right_side_error"><p>Oops.. something wrong=/</p></div>
    </div>
    <div id="title_banner"><p>Template Overview</p></div>
    <div id="content_place">
      <div id="template_overview">
        <table id="example" class="display" cellspacing="0" width="100%">
          <thead>
          <tr>
            <th>#</th>
            <th>Template Name</th>
            <th>Action</th>
          </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>