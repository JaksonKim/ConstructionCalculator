<%@tag pageEncoding="UTF-8"%>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ attribute name="innerWorkGroup" required="true" type="ua.ksstroy.logic.work.WorkGroup" %>
<%@ taglib prefix="work" tagdir="/WEB-INF/tags/work" %>

<spring:url value="/resources/img/done_btn.png" var="done_btn"/>

<div class="controller">
    <div class="controller_name">ДОБАВИТЬ ГРУПУ РАБОТ</div>
    <br>
    <form action="${pageContext.request.contextPath}/projects/addInnerWorkGroup" method="post">
        <input type="hidden" name="parentId" value="${null}">
        <input type="hidden" name="projectId" value="${projectId}">
        <table>
            <tbody>
            <tr>
                <td>name:</td>
                <td><input type="text" name="name" placeholder="Enter name"></td>
            </tr>
            </tbody>
        </table>
        <input class="accept_changes_btn clickableIcon" type="image" src="${done_btn}">
    </form>
</div>