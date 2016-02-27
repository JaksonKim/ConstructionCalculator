<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="workGroup" required="true" type="ua.ksstroy.logic.work.WorkGroup" %>
<%--<%@attribute name="workType" required="true" type="ua.ksstroy.logic.worktype.WorkTypeGroup" %>--%>
<%@ taglib prefix="work" tagdir="/WEB-INF/tags/work" %>
<%@attribute name="zone" required="true" type="ua.ksstroy.logic.zone.ZoneGroup" %>

<spring:url value="/resources/img/arrow_drop_down.png" var="arrow_drop_down"/>
<spring:url value="/resources/img/add_btn.png" var="add_btn"/>
<spring:url value="/resources/img/delete_btn.png" var="delete_btn"/>
<spring:url value="/resources/img/show_updates_btn.png" var="show_update_forms_btn"/>


<c:if test="${workGroup.name ne 'root_group'}">
    <tr>
        <td><b>${workGroup.name}</b></td>
        <td>${workGroup.planedCost}&nbsp;&nbsp;грн.</td>
        <td>${workGroup.costForAllMaterials}&nbsp;&nbsp;грн.</td>
        <td>${workGroup.costForJob}&nbsp;&nbsp;грн.</td>

        <td class="hidden">
            <form class="controller" action="${pageContext.request.contextPath}/projects/removeWorkGroup" method="post">
                <input type="hidden" name="groupId" value="${workGroup.id}">
                <input type="hidden" name="projectId" value="${projectId}">
                <input class="delete_btn clickableIcon" type="image" src="${delete_btn}" alt="Delete">
            </form>
            <work:addWork workGroup="${workGroup}" workType="${workType}" zone="${zone}"/>
            <work:addWorkGroup innerWorkGroup="${workGroup}"/>
            <work:updateWorkGroup workGroup="${workGroup}"/>
        </td>
    </tr>
</c:if>