<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <script src="<c:url value="/resources/js/core.js"/>"></script>
  <script src="<c:url value="/resources/js/registration.js"/>"></script>
  <link href="<c:url value="/resources/css/registration.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title>Registration</title>
</head>
<body>
<div id="header">
  <a href="<spring:url value="/orders"/>" class="left">
    <span>Orderoverzicht</span>
  </a>
  <a href="<spring:url value="/templates"/>" class="left">
    <span>Maak template</span>
  </a>
  <a href="<spring:url value="/templates/overview"/>" class="left">
    <span>Template overzicht</span>
  </a>
  <span style="text-align: center;">Welkom ${loggedInUser.name}</span>
  <a href="<spring:url value="/logout"/>" class="right">
    <span>logout</span>
  </a>
</div>
<div id="content-wrapper">
  <div id="popup_ok">
    <div id="left_side"><img src="../../resources/images/templates/ok-icon.png"></div>
    <div id="right_side"><p>User registered!!!</p></div>
  </div>
  <div id="popup_error">
    <div id="left_side_error"><img src="../../resources/images/templates/error-icon.png"></div>
    <div id="right_side_error"><p>Oops.. something wrong=/</p></div>
  </div>
  <div id="content">
    <table id="register_form">
      <caption id="form_name">New user</caption>
      <tr><td><table>
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
            <label class="inline" id="for_password" for="password">Password</label><input id="password" type="password">
          </td>
        </tr>
        <tr>
          <td colspan="3" class="center">
            <button id="register" disabled="disabled">Submit</button>
          </td>
        </tr>
      </table></td></tr>
    </table>
  </div>
</div>
</body>
</html>