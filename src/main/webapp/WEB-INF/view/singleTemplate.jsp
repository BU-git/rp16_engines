<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/single.template.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <title>${list.get(0).templateEntity.templateName}</title>
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
  <title>${list.get(0).templateEntity.templateName.replace("<","&lt;")}</title>
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
      <li class="menu-item">
        <a href="/users">
          All Users
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
    <div id="title_banner"><p>Template</p></div>
    <div id="content_place">
      <table id="info">
        <tr>
          <td><span>Template name:</span></td>
          <td><p>${list.get(0).templateEntity.templateName.replace("<","&lt;")}</p></td>
        </tr>
        <tr>
          <td><span>Date Created:</span></td>
          <td><p>${list.get(0).createDt}</p></td>
        </tr>
      </table>
      <table id="template">
        <% int a = 1; %>
        <tr>
          <th>#</th>
          <th>Fields</th>
        </tr>
        <c:forEach var="f" items="${list}">
          <tr><td class="number"><% out.println(a++); %></td>
            <td class="element">
              <c:if test="${f.field.id == 1}"><label>${f.description.replace("<","&lt;")}<input placeholder="Text Field" readonly type="text"></label></c:if>
              <c:if test="${f.field.id == 2}"><input type="checkbox" onclick="return false"><label>${f.description.replace("<","&lt;")}</label></c:if>
              <c:if test="${f.field.id == 3}"><label>${f.description.replace("<","&lt;")}<textarea placeholder="Text Area" readonly rows="5"></textarea></label></c:if>
              <c:if test="${f.field.id == 4}"><label>${f.description.replace("<","&lt;")}</label></c:if>
            </td></tr>
        </c:forEach>
      </table>
    </div>
  </div>
</div>
</body>
</html>