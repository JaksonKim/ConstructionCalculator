<%@tag pageEncoding="UTF-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="materialTypeGroup" required="true" type="ua.ksstroy.logic.material.MaterialTypeGroup" %>

<spring:url value="/resources/img/done_btn.png" var="done_btn"/>

<c:if test="${materialTypeGroup.name ne 'root_group'}">
    <div class="controller">
        <div class="controller_name">ОБНОВИТЬ ГРУППУ ТИП МАТЕРИАЛА</div>
        <form action="${pageContext.request.contextPath}/projects/updateMaterialTypeGroup" method="post">
            <input type="hidden" name="id" value="${materialTypeGroup.id}">
            <input type="hidden" name="projectId" value="${projectId}">
            <table>
                <tbody>
                <tr>
                    <td>Имя:</td>
                    <td><input type="text" name="name" value="${materialTypeGroup.name}"></td>
                </tr>
                <tr>
                    <td>Описание:</td>
                    <td><input type="text" name="description" value="${materialTypeGroup.description}"></td>
                </tr>
                </tbody>
            </table>
            <input class="accept_changes_btn clickableIcon" type="image" src="${done_btn}">
        </form>
    </div>
</c:if>