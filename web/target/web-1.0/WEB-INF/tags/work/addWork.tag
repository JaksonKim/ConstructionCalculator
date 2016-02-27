<%@tag pageEncoding="UTF-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@attribute name="workGroup" required="true" type="ua.ksstroy.logic.work.WorkGroup" %>
<%@attribute name="workType" required="true" type="ua.ksstroy.logic.worktype.WorkTypeGroup" %>
<%@attribute name="zone" required="true" type="ua.ksstroy.logic.zone.ZoneGroup" %>

<spring:url value="/resources/img/done_btn.png" var="done_btn"/>

<div class="controller">
    <div class="controller_name">ДОБАВИТЬ РАБОТУ</div>
    <br>

    <form action="${pageContext.request.contextPath}/projects/addWork" method="post">
        <input type="hidden" name="parentId" value="${workGroup.id}">
        <input type="hidden" name="projectId" value="${projectId}">
        <table>
            <%--<tr>
            <tr>
                <td>name:</td>
                <td><input type="text" name="name" placeholder="Enter name"></td>
            </tr>--%>
            <tr>
                <td>work type:</td>
                <td>
                        <select name="workTypeId">
                            <c:forEach var="workType" items="${workType.workTypeGroups}">

                                <c:forEach var="wortTypeData" items="${workType.workTypes}">
                                    <option value="${wortTypeData.id}">${wortTypeData.name}</option>
                                </c:forEach>

                            </c:forEach>
                        </select>
                </td>
            </tr>

            <tr>
                <td>zone:</td>
                <td>
                    <select name="zoneId">
                        <c:forEach var="zoneGroup" items="${zone.groups}">

                            <c:forEach var="zoneData" items="${zoneGroup.zones}">
                                <option value="${zoneData.id}">${zoneData.name}</option>

                                <c:forEach var="zoneAdditional" items="${zoneData.additional}">
                                    <option value="${zoneAdditional.id}">${zoneAdditional.name}</option>
                                </c:forEach>

                                <c:forEach var="zoneSur" items="${zoneData.surplus}">
                                    <option value="${zoneSur.id}">${zoneSur.name}</option>
                                </c:forEach>


                            </c:forEach>

                        </c:forEach>
                    </select>
                </td>
            </tr>

            </tbody>
        </table>
        <input class="accept_changes_btn clickableIcon" type="image" src="${done_btn}">
    </form>
</div>