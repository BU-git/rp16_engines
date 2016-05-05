<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>500</title>
</head>
<body>
    <h1>Internal server error. 500!</h1>
    <h2>Cause:</h2>
    <p><c:out value="${error}"/></p>
</body>
</html>
