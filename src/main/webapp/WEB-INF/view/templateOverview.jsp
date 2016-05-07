<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="<c:url value="/resources/js/jquery-1.12.2.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
  <script src="<c:url value="/resources/js/template.overview.js"/>"></script>
  <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/templateOverview.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/resources/css/jquery.dataTables.min.css"/>" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
  <title>Template Overview</title>
  <link href="<c:url value="/resources/css/menu.css"/>" rel="stylesheet" type="text/css">
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
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
    <div id="title_banner"><p>Template Overview</p></div>
    <div id="content_place">
      <div id="template_overview">
        <table id="example" class="display" cellspacing="0" width="100%">
          <thead>
          <tr>
            <th>#</th>
            <th>Template Name</th>
            <th>Action</th>
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