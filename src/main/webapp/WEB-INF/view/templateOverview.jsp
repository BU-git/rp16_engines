<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/templateOverview.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/jquery.dataTables.min.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title>Template Overview</title>
  <script>
    $(document).ready(function() {
      $('#example').DataTable();
    } );
  </script>
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
  <span style="text-align: center;">Welkom ${loggedInUser.name}</span>
  <a href="<spring:url value="/logout"/>" class="right">
    <span>logout</span>
  </a>
</div>
<div id="content-wrapper">
  <div id="content">
    <div id="title_banner"><p>Template Overview</p></div>
    <div id="content_place">
      <div id="template_overview">
        <table id="example" class="display" cellspacing="0" width="100%">
          <thead>
          <tr>
            <th>#</th>
            <th>Template Name</th>
          </tr>
          </thead>
          <tbody>
          <% int a = 1; %>
          <c:forEach var ="t" items="${templates}">
            <tr>
              <td><% out.println(a++); %></td>
              <td>
                <c:if test="${!t.equals('NSA')}"><a href="/templates/overview/${t}"><p class="black" >${t}</p></a></c:if>
                <c:if test="${t.equals('NSA')}">${t}</c:if>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>