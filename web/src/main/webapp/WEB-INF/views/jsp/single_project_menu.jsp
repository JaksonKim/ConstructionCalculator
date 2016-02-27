<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<header>
    <a class="menu_item" href="${pageContext.request.contextPath}/projects/${projectId}"><spring:message
            code="project"/></a>
    <a class="menu_item" href="${pageContext.request.contextPath}/projects/${projectId}/zones"><spring:message
            code="zones"/></a>
    <a class="menu_item" href="${pageContext.request.contextPath}/projects/${projectId}/work"><spring:message
            code="work"/></a>
    <a class="menu_item" href="${pageContext.request.contextPath}/projects/${projectId}/materials"><spring:message
            code="materials"/></a>
    <a class="menu_item"
       href="${pageContext.request.contextPath}/projects/${projectId}/library_worktypes"><spring:message
            code="library_worktypes"/></a>
    <a class="menu_item"
       href="${pageContext.request.contextPath}/projects/${projectId}/library_materials"><spring:message
            code="library_materials"/></a>
</header>
