<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="order.title"/> ${order.number}</title>
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
            <p id="image">
                <c:if test="${order.orderStatus == 3}">
                    <img src="../../resources/images/yes.svg">
                </c:if>
                <c:if test="${order.orderStatus != 3}">
                    <img src="../../resources/images/no.svg">
                </c:if>
                <spring:message code="order.title"/> №${order.number} <spring:message code="order.information"/>
            </p>
            <div id="rawtable">
                 <table align="center" id="order">
                     <tr>
                        <td><spring:message code="order.number"/></td>
                        <td>${order.number}</td>
                        <td><spring:message code="order.date"/></td>
                        <td>
                            <fmt:formatDate value="${order.date}" pattern="dd-MM-yyyy" />
                        </td>
                     </tr>
                     <tr>
                         <td><spring:message code="order.person"/></td>
                         <td>${order.relation.contactPerson}</td>
                         <td><spring:message code="order.town"/></td>
                         <td>${order.relation.town}</td>
                     </tr>
                     <tr>
                         <td><spring:message code="order.phone"/></td>
                         <td>${order.relation.telephone}</td>
                         <td><spring:message code="order.installation"/></td>
                         <td>${order.installation.name}</td>
                     </tr>
                     <tr>
                         <td><spring:message code="order.installation.address"/></td>
                         <td>${order.installation.address}</td>
                         <td><spring:message code="order.reference"/></td>
                         <td>${order.reference}</td>
                     </tr>
                     <tr>
                         <td><spring:message code="order.employee"/></td>
                         <td>${order.employee.name}</td>
                         <td><spring:message code="order.email"/></td>
                         <td>${order.employee.email}</td>
                     </tr>
                     <tr>
                         <td><spring:message code="order.templateName"/></td>
                         <td>
                            <c:if test="${order.customTemplateID == 0}">
                                 <spring:message code="order.defaultTemplate"/>
                            </c:if>
                            <c:if test="${order.customTemplateID != 0}">
                                <c:forEach var="temp" items="${allTemplates}">
                                    <c:if test="${order.customTemplateID == temp.id}">
                                        ${temp.templateName}
                                    </c:if>
                                </c:forEach>
                            </c:if>
                         </td>
                         <td><spring:message code="order.templateID"/></td>
                         <td>${order.customTemplateID}</td>
                     </tr>
                </table>
            </div>
            <c:if test="${order.orderStatus == 0}">
                  <table id="select-form">
                      <tr>
                      <td>
                      <form method="post" action="/assignEmployee/${order.number}">
                          <select name="email" required>
                              <option value="" disabled selected><spring:message code="order.selectEmploee"/></option>
                              <c:forEach var="user" items="${allUsers}">
                                  <option value="${user.email}">${user.name} (${user.email})</option>
                              </c:forEach>
                          </select>
                          <input type="submit" value="Set" />
                      </form>
                      </td>
                      <td>
                      <form method="post" action="/assignTemplate/${order.number}">
                          <select name="name" required>
                               <option value="" disabled selected><spring:message code="order.selectTemplate"/></option>
                               <option value="default"><spring:message code="order.defaultTemplate"/></option>
                               <c:forEach var="temp" items="${allTemplates}">
                                   <option value="${temp.templateName}">${temp.templateName}</option>
                               </c:forEach>
                          </select>
                          <input type="submit" value="Set" />
                      </form>
                      </td>
                      </tr>
                  </table>
            </c:if>
            <c:if test="${order.orderStatus != 0}">
                <p align="center" style="color: red">${warning}</p>
            </c:if>
        </div>
    </div>
</body>
</html>