<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo.png"/>" type="image/png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <script src="<c:url value="/resources/js/upload.js"/>"></script>
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
    <div id="header">
        <a href="/orders" class="left">
            <span>Orderoverzicht</span>
        </a>
        <a href="/templates" class="left">
            <span>Maak template</span>
        </a>
        <a href="/404 error" class="left">
            <span>Template overzicht</span>
        </a>
        <span style="text-align: center;">Welkom ${loggedInUser.email}</span>
        <a href="/logout.html" class="right">
            <span>logout</span>
        </a>
    </div>
    <div id="content-wrapper" style="height: calc(100% - 120px); text-align: center; align-content: center">
        <div id="content" style="text-align: center">
            <p style="text-align: center">Welkom ${loggedInUser.email}</p>

            <a href="/orders" style="text-align: center; display: block">
                <div class="button">Orderoverzicht</div>
            </a>
            <a href="/templates" style="text-align: center; display: block">
                <div class="button">Maak template</div>
            </a>
            <a href="/404 error" style="text-align: center; display: block">
                <div class="button">Template overzicht</div>
            </a>
            <form method="post" id="uploadForm" action="upload" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td colspan="3">
                            <legend>Upload XML files</legend>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="file" name="files[]" multiple="multiple" onchange="getFileSizeandName(this);"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div id="uploaddiv">
                                <table id="uploadTable">

                                    <tfoot>
                                    <tr>
                                        <td id="filecount"></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <button class="btn" type="submit" id="uploadButton" onClick="CloseAndRefresh();">Upload</button>
                            <button class="btn" id="cancelButton">Cancel</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>