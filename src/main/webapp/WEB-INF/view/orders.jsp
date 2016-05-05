<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <meta charset="utf-8">
    <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
    <script>
        $(document).ready(function() {
            var table = $('#table');
            table.DataTable();

            /*$('#table tbody').on('click', 'tr', function () {

            });*/
        });
    </script>
</head>
<body>
    <div id="header">
        <a href="/dashboard">
            <span>Dashboard</span>
        </a>
        <a href="/templates">
            <span>Template</span>
        </a>
        <span>Welkom ${loggedInUser.name}</span>
        <a href="/logout">
            <span>Ultlogen</span>
        </a>
    </div>
    <div id="content-wrapper">
        <div id="content">
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
                                <c:if test="${order.done == true}">
                                    <img src="../../resources/images/yes.png">
                                </c:if>
                                <c:if test="${order.done == false}">
                                    <img src="../../resources/images/no.png">
                                </c:if>
                                <c:out value="${order.number}"/>
                            </td>
                            <td><c:out value="${order.date}"/></td>
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
