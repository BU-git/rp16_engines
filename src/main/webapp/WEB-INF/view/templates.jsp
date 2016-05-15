<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<spring:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
  <script src="<spring:url value="/resources/js/templates.js"/>"></script>
  <script src="<spring:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <link href="<spring:url value="/resources/css/templates.css"/>" rel="stylesheet" type="text/css">
  <link href="<spring:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<spring:url value="/resources/images/logo.png"/>" rel="shortcut icon" type="image/png">
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
  <title>Make Template</title>
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
    <div id="my_popup" style="background-color: white; display: none">
      <div class="hd">
      </div>
      <table class="inputTable">
        <tr><td><p class="info">Click "Add to Form" to add a field with description to the template form.</p></td></tr>
        <tr><td><textarea id="popup_area" class="popup_area" rows="8"  placeholder="Field description"></textarea></td></tr></table>
      <ul>
        <li><button class="my_popup_close">Close</button></li>
        <li class="right_li"><button class="my_popup_close" id="add_to_form">Add to Form</button></li>
      </ul>
    </div>
    <div id="edit_popup" style="background-color: white; display: none">
      <div class="hd">Edit Element</div>
      <table class="inputTable">
        <tr><td><p class="info">Click on the "Accept" button to save the changes to the form.</p></td></tr>
        <tr><td><textarea id="edit_area" rows="8" placeholder="Field description"></textarea></td></tr></table>
      <ul>
        <li><button class="edit_popup_close">Close</button></li>
        <li class="right_li"><button class="edit_popup_close" id="accept">Accept</button></li>
      </ul>
    </div>
    <div id="popup_ok" style="background-color: white; display: none">
      <div id="left_side"><img src="<spring:url value="/resources/images/templates/ok-icon.png"/>"></div>
      <div id="right_side"><p>Template added!</p></div>
    </div>
    <div id="popup_error" style="background-color: white; display: none">
      <div id="left_side_error"><img src="<spring:url value="/resources/images/templates/error-icon.png"/>"></div>
      <div id="right_side_error"><p>Oops.. something wrong=/</p></div>
    </div>
    <div id="container">
      <input type="hidden" id="count" value="${count}">
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
                      <input class="form_controls" type="checkbox" checked onclick="return false">
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
                <tr>
                <td>
                  <label id="label_form_controls">Text Label</label>
                </td>
                <td>
                  <button id="label" class="my_popup_open"></button>
                </td>
                </tr>
              </table>
            </td>
            <td id="prev">
              <div id="auto_scroll">
              <table class="prev">
                <% int a = 1; %>
                <c:if test="${fields.size() > 0}">
                  <c:forEach var="f" items="${fields}">
                    <c:if test="${f.field.id == 1}">
                      <tr class="prev_element" id="row<% out.print(a); %>">
                        <td class="action">
                          <button class="delete" id="delete<% out.print(a); %>" value="<% out.print(a); %>"></button>
                          <button class="edit_popup_open" value="<% out.print(a); %>" id="edit<% out.print(a); %>"></button>
                        </td>
                        <td>
                          <label><span  id="fieldDescription<% out.print(a); %>">${f.description}</span>
                            <input class="textField" placeholder="Text Field" readonly type="text"></label>
                          <span hidden id="fieldType<% out.print(a++); %>">text field</span>
                        </td>
                      </tr>
                    </c:if>
                    <c:if test="${f.field.id == 2}">
                      <tr class="prev_element" id="row<% out.print(a); %>">
                        <td class="action">
                          <button class="delete" id="delete<% out.print(a); %>" value="<% out.print(a); %>"></button>
                          <button class="edit_popup_open" id="edit<% out.print(a); %>" value="<% out.print(a); %>"></button>
                        </td>
                        <td>
                          <input class="checkBoxField" type="checkbox" checked onclick="return false">
                          <label id="fieldDescription<% out.print(a); %>">${f.description}</label>
                          <span hidden id="fieldType<% out.print(a++); %>">check box</span>
                        </td>
                      </tr>
                    </c:if>
                    <c:if test="${f.field.id == 3}">
                      <tr class="prev_element" id="row<% out.print(a); %>">
                        <td class="action">
                          <button class="delete" id="delete<% out.print(a); %>" value="<% out.print(a); %>"></button>
                          <button class="edit_popup_open" id="edit<% out.print(a); %>" value="<% out.print(a); %>"></button>
                        </td>
                        <td>
                          <label><span  id="fieldDescription<% out.print(a); %>">${f.description}</span>
                            <textarea rows="3" readonly class="textArea" placeholder="Text Area"></textarea></label>
                          <span hidden id="fieldType<% out.print(a++); %>">text area</span>
                        </td>
                      </tr>
                    </c:if>
                    <c:if test="${f.field.id == 4}">
                      <tr class="prev_element" id="row<% out.print(a); %>">
                        <td class="action">
                          <button class="delete" id="delete<% out.print(a); %>" value="<% out.print(a); %>"></button>
                          <button class="edit_popup_open" id="edit<% out.print(a); %>" value="<% out.print(a); %>"></button>
                        </td>
                        <td>
                          <label id="fieldDescription<% out.print(a); %>">${f.description}</label>
                          <span hidden id="fieldType<% out.print(a++); %>">text area</span>
                        </td>
                      </tr>
                    </c:if>
                  </c:forEach>
                </c:if>
              </table>
            </div>
            </td>
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