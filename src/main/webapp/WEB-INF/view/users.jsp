<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/dataTables.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/users.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/overlay.css"/>" rel="stylesheet" type="text/css">
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  <link href="<c:url value="/resources/images/logo.png"/>" rel="shortcut icon" type="image/png">
  <script src="<c:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
  <script src="<c:url value="/resources/js/modified.dataTables.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <script src="<c:url value="/resources/js/users.js"/>"></script>
    <script>
        $(window).load(function() {
            $('#menu-toggle')
                    .click(function(){
                        $('body').toggleClass('menu-on');
                    });
        });
    </script>
  <title><spring:message code="users.title"/></title>
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
    <div id="title_banner"><p><spring:message code="users.title"/></p></div>
    <div id="content_place">
      <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th><spring:message code="users.id"/></th>
            <th><spring:message code="users.name"/></th>
            <th><spring:message code="reg.email"/></th>
            <th><spring:message code="reg.number"/></th>
            <th><spring:message code="users.role"/></th>
            <th><spring:message code="orders.table.action"/></th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
  </div>
</div>
<div id="popup_ok" >
  <div id="left_side">
    <img id="warn" src="../../resources/images/templates/warn-icon.svg">
    <img id="ok" src="../../resources/images/templates/ok-icon.svg" style="display: none">
    <img id="error" src="<c:url value="/resources/images/templates/error-icon.svg"/>" style="display: none">
    <img id="spin" src="../../resources/images/templates/delete_spin.gif" style="display: none">
  </div>
  <div id="right_side">
    <div class="popup_message">
      <p id="popup_message"><spring:message code="users.confirmDelete"/> <span id="identifier"></span>?</p>
      <p id="ok_message" style="display: none"><spring:message code="users.deleted"/></p>
      <p id="error_message" style="display: none"><spring:message code="message.orders.deleteError"/></p>
      <p id="deleting_message" style="display: none"><spring:message code="message.orders.deleting"/></p>
    </div>
    <div id="buttons_c">
      <button id="no" class="confirm_popup_close"><spring:message code="label.no"/></button>
      <button id="yes"><spring:message code="label.yes"/></button>
    </div>
  </div>
</div>
<div id="edit_popup" style="background-color: white">
  <div class="hd"><spring:message code="users.edit.info"/></div>
  <table class="inputTable">
    <tr>
      <td colspan="3" class="info"><p id="info"><spring:message code="users.accpetChanges"/></p></td>
    </tr>
    <tr>
      <td class="w">
        <img class="check" id="check1" src="<spring:url value="/resources/images/templates/check-icon.png"/>">
        <img class="warn" id="warn1" src="<spring:url value="/resources/images/templates/warn-icon.png"/>">
      </td>
      <td colspan="2">
        <label class="inline" id="for_mail" for="email"><spring:message code="reg.email"/></label><input id="email" type="email">
      </td>
    </tr>
    <tr>
      <td class="w">
        <img class="check" id="check2" src="<spring:url value="/resources/images/templates/check-icon.png"/>">
        <img class="warn" id="warn2" src="<spring:url value="/resources/images/templates/warn-icon.png"/>">
      </td>
      <td colspan="2">
        <label class="inline" id="for_name" for="name"><spring:message code="users.name"/></label><input id="name" type="text">
      </td>
    </tr>
    <tr>
      <td class="w">
        <img class="check" id="check3" src="<spring:url value="/resources/images/templates/check-icon.png"/>">
      </td>
      <td colspan="2">
        <label class="inline" id="for_number" for="number"><spring:message code="reg.number"/></label><input id="number" type="text">
      </td>
    </tr>
  </table>
  <br><br>
  <ul>
    <li><button class="edit_popup_close"><spring:message code="label.close"/></button></li>
    <li class="right_li"><button id="accept"><spring:message code="label.accept"/> </button></li>
  </ul>
</div>
</body>
</html>