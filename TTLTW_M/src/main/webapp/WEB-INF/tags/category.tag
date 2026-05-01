<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ attribute name="list"  required="true"  type="java.util.List" %>
<%@ attribute name="level" required="true" %>

<c:forEach var="item" items="${list}">
    <div class="tree-item indent-${level}">
        <i class="bi ${empty item.children ? 'bi-folder' : 'bi-folder-fill text-primary'}"></i>
        <span>${item.name}</span>
    </div>

    <c:if test="${not empty item.children}">
        <t:category list="${item.children}" level="${level + 1}" />
    </c:if>
</c:forEach>