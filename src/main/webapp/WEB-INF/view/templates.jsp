<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
  <script src="<c:url value="/resources/js/templates.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.popupoverlay.js"/>"></script>
  <link href="<c:url value="/resources/css/templates.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/overlay.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/images/logo.png"/>" rel="shortcut icon" type="image/png">
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
  <title><spring:message code="template.make"/></title>
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
    <div id="my_popup" style="background-color: white; display: none">
      <div class="hd">
      </div>
      <table class="inputTable">
        <tr>
          <td>
            <p class="info"><spring:message code="template.create.info"/></p>
          </td>
        </tr>
        <tr>
          <td>
            <textarea id="popup_area" class="popup_area" rows="8" placeholder="Field description"></textarea>
          </td>
        </tr>
      </table>
      <ul>
        <li><button class="my_popup_close">Close</button></li>
        <li class="right_li"><button class="my_popup_close" id="add_to_form"><spring:message code="template.addToForm"/></button></li>
      </ul>
    </div>
    <div id="edit_popup" style="background-color: white; display: none">
      <div class="hd"><spring:message code="template.edit"/></div>
      <table class="inputTable">
        <tr><td><p class="info"><spring:message code="template.info.accept"/></p></td></tr>
        <tr><td><textarea id="edit_area" rows="8" placeholder="Field description"></textarea></td></tr></table>
      <ul>
        <li><button class="edit_popup_close"><spring:message code="label.close"/></button></li>
        <li class="right_li"><button class="edit_popup_close" id="accept"><spring:message code="label.accept"/></button></li>
      </ul>
    </div>
    <div id="popup_ok" style="background-color: white; display: none">
      <div id="left_side"><img src="<c:url value="/resources/images/templates/ok-icon.svg"/>"></div>
      <div id="right_side"><p id="right_ok"><spring:message code="template.added"/></p></div>
    </div>
    <div id="popup_error" style="background-color: white; display: none">
      <div id="left_side_error"><img src="<c:url value="/resources/images/templates/error-icon.svg"/>"></div>
      <div id="right_side_error"><p><spring:message code="message.orders.deleteError"/></p></div>
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
          <tr>
            <th id="first_th"><spring:message code="template.form"/></th>
            <th id="second_th"><spring:message code="template.preview"/></th>
          </tr>
          <tr>
            <td id="left">
              <table>
                <tr>
                  <td colspan="2"><p><spring:message code="template.info.add"/></p></td>
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
                    <label id="check_box_field_label"><spring:message code="template.checkBox"/>
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
                  <label id="label_form_controls"><spring:message code="template.label"/></label>
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
                          <label><span  id="fieldDescription<% out.print(a); %>">${f.description.replace("<","&lt;")}</span>
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
                          <label id="fieldDescription<% out.print(a); %>">${f.description.replace("<","&lt;")}</label>
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
                          <label><span  id="fieldDescription<% out.print(a); %>">${f.description.replace("<","&lt;")}</span>
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
                          <label id="fieldDescription<% out.print(a); %>">${f.description.replace("<","&lt;")}</label>
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
              <li><button id="edit_button" disabled><spring:message code="template.editForm"/></button></li>
              <li><button id="save_button" disabled><spring:message code="template.saveForm"/></button></li></ul></td></tr>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>