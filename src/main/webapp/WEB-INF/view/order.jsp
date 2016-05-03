<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order ${order.number}</title>
    <link href="<c:url value="/resources/css/order.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
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
			<p>Order №${order.number} information</p>
			 <table align="center" id="table" class="display" cellspacing="0">
                <thead>
                    <tr>
                        <th colspan=2>Order Number</th>
                        <th>Service date</th>
                        <th>Task</th>
                        <th>Address</th>
                        <th>Installation</th>
                     </tr>
                </thead>
                <tbody align="center">
                        <tr>
                            <td>
                                <c:if test="${order.done == true}">
                                    <img src="../../resources/images/yes.png">
                                </c:if>
                                <c:if test="${order.done == false}">
                                    <img src="../../resources/images/no.png">
                                </c:if>
                            </td>
                            <td><c:out value="${order.number}"/></td>
                            <td><c:out value="${order.date}"/></td>
                            <td><c:out value="${order.installation.name}"/></td>
                            <td><c:out value="${order.tasks}"/></td>
                            <td><c:out value="${order.relation.town}"/></td>
                        </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>