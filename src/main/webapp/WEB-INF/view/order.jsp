<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order ${order.number}</title>
    <link href="<c:url value="/resources/css/order.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
    <script src="<c:url value="/resources/js/jquery-1.12.3.min.js"/>"></script>
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
                        <img src="../../resources/images/logo.png">
                    </a>
                </div>
                <span style="text-align: center;"><h2>Welcome ${loggedInUser.name}</h2></span>
            </div>
            <div id="title_banner"><p>Order</p></div>
            <div class="content-place">
                <p id="image">
                    <c:if test="${order.orderStatus == 3}">
                        <img src="../../resources/images/yes.svg">
                    </c:if>
                    <c:if test="${order.orderStatus != 3}">
                        <img src="../../resources/images/no.svg">
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
                        <tr>
                            <td>Template name:</td>
                            <td>
                                <c:if test="${order.customTemplateID == 0}">
                                    Default template
                                </c:if>
                                <input form="form" type="hidden" name="oldName" value="default">
                                <c:if test="${order.customTemplateID != 0}">
                                    <c:forEach var="temp" items="${allTemplates}">
                                        <c:if test="${order.customTemplateID == temp.id}">
                                            <input form="form" type="hidden" name="oldName" value="${temp.templateName}">
                                            ${temp.templateName}
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </td>
                            <td>Template ID:</td>
                            <td>${order.customTemplateID}</td>
                        </tr>
                    </table>
                </div>
                <c:if test="${order.orderStatus == 0}">
                    <table id="select-form" cellspacing="0" cellpadding="0">
                        <tr id="select">
                            <td>
                                <label>Employee
                                    <select form="form" name="email">
                                        <c:forEach var="user" items="${allUsers}">
                                            <option
                                            <c:if test="${order.employee.email.equals(user.email)}">selected</c:if>
                                            value="${user.email}" >${user.name} (${user.email})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </td>
                            <td id="left">
                                <label>Template
                                    <select name="name" form="form">
                                        <option selected value="default">Default template</option>
                                        <c:forEach var="temp" items="${allTemplates}">
                                            <c:if test="${temp.active == true}">
                                                <option
                                                <c:if test="${temp.id == order.customTemplateID}">selected</c:if>
                                                value="${temp.templateName}" >${temp.templateName}
                                                </option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </label>
                            </td>
                        </tr>
                        <tr id="hr">
                            <td colspan="2"><hr></td>
                        </tr>
                        <tr id="set">
                            <td>
                                <button onclick="window.location.href='/orders/'">Back</button>
                            </td>
                            <td>
                                <input form="form" type="submit" value="Accept"/>
                            </td>
                        </tr>
                    </table>
                </c:if>
                <c:if test="${order.orderStatus != 0}">
                    <p align="center" style="color: red">${warning}</p>
                </c:if>
                <form id="form" method="post" action="<spring:url value="/order/assign"/>">
                    <input type="hidden" name="oldEmail" value="${order.employee.email}">
                    <input type="hidden" name="id" value="${order.number}">
                </form>
            </div>
        </div>
    </div>
</body>
</html>