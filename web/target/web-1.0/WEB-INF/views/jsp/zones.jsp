<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zone" tagdir="/WEB-INF/tags/zone" %>
<%@ taglib prefix="group" tagdir="/WEB-INF/tags/group" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>project</title>

    <spring:url value="/resources/css/zones-page.css" var="zonespageCSS"/>
    <link href="${zonespageCSS}" rel="stylesheet"/>
    <spring:url value="/resources/css/mainStyle.css" var="commonCss"/>
    <link href="${commonCss}" rel="stylesheet"/>

    <spring:url value="/resources/js/jquery-2.1.4.min.js" var="jQuery"/>
    <script src="${jQuery}"></script>
    <spring:url value="/resources/js/mainScript.js" var="js"/>
    <script src="${js}"></script>





</head>
<body>
<jsp:include page="side_bar.jsp"/>
<div id="wrapper">
    <jsp:include page="single_project_menu.jsp"/>

    <table  class="content_table" border="1">

    <thead>
        <tr>
            <th scope="col">НАИМЕНОВАНИЕ</th>
            <th scope="col">ШИРИНА</th>
            <th scope="col">ВЫСОТА</th>
            <th scope="col">ПЛОЩАДЬ</th>
        </tr>
    </thead>

    <tbody>
        <zone:node zhd="${zhd}"/>
    </tbody>
</table>




</div>
</body>
</html>