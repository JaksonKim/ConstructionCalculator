<%@tag pageEncoding="UTF-8"%>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="work" required="true" type="ua.ksstroy.logic.work.Work" %>
<%@attribute name="zone" required="true" type="ua.ksstroy.logic.zone.ZoneGroup" %>

<spring:url value="/resources/img/done_btn.png" var="done_btn"/>

<div class="controller">
    <div class="controller_name">ОБНОВИТЬ РАБОТУ</div>
    <br>
    <form action="${pageContext.request.contextPath}/projects/updateWork" method="post">
        <input type="hidden" name="id" value="${work.id}">
        <input type="hidden" name="projectId" value="${projectId}">
        <table>
            <tbody>
            <%--<tr>
                <td>name:</td>
                <td><input type="text" name="name" value="${work.name}"></td>
            </tr>--%>
            <tr>
                          <td>work type:</td>
                          <td>
                              <form method="post">
                                  <select name="workTypeId">
                                      <c:forEach var="workType" items="${workType.workTypeGroups}">

                                          <c:forEach var="wortTypeData" items="${workType.workTypes}">
                                              <option value="${wortTypeData.id}">${wortTypeData.name}</option>
                                          </c:forEach>

                                      </c:forEach>
                                  </select>
                              </form>
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
        <input class="accepth_changes_btn" type="image" src="${done_btn}">
    </form>
</div>