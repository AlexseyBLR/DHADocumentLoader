<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<head>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>

<c:if test="${attrType.type eq 'String'}">
    <%@include file="TypeString.jsp" %>
</c:if>
<c:if test="${attrType.type eq 'Date'}">
    <%@include file="TypeDate.jsp" %>
</c:if>
<c:if test="${attrType.type eq 'Number'}">
    <%@include file="TypeNumber.jsp" %>
</c:if>
<c:if test="${attrType.type eq 'Text'}">
    <%@include file="TypeText.jsp" %>
</c:if>
<c:if test="${attrType.type eq 'SelectOneChoice'}">
    <%@include file="TypeSelectOneChoice.jsp" %>
</c:if>
<c:if test="${attrType.type eq 'HBlock'}">
    <div class="parent">
        <c:forEach var="attrType" items="${attrType.attr}">
            <c:if test="${attrType.type eq 'String'}">
                <%@include file="TypeString.jsp" %>
            </c:if>
            <c:if test="${attrType.type eq 'Date'}">
                <%@include file="TypeDate.jsp" %>
            </c:if>
        </c:forEach>
    </div>


</c:if>
<c:if test="${attrType.type eq 'VBlock'}">
    <div>
        <c:forEach var="attrType" items="${attrType.attr}">
            <c:if test="${attrType.type eq 'String'}">
                <%@include file="TypeString.jsp" %>
            </c:if>
            <c:if test="${attrType.type eq 'Date'}">
                <%@include file="TypeDate.jsp" %>
            </c:if>
        </c:forEach>
    </div>
</c:if>
