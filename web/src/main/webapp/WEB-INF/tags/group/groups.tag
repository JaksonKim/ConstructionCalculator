<%@tag pageEncoding="UTF-8"%>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="zhd" required="true" type="ua.ksstroy.logic.zone.ZoneGroup" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="group" tagdir="/WEB-INF/tags/group" %>

<spring:url value="/resources/img/arrow_drop_down.png" var="arrow_drop_down"/>
<spring:url value="/resources/img/add_btn.png" var="add_btn"/>
<spring:url value="/resources/img/delete_btn.png" var="delete_btn"/>
<spring:url value="/resources/img/show_updates_btn.png" var="show_update_forms_btn"/>
<c:if test="${zhd.name ne 'root_group'}">
    <tr>
        <td><b>${zhd.name}</b></td>
        <td></td>
        <td></td>
        <td></td>


        <td class="hidden">
            <form class="controller" action="${pageContext.request.contextPath}/projects/removeGroup" method="post">
                <input type="hidden" name="groupId" value="${zhd.id}">
                <input type="hidden" name="projectId" value="${projectId}">
                <input class="delete_btn clickableIcon" type="image" src="${delete_btn}" alt="Delete">
            </form>
            <group:updateGroup zhd="${zhd}"/>
            <group:addGroup zhd="${zhd}"/>
            <group:addZone zhd="${zhd}"/>
        </td>
    </tr>

</c:if>