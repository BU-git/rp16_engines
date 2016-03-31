<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <meta charset="utf-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">

    <script>
        $(document).ready(function() {
            $('#table').DataTable();
        } );
    </script>
</head>
<body>
    <table align="center" id="table" class="display" cellspacing="0">
        <thead>
            <tr>
                <th>Done</th>
                <th>Ordernummer</th>
                <th>Service datum</th>
                <th>Installatie</th>
                <th>Taak</th>
                <th>Adres</th>
            </tr>
        </thead>
        <tbody align="center">
            <c:forEach var="order" items="${allOrders}">
                <tr>
                    <td>
                        <c:if test="${order.done == true}">
                                <img src="../resources/images/yes.png">
                        </c:if>
                        <c:if test="${order.done == true}">
                            <img src="../resources/images/no.png">
                        </c:if>
                    </td>
                    <td><c:out value="${order.orderNumber}"/></td>
                    <td><c:out value="${order.serviceDate}"/></td>
                    <td><c:out value="${order.task}"/></td>
                    <td><c:out value="${order.address}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
