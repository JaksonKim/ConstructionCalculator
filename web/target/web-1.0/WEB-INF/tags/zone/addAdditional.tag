<%@tag pageEncoding="UTF-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="zones" required="true" type="ua.ksstroy.logic.zone.Zone" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zone" tagdir="/WEB-INF/tags/zone" %>
<%@ taglib prefix="group" tagdir="/WEB-INF/tags/group" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url value="/resources/img/arrow_drop_down.png" var="arrow_drop_down"/>
<spring:url value="/resources/img/add_btn.png" var="add_btn"/>
<spring:url value="/resources/img/delete_btn.png" var="delete_btn"/>
<spring:url value="/resources/img/done_btn.png" var="done_btn"/>


<div class="controller">
    <div class="controller_name">ДОПОЛНИТЕЛЬНАЯ ЗОНА</div>
    <br>

    <form action="${pageContext.request.contextPath}/projects/addAdditionalZone"
          method="post">
        <input type="hidden" name="parentZoneId" value="${zones.id}">
        <input type="hidden" name="projectId" value="${projectId}">
        <table>
            <tbody>
            <tr>
                <td>Имя:</td>
                <td><input type="text" name="name" placeholder="Введите имя"></td>
            </tr>
            <tr>
                <td>Ширина:</td>
                <td><input type="text" name="width" placeholder="Введите ширину"></td>
            </tr>
            <tr>
                <td>Высота:</td>
                <td><input type="text" name="height" placeholder="Введите высоту"></td>
            </tr>
            </tbody>
        </table>
        <input class="accept_changes_btn" type="image" src="${done_btn}">
    </form>
</div>
