<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <script src="<c:url value="/resources/js/template.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <link href="<c:url value="/resources/css/templates.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title>Make Template</title>
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
    <div id="my_popup" style="background-color: white">
      <div class="hd"></div><table class="inputTable"><tr><td><textarea id="popup_area" class="popup_area" rows="8" cols="30" placeholder="Field description"></textarea></td></tr></table>
      <br><br>
      <ul>
        <li><button class="my_popup_close">Close</button></li>
        <li class="right_li"><button class="my_popup_close" id="add_to_form">Add to Form</button></li>
      </ul>
    </div>
    <div id="edit_popup" style="background-color: white">
      <div class="hd">Edit Element</div><table class="inputTable"><tr><td><textarea id="edit_area" rows="8" cols="30" placeholder="Field description"></textarea></td></tr></table>
      <br><br>
      <ul>
        <li><button class="edit_popup_close">Close</button></li>
        <li class="right_li"><button class="edit_popup_close" id="accept">Accept</button></li>
      </ul>
    </div>
    <div id="popup_ok">
      <div id="left_side"><img src="../../resources/images/templates/ok-icon.png"></div>
      <div id="right_side"><p>Template added!!!</p></div>
    </div>
    <div id="popup_error">
      <div id="left_side_error"><img src="../../resources/images/templates/error-icon.png"></div>
      <div id="right_side_error"><p>Oops.. something wrong=/</p></div>
    </div>
    <div id="container">
      <div id="main_screen">
        <table id="main_table">
          <tr><td colspan="2">
            <div class="hd_main">
            <table class="middle" id="title">
              <tr><td><input id="template_name" placeholder="Template name" type="text"></td></tr>
            </table>
          </div></td> </tr>
          <tr><th id="first_th">Form Controls</th><th id="second_th">Form Preview Area</th></tr>
          <tr>
            <td id="left">
              <table>
                <tr>
                  <td colspan="2"><p>Click (+) to add a field to your template form.</p></td>
                </tr>
                <tr>
                  <td>
                    <input class="form_controls" placeholder="Text Field" readonly type="text">
                  </td>
                  <td>
                    <button id="text_field" class="my_popup_open"></button>
                  </td>
                </tr>
                <tr>
                  <td>
                    <label id="check_box_field_label">Check Box
                      <input class="form_controls" type="checkbox" checked>
                    </label>
                  </td>
                  <td>
                    <button id="check_box" class="my_popup_open"></button>
                  </td>
                </tr>
                <tr>
                  <td>
                    <textarea id="text_area_form_controls" rows="3" placeholder="Text Area" readonly></textarea>
                  </td>
                  <td>
                    <button id="text_area" class="my_popup_open"></button>
                  </td>
                </tr>
              </table>
            </td>
            <td id="prev"><div id="auto_scroll"><table class="prev"></table></div></td>
          </tr>
          <tr><td></td><td id="footer">
            <ul id="footer_list">
              <li><button id="edit_button" disabled>Edit Form</button></li>
              <li><button id="save_button" disabled>Save Form</button></li></ul></td></tr>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>