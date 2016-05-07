<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order ${order.number}</title>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/order.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
</head>
<body>
<div id="header">
    <div>
        <a href="<spring:url value="/"/>" id="logo">
            <img src="../../resources/images/logo.png">
        </a>
    </div>
    <a href="<spring:url value="/dashboard"/>">
        <span>Dashboard</span>
    </a>
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
    <a href="<spring:url value="/register"/>">New User</a>
    <a href="<spring:url value="/logout"/>" class="right">
        <span>logout</span>
    </a>
</div>
    <div id="content-wrapper">
      <div id="content">
          <p id="image">
            <c:if test="${order.orderStatus == 2 || order.orderStatus == 3}">
                <img src="../../resources/images/yes.png">
            </c:if>
            <c:if test="${order.orderStatus == 0 || order.orderStatus == 1}">
                <img src="../../resources/images/no.png">
            </c:if>
            Order №${order.number} information
          </p>
          <div id="rawtable">
			 <table align="center" id="order">
                 <tr>
                    <td>Number:</td>
                    <td>${order.number}</td>
                    <td>Date:</td>
                    <td>
                        <fmt:formatDate value="${order.date}" pattern="dd-MM-yyyy" />
                    </td>
                 </tr>
                 <tr>
                     <td>Contact person:</td>
                     <td>${order.relation.contactPerson}</td>
                     <td>Town:</td>
                     <td>${order.relation.town}</td>
                 </tr>
                 <tr>
                     <td>Phone number:</td>
                     <td>${order.relation.telephone}</td>
                     <td>Installation name:</td>
                     <td>${order.installation.name}</td>
                 </tr>
                 <tr>
                     <td>Installation address:</td>
                     <td>${order.installation.address}</td>
                     <td>Reference:</td>
                     <td>${order.reference}</td>
                 </tr>
                 <tr>
                     <td>Employee:</td>
                     <td>${order.employee.name}</td>
                     <td>Email:</td>
                     <td>${order.employee.email}</td>
                 </tr>
            </table>
          </div>
          <c:if test="${order.orderStatus == 0 || order.orderStatus == 1}">
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
          </c:if>
        </div>
    </div>
</body>
</html>