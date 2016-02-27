<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="work" tagdir="/WEB-INF/tags/work" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <spring:url value="/resources/css/mainStyle.css" var="css"/>
    <link href="${css}" rel="stylesheet"/>

    <spring:url value="/resources/css/works-page.css" var="worksPageCss"/>
    <link href="${worksPageCss}" rel="stylesheet"/>
    <spring:url value="/resources/js/jquery-2.1.4.min.js" var="jQuery"/>
    <script src="${jQuery}"></script>
    <spring:url value="/resources/js/mainScript.js" var="js"/>
    <script src="${js}"></script>
    <spring:url value="/resources/js/works-page.js" var="worksPageJs"/>
    <script src="${worksPageJs}"></script>


</head>

<body>
<jsp:include page="side_bar.jsp"/>
<div id="wrapper">
    <jsp:include page="single_project_menu.jsp"/>

    <table  class="content_table" border="1">

        <thead>
            <tr>
                <th scope="col">Тип работы</th>
                <th scope="col">Общая стоимость</th>
                <th scope="col">Стоимость материалов</th>
                <th scope="col">Стоимость работы</th>
            </tr>
        </thead>

        <tbody>
            <work:node workGroup="${WorkHierarchy}" zone="${ZoneHierarchy}"/>
        </tbody>

    </table>
</body>
</html>