<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="workGroup" required="true" type="ua.ksstroy.logic.work.WorkGroup" %>
<%@attribute name="zone" required="true" type="ua.ksstroy.logic.zone.ZoneGroup" %>


<%@ taglib prefix="work" tagdir="/WEB-INF/tags/work" %>

<spring:url value="/resources/img/arrow_drop_down.png" var="arrow_drop_down"/>
<spring:url value="/resources/img/add_btn.png" var="add_btn"/>
<spring:url value="/resources/img/delete_btn.png" var="delete_btn"/>
<spring:url value="/resources/img/show_updates_btn.png" var="show_update_forms_btn"/>

<c:forEach var="work" items="${workGroup.work}">

    <tr>
        <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;${work.type.name}</td>
        <td>${work.planedCost}&nbsp;&nbsp;грн.</td>
        <td>${work.costForAllMaterials}&nbsp;&nbsp;грн.</td>
        <td>${work.costForJob}&nbsp;&nbsp;грн.</td>

            <%--<td>${work.workZone.name}</td>--%>
        <td class="hidden">
            <form class="controller" action="${pageContext.request.contextPath}/projects/removeWork" method="post">
                <input type="hidden" name="id" value="${work.id}">
                <input type="hidden" name="projectId" value="${projectId}">
                <input class="delete_btn clickableIcon" type="image" src="${delete_btn}" alt="Delete">
            </form>
            <work:updateWork work="${work}" zone="${zone}"/>
        </td>
    </tr>
    <tr>
        <td class="mytd" colspan="4">
            <table class="content_table" align="center" border="1">
                <thead>
                     <th colspan="4" align="center">Зона</th>
                <tr>
                    <th >Наименование</th>
                    <th >Штрина</th>
                    <th >Высота</th>
                    <th >Площадь</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>${work.workZone.name}</td>
                    <td>${work.workZone.width}&nbsp;&nbsp;<i>м</i></td>
                    <td>${work.workZone.height}&nbsp;&nbsp;<i>м</i></td>
                    <td>${work.workZone.value}&nbsp;&nbsp;<i>м</i><sup><small>2</small></sup></td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>


</c:forEach>