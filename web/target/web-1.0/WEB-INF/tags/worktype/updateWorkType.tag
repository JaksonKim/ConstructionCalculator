<%@tag pageEncoding="UTF-8" %><%@ tag body-content="empty" trimDirectiveWhitespaces="true" %><%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %><%@ attribute name="workType" required="true" type="ua.ksstroy.logic.worktype.WorkType" %><spring:url value="/resources/img/done_btn.png" var="done_btn"/><div class="controller">    <div class="controller_name">ОБНОВИТЬ ТИП</div>    <form action="${pageContext.request.contextPath}/projects/updateWorkType" method="post">        <input type="hidden" name="id" value="${workType.id}">        <input type="hidden" name="projectId" value="${projectId}">        <table>            <tbody>            <tr>                <td>Имя:</td>                <td><input type="text" name="name" value="${workType.name}"></td>            </tr>            <tr>                <td>Описание:</td>                <td><input type="text" name="description" value="${workType.description}"></td>            </tr>            <tr>                <td>Цена:</td>                <td><input type="text" name="unitPrice" value="${workType.unitPrice}"></td>            </tr>            </tbody>        </table>        <input class="accepth_changes_btn" type="image" src="${done_btn}">    </form></div>