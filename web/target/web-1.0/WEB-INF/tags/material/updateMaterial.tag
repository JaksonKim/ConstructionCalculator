<%@tag pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="material" type="ua.ksstroy.logic.material.Material" %>

<spring:url value="/resources/img/done_btn.png" var="done_btn"/>

<div class="controller">
    <div class="controller_name">ОБНОВИТЬ МАТЕРИАЛ</div>
    <form action="${pageContext.request.contextPath}/projects/updateMaterial" method="post">
        <input type="hidden" name="id" value="${material.id}">
        <input type="hidden" name="projectId" value="${projectId}">
        <table>
            <tbody>
            <tr>
                <td>Имя:</td>
                <td><input type="text" name="name" value="${material.unitsPerSquareMeter}"></td>
            </tr>
            <tr>
                <td>Цена:</td>
                <td><input type="text" name="name" value="${material.unitsPerSquareMeter} грн/шт."></td>
            </tr>
            </tbody>
        </table>
        <input class="accept_changes_btn clickableIcon" type="image" src="${done_btn}">
    </form>
</div>