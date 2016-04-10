<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <script src="<c:url value="/resources/js/template.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <link href="<c:url value="/resources/css/templates.css"/>" rel="stylesheet" type="text/css">
  <title>Make template</title>
</head>
<body>
<div id="header">
  <a href="/orders" class="left">
    <span>Orderoverzicht</span>
  </a>
  <a href="/templates" class="left">
    <span>Maak template</span>
  </a>
  <a href="/404 error" class="left">
    <span>Template overzicht</span>
  </a>
  <span style="text-align: center;">Welkom ${loggedInUser}</span>
  <a href="/logout.html" class="right">
    <span>logout</span>
  </a>
</div>
<div id="content-wrapper">
  <div id="content">
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

    <div id="container">
      <div class="hd_main">
        <table class="middle" id="title">
          <tr><td><input id="template_name" placeholder="Template name" type="text"></td></tr>
        </table>
      </div>
      <div id="main_screen" class="foo">
        <table id="main_table"><tr><th id="first_th">Form Controls</th><th id="second_th">Form Preview Area</th></tr>
          <tr>
            <td id="left">
              <table>
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
                    <textarea id="text_area_form_controls" cols="19" rows="3" placeholder="Text Area" readonly></textarea>
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
