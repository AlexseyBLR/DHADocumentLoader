<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>

<c:if test="${attr.visible eq '1'}">
    <c:if test="${attr.editable eq '1'}">
        <c:if test="${attr.required eq '1'}">
            ${attr.prefix}

            <form:input type="date" path="${attr.path}.value" minlength="${attr.minValue}"
                        maxlength="${attr.maxValue}"
                        style="margin: 0.3%" required="true"/>
            ${attr.postfix}
        </c:if>
        <c:if test="${attr.required eq '0'}">
            ${attr.prefix}

            <form:input type="date" path="${attr.path}.value" minlength="${attr.minValue}"
                        maxlength="${attr.maxValue}"
                        style="margin: 0.3%"/>
            ${attr.postfix}
        </c:if>
    </c:if>
    <c:if test="${attr.editable eq '0'}">
        ${attr.prefix}

        <form:input type="date" path="${attr.path}.value" minlength="${attr.minValue}"
                    maxlength="${attr.maxValue}"
                    style="margin: 0.3%" readonly="true"/>
        ${attr.postfix}
    </c:if>
</c:if>


<c:if test="${attrType.visible eq '1'}">
    <c:if test="${attrType.editable eq '1'}">
        <c:if test="${attrType.required eq '1'}">
            ${attrType.header}
            ${attrType.prefix}

            <form:input type="date" path="${attrType.path}.value" minlength="${attrType.minValue}"
                        maxlength="${attrType.maxValue}"
                        style="margin: 0.3%" required="true"/>
            ${attrType.postfix}
        </c:if>
        <c:if test="${attrType.required eq '0'}">
            ${attrType.header}
            ${attrType.prefix}

            <form:input type="date" path="${attrType.path}.value" minlength="${attrType.minValue}"
                        maxlength="${attrType.maxValue}"
                        style="margin: 0.3%"/>
            ${attrType.postfix}
        </c:if>
    </c:if>
    <c:if test="${attrType.editable eq '0'}">
        ${attrType.header}
        ${attrType.prefix}

        <form:input type="date" path="${attrType.path}.value" minlength="${attrType.minLength}"
                    maxlength="${attrType.maxValue}"
                    style="margin: 0.3%" readonly="true"/>
        ${attrType.postfix}
    </c:if>
</c:if>
