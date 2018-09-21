<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<head>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <style>
        select {
            width: 700px;
        }
    </style>
</head>

<div class="form-control">

    <c:if test="${attr.editable eq '1'}">
        <c:if test="${attr.visible eq '1'}">

            <c:if test="${attr.value eq 'select'}">
                <form:radiobutton path="${attr.path}.value" value="input"></form:radiobutton>
                <form:input path="${attr.path}.attr[0].value" value="${attr.attr[0].value}" type="text"
                            placeholder="${attr.footer}"
                            minlength="${attr.minLength}" maxlength="${attr.maxLength}"
                            style="margin: 0.3%; width: ${attr.inputWidth}px; text-align: ${attr.alignment}"/>

                <form:radiobutton path="${attr.path}.value" value="select" checked="true"></form:radiobutton>
                <form:select path="${attr.attr[1].path}.value" items="${values.get(attr.sql)}"></form:select>
            </c:if>

            <c:if test="${attr.value eq 'input'}">
                <form:radiobutton path="${attr.path}.value" value="input" checked="true"></form:radiobutton>
                <form:input path="${attr.attr[0].path}.value" value="${attr.value}" type="text"
                            placeholder="${attr.footer}"
                            minlength="${attr.minLength}" maxlength="${attr.maxLength}"
                            style="margin: 0.3%; width: ${attr.inputWidth}px; text-align: ${attr.alignment}"/>

                <form:radiobutton path="${attr.path}.value" value="select"></form:radiobutton>
                <form:select path="${attr.attr[1].path}.value" items="${values.get(attr.sql)}"></form:select>
            </c:if>

        </c:if>
        <br>
        <c:if test="${attr.visible eq '0'}"></c:if>
    </c:if>




    <c:if test="${attr.editable eq '0'}">
        <c:if test="${attr.visible eq '1'}">

            <c:if test="${attr.value eq 'select'}">
                <form:radiobutton path="${attr.path}.value" value="input" disabled="true"></form:radiobutton>
                <form:input path="${attr.attr[0].path}.value" value="${attr.value}" type="text"
                            placeholder="${attr.footer}"
                            minlength="${attr.minLength}" maxlength="${attr.maxLength}"
                            style="margin: 0.3%; width: ${attr.inputWidth}px; text-align: ${attr.alignment}" disabled="true"/>

                <form:radiobutton path="${attr.path}.value" value="select" checked="true" disabled="true"></form:radiobutton>
                <form:select path="${attr.attr[1].path}.value" items="${values.get(attr.sql)}" disabled="true"></form:select>
            </c:if>

            <c:if test="${attr.value eq 'input'}">
                <form:radiobutton path="${attr.path}.value" value="input" checked="true" disabled="true"></form:radiobutton>
                <form:input path="${attr.attr[0].path}.value" value="${attr.value}" type="text"
                            placeholder="${attr.footer}"
                            minlength="${attr.minLength}" maxlength="${attr.maxLength}"
                            style="margin: 0.3%; width: ${attr.inputWidth}px; text-align: ${attr.alignment}" disabled="true"/>

                <form:radiobutton path="${attr.path}.value" value="select" disabled="true"></form:radiobutton>
                <form:select path="${attr.attr[1].path}.value" items="${values.get(attr.sql)}" disabled="true"></form:select>
            </c:if>

        </c:if>
        <br>
        <c:if test="${attr.visible eq '0'}"></c:if>
    </c:if>
</div>