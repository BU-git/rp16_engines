<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order ${order.number}</title>
    <link href="<c:url value="/resources/css/order.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
<div id="header">
    <a href="<spring:url value="/orders"/>" class="left">
        <span>Orderoverzicht</span>
    </a>
    <a href="<spring:url value="/templates"/>" class="left">
        <span>Maak template</span>
    </a>
    <a href="/404 error" class="left">
        <span>Template overzicht</span>
    </a>
    <span style="text-align: center;">Welkom ${loggedInUser.email}</span>
    <a href="<spring:url value="/logout"/>" class="right">
        <span>logout</span>
    </a>
</div>
    <div id="content-wrapper">
      <div id="content">
			 <table align="center" id="order">
                 <tr>
                    <td>Number</td>
                    <td>${order.number}</td>
                    <td>Date</td>
                    <td>${order.date}</td>
                 </tr>
                 <tr>
                     <td>Relation</td>
                     <td>${order.relation.town}</td>
                     <td>Reference</td>
                     <td>${order.reference}</td>
                 </tr>
                 <tr>
                     <td>Parts</td>
                     <td>${order.parts}</td>
                     <td>Installation</td>
                     <td>${order.installation.address}</td>
                 </tr>
                 <tr>
                     <td>Phone number</td>
                     <td>${order.relation.telephone}</td>
                     <td>Parts</td>
                     <td>${order.parts}</td>
                 </tr>
                 <tr>
                     <td>Employee</td>
                     <td>${order.employee.name}</td>
                     <td>Date</td>
                     <td>${order.date}</td>
                 </tr>
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
            </table>
          <div id="select-form">
            <cf:form method="post" action="/changeOrder/${order.number}" modelAttribute="user">
                <cf:select path="email">
                <cf:option value="" disabled="true" selected="true">Select employee</cf:option>
                <c:forEach var="user" items="${allUsers}">
                    <cf:option value="${user.email}">${user.name} (${user.email})</cf:option>
                </c:forEach>
                 </cf:select>
                <input type="submit" value="Change" />
            </cf:form>
          </div>
        </div>
    </div>
</body>
</html>