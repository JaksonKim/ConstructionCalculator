<%@tag pageEncoding="UTF-8"%>
<%@tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="work" tagdir="/WEB-INF/tags/work" %>

<%@ attribute name="workGroup" required="true" type="ua.ksstroy.logic.work.WorkGroup" %>
<%@ attribute name="zone" required="true" type="ua.ksstroy.logic.zone.ZoneGroup" %>

<work:workGroup workGroup ="${workGroup}" zone="${zone}"/>
<work:works workGroup="${workGroup}" zone="${zone}"/>


    <c:forEach var="workGroupIn" items="${workGroup.groups}">
        <work:node workGroup="${workGroupIn}" zone="${zone}"/>
    </c:forEach>
