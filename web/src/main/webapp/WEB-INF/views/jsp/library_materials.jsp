<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="material" tagdir="/WEB-INF/tags/material" %>

<html>
<head>
    <spring:url value="/resources/css/mainStyle.css" var="css"/>
    <link href="${css}" rel="stylesheet"/>
    <spring:url value="/resources/js/jquery-2.1.4.min.js" var="jQuery"/>
    <script src="${jQuery}"></script>
    <spring:url value="/resources/js/mainScript.js" var="js"/>
    <script src="${js}"></script>
</head>
<body>
<jsp:include page="side_bar.jsp"/>
<div id="wrapper">

    <jsp:include page="single_project_menu.jsp"/>

    <table class="content_table" border="1">

        <thead>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Цена</th>
        </tr>
        </thead>

        <tbody>
        <material:node materialTypeGroup="${materialObject}"/>
        </tbody>
    </table>
</div>
</body>
</html>