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
    <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
    <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
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