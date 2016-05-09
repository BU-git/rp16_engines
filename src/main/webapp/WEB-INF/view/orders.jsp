<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <meta charset="utf-8">
    <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
    <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
    <script>
        $(window).load(function() {
            $('#menu-toggle')
                    .click(function(){
                        $('body').toggleClass('menu-on');
                    });
        });
        $(document).ready(function() {
            var table = $('#table');
            table.DataTable();
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

            <table align="center" id="table" class="display" cellspacing="0">
                <thead>
                    <tr>
                        <th>Ordernummer</th>
                        <th>Service datum</th>
                        <th>Installatie</th>
                        <th>Taak</th>
                        <th>Adres</th>
                        <th>Info</th>
                        <th>Pdf</th>
                    </tr>
                </thead>
                <tbody align="center">
                    <c:forEach var="order" items="${allOrders}">
                        <tr>
                            <td>
                                <c:if test="${order.orderStatus == 2 || order.orderStatus == 3}">
                                    <img src="../../resources/images/yes.png">
                                </c:if>
                                <c:if test="${order.orderStatus == 0 || order.orderStatus == 1}">
                                    <img src="../../resources/images/no.png">
                                </c:if>
                                <c:out value="${order.number}"/>
                            </td>
                            <td> <fmt:formatDate value="${order.date}" pattern="dd-MM-yyyy" /></td>
                            <td><c:out value="${order.installation.name}"/></td>
                            <td>
                                <c:forEach var="task" items="${order.tasks}">
                                    <c:out value="${task.ltxa1}"/>
                                </c:forEach>
                            </td>
                            <td><c:out value="${order.relation.town}"/></td>
                            <td>
                                <a href="/orders/${order.number}">
                                    <img src="../../resources/images/info.png">
                                </a>
                            </td>
                            <td>
                                <a href="/orders/download/${order.number}">
                                    <img src="../../resources/images/pdf.png">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:out value="${message}"/>
        </div>
    </div>
</body>
</html>
