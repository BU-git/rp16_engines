<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/jquery.dataTables.min.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/users.css"/>" rel="stylesheet" type="text/css">
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <script src="<c:url value="/resources/js/users.js"/>"></script>
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title>Users</title>
</head>
<body>
<div id="header">
  <div>
    <a href="<spring:url value="/"/>" id="logo">
      <img src="../../resources/images/logo.png">
    </a>
  </div>
  <a href="<spring:url value="/dashboard"/>">
    <span>Dashboard</span>
  </a>
  <a href="<spring:url value="/orders"/>" class="left">
    <span>Orderoverzicht</span>
  </a>
  <a href="<spring:url value="/templates"/>" class="left">
    <span>Maak template</span>
  </a>
  <a href="<spring:url value="/templates/overview"/>" class="left">
    <span>Template overzicht</span>
  </a>
  <span style="text-align: center;">Welkom ${loggedInUser.email}</span>
  <a href="<spring:url value="/register"/>">New User</a>
  <a href="<spring:url value="/logout"/>" class="right">
    <span>logout</span>
  </a>
</div>
<div id="edit_popup" style="background-color: white">
  <div class="hd">Edit User Info</div>
  <table class="inputTable">
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