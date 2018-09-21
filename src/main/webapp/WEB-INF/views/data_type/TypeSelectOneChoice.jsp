<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<head>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <style>
        select{
            width: 700px;
        }
    </style>
</head>

<div class="form-control">

    <c:if test="${attr.editable eq '1'}">
        <c:if test="${attr.visible eq '1'}">

            <form:select path="${attr.path}.value" items="${values.get(attr.sql)}"></form:select>

            <%--<select name="selectOnChoiceValue">--%>
                <%--<c:forEach var="options" items="${values.get(attr.sql)}">--%>
                    <%--<option value="${attrType.value}">${options}</option>--%>
                <%--</c:forEach>--%>
            <%--</select>--%>
        </c:if>

        <c:if test="${attr.visible eq '0'}"></c:if>
    </c:if>

    <c:if test="${attr.editable eq '0'}">
        <c:if test="${attr.visible eq '1'}">
            <form:select path="${attr.path}.value" items="${values.get(attr.sql)}"></form:select>
            <%--<select name="selectOnChoiceValue" disabled>--%>
                <%--<c:forEach var="options" items="${values.get(attr.sql)}">--%>
                    <%--<option value="${attrType.value}">${options}</option>--%>
                <%--</c:forEach>--%>
            <%--</select>--%>
        </c:if>
        <c:if test="${attr.visible eq '0'}"></c:if>
    </c:if>


    <c:if test="${attrType.editable eq '1'}">
        <c:if test="${attrType.visible eq '1'}">
            <form:select path="${attrType.path}.value" items="${values.get(attrType.sql)}"></form:select>

            <%--<select name="selectOnChoiceValue">--%>
            <%--<c:forEach var="options" items="${values.get(attr.sql)}">--%>
            <%--<option value="${attrType.value}">${options}</option>--%>
            <%--</c:forEach>--%>
            <%--</select>--%>
        </c:if>

        <c:if test="${attrType.visible eq '0'}"></c:if>
    </c:if>

</div>