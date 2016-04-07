<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order ${order.orderNumber}</title>
    <link href="<c:url value="/resources/css/order.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
  <div id="header">
        <span><a href="orders">Orderoverzicht</a></span>
        <span>Maak template</span>
        <span>Template overzicht</span>
        <span>Welkom Bob van Holland</span>
        <span><a href="logout">logout</a></span>
    </div>
    <div id="content-wrapper">
      <div id="content">
			<p>Order №${order.orderNumber} information</p>
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
                            <td><c:out value="${order.orderNumber}"/></td>
                            <td><c:out value="${order.serviceDate}"/></td>
                            <td><c:out value="${order.installation}"/></td>
                            <td><c:out value="${order.task}"/></td>
                            <td><c:out value="${order.address}"/></td>
                        </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
