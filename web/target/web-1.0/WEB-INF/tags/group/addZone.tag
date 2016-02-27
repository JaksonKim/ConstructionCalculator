<%@tag pageEncoding="UTF-8"%>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="zhd" required="true"
              type="ua.ksstroy.logic.zone.ZoneGroup" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url value="/resources/img/arrow_drop_down.png" var="arrow_drop_down"/>
<spring:url value="/resources/img/add_btn.png" var="add_btn"/>
<spring:url value="/resources/img/delete_btn.png" var="delete_btn"/>
<spring:url value="/resources/img/done_btn.png" var="done_btn"/>

<div class="controller ">
    <div class="controller_name">ДОБАВИТЬ ЗОНУ</div>
    <form action="${pageContext.request.contextPath}/projects/addZone" method="post">
        <input type="hidden" name="parentGroupId" value="${zhd.id}">
        <input type="hidden" name="projectId" value="${projectId}">
        <table>
            <tbody>
            <tr>
                <td>Имя:</td>
                <td><input type="text" name="name" ></td>
            </tr>
            <tr>
                <td>Ширина:</td>
                <td><input type="text" name="width" ></td>
            </tr>
            <tr>
                <td>Высота:</td>
                <td><input type="text" name="height" ></td>
            </tr>
            </tbody>
        </table>
        <input class="accept_changes_btn clickableIcon" type="image" src="${done_btn}">
    </form>
</div>