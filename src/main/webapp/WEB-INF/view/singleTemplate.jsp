<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/single.template.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title>${list.get(0).templateEntity.templateName}</title>
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
  <span style="text-align: center;">Welkom ${loggedInUser.email}</span>
  <a href="<spring:url value="/logout"/>" class="right">
    <span>logout</span>
  </a>
</div>
<div id="content-wrapper">
  <div id="content">
    <div id="title_banner"><p>Template</p></div>
    <div id="content_place">
      <table id="info">
        <tr>
          <td><span>Template name:</span></td>
          <td><p>${list.get(0).templateEntity.templateName}</p></td>
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
              <c:if test="${f.field.id == 1}"><label>${f.description}<input placeholder="Text Field" readonly type="text"></label></c:if>
              <c:if test="${f.field.id == 2}"><input type="checkbox"><label>${f.description}</label></c:if>
              <c:if test="${f.field.id == 3}"><label>${f.description}<textarea placeholder="Text Area" readonly rows="5"></textarea></label></c:if>
            </td></tr>
        </c:forEach>
      </table>
    </div>
  </div>
</div>
</body>
</html>