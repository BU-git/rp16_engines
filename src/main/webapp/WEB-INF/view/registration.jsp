<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>
  <script src="<c:url value="/resources/js/registration.js"/>"></script>
  <link href="<c:url value="/resources/css/registration.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/overlay.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title><spring:message code="reg.title"/></title>
  <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
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
          <hr>
        </li>
        <li class="menu-item">
          <a href="<spring:url value="/orders"/>">
            <spring:message code="label.orders"/>
          </a>
        </li>
        <li class="menu-item">
          <hr>
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
          <hr>
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
        <li class="menu-item">
          <hr>
        </li>
        <li class="menu-item">
          <span style="color: white">
              <a href="<spring:url value="?lang=en"/>">EN</a>
          </span>
          <span style="color: white"><strong>&nbsp;|&nbsp;</strong></span>
          <span style="color: white">
              <a href="<spring:url value="?lang=nl"/>">NL</a>
          </span>
        </li>
      </ul>
    </div>
  </div>
  <div id="content-wrapper" style="text-align: center; align-content: center">
    <div id="content">
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
    <div id="popup_ok" >
      <div id="left_side">
        <img id="ok" src="../../resources/images/templates/ok-icon.svg">
      </div>
      <div id="right_side">
        <div class="popup_message">
          <p id="ok_message"><spring:message code="reg.registered"/></p>
        </div>
      </div>
    </div>
    <div id="popup_error">
      <div id="left_side_error"><img src="<c:url value="/resources/images/templates/error-icon.svg"/>"></div>
      <div id="right_side_error"><p><spring:message code="message.orders.deleteError"/></p></div>
    </div>

    <div id="register_form">
      <div id="title_banner"><p><spring:message code="reg.newUser"/></p></div>
      <div id="reg">
        <table>
          <tr>
            <td class="w">
              <img class="check" id="check1" src="<c:url value="/resources/images/templates/check-icon.png"/>">
              <img class="warn" id="warn1" src="<c:url value="/resources/images/templates/warn-icon.png"/>">
            </td>
            <td colspan="2">
              <label class="inline" id="for_mail" for="email"><spring:message code="reg.email"/></label><input id="email" type="email">
            </td>
          </tr>
          <tr>
            <td class="w">
              <img class="check" id="check2" src="<c:url value="/resources/images/templates/check-icon.png"/>">
              <img class="warn" id="warn2" src="<c:url value="/resources/images/templates/warn-icon.png"/>">
            </td>
            <td>
              <label class="inline" id="for_name" for="name"><spring:message code="reg.name"/></label><input id="name" type="text">
            </td>
            <td id="inline">
              <div class="role">
                <input id='role' value="admin" type="checkbox">
              </div>
              <div id="label"><label id="for_role"><spring:message code="reg.admin"/></label></div>
            </td>
          </tr>
          <tr>
            <td class="w">
              <img class="warn" id="warn3" src="<c:url value="/resources/images/templates/warn-icon.png"/>">
              <img class="check" id="check3" src="<c:url value="/resources/images/templates/check-icon.png"/>">
            </td>
            <td colspan="2">
              <label class="inline" id="for_password" for="password"><spring:message code="label.login.password"/></label><input id="password" type="password">
            </td>
          </tr>
          <tr>
            <td class="w">
              <img class="warn" id="warn4" src="<c:url value="/resources/images/templates/warn-icon.png"/>">
              <img class="check" id="check4" src="<c:url value="/resources/images/templates/check-icon.png"/>">
            </td>
            <td colspan="2">
              <label class="inline" id="for_password_confirmation" for="password_confirmation"><spring:message code="reg.confirmPassword"/></label>
              <input id="password_confirmation" type="password" disabled>
            </td>
          </tr>
          <tr>
            <td class="w">
            </td>
            <td colspan="2">
              <label class="inline" id="for_number" for="number"><spring:message code="reg.number"/></label><input id="number" type="text">
            </td>
          </tr>
          <tr>
            <td colspan="3" class="center">
              <button id="register" disabled="disabled"><spring:message code="reg.submit"/></button>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  </div>
</body>
</html>