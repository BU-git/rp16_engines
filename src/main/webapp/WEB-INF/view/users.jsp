<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/modified.dataTables.min.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/users.css"/>" rel="stylesheet" type="text/css">
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <script src="<c:url value="/resources/js/modified.dataTables.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <script src="<c:url value="/resources/js/users.js"/>"></script>
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
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
  <title>Users</title>
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
<div id="popup_ok" style="display: none">
  <div id="left_side"><img src="../../resources/images/templates/ok-icon.png"></div>
  <div id="right_side"><p>User deleted!</p></div>
</div>
<div id="popup_error" style="display: none">
  <div id="left_side_error"><img src="../../resources/images/templates/error-icon.png"></div>
  <div id="right_side_error"><p>Oops.. something wrong=/</p></div>
</div>
<div id="edit_popup" style="background-color: white">
  <div class="hd">Edit User Info</div>
  <table class="inputTable">
    <tr>
      <td colspan="3" class="info"><p id="info">Click 'Accept' to save the changes for the current user.</p></td>
    </tr>
    <tr>
      <td class="w">
        <img class="check" id="check1" src="../../resources/images/templates/check-icon.png">
        <img class="warn" id="warn1" src="../../resources/images/templates/warn-icon.png">
      </td>
      <td colspan="2">
        <label class="inline" id="for_mail" for="email">Email</label><input id="email" type="email">
      </td>
    </tr>
    <tr>
      <td class="w">
        <img class="check" id="check2" src="../../resources/images/templates/check-icon.png">
        <img class="warn" id="warn2" src="../../resources/images/templates/warn-icon.png">
      </td>
      <td>
        <label class="inline" id="for_name" for="name">Name</label><input id="name" type="text">
      </td>
      <td id="inline">
        <div class="role">
          <input id='role' value="admin" type="checkbox">
        </div>
        <div id="label"><label id="for_role">Admin</label></div>
      </td>
    </tr>
    <tr>
      <td class="w">
        <img class="warn" id="warn3" src="../../resources/images/templates/warn-icon.png">
        <img class="check" id="check3" src="../../resources/images/templates/check-icon.png">
      </td>
      <td colspan="2">
        <label class="inline" id="for_number" for="number">Number</label><input id="number" type="number">
      </td>
    </tr>
  </table>
  <br><br>
  <ul>
    <li><button class="edit_popup_close">Close</button></li>
    <li class="right_li"><button id="accept">Accept</button></li>
  </ul>
</div>
<div id="content-wrapper">
  <div id="content">
    <div id="header">
      <div style="position: fixed; top: 0; left: 10px;">
        <a href="<spring:url value="/"/>" id="logo">
          <img src="../../resources/images/logo.png">
        </a>
      </div>
      <span style="text-align: center;"><h2>Welcome ${loggedInUser.name}</h2></span>
    </div>
    <div id="title_banner"><p>Users</p></div>
    <div id="content_place">
      <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Email</th>
          <th>Number</th>
          <th>Role</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>