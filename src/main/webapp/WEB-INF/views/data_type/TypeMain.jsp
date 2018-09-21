<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<head>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>


<c:if test="${attr.type eq 'String'}">
    <%@include file="TypeString.jsp" %>
</c:if>
<c:if test="${attr.type eq 'Date'}">
    <%@include file="TypeDate.jsp" %>
</c:if>
<c:if test="${attr.type eq 'Number'}">
    <%@include file="TypeNumber.jsp" %>
</c:if>
<c:if test="${attr.type eq 'RadioButton'}">
    <%@include file="TypeRadioButton.jsp" %>
</c:if>
<c:if test="${attr.type eq 'Text'}">
    <%@ include file="TypeText.jsp" %>
</c:if>
<c:if test="${attr.type eq 'SelectOneChoice'}">
    <%@include file="TypeSelectOneChoice.jsp" %>
</c:if>
<c:if test="${attr.type eq 'SelectOneChoiceOrInput'}">
    <%@include file="TypeSelectOneChoiceOrInput.jsp" %>
</c:if>
<c:if test="${attr.type eq 'HBlock'}">
    <div class="form-control">
        <c:if test="${attr.visible eq '1'}">
            <%@include file="TypeHBlock.jsp" %>
        </c:if>
    </div>
</c:if>
<c:if test="${attr.type eq 'VBlock'}">
    <div class="form-control">
        <c:if test="${attr.visible eq '1'}">
            <%@include file="TypeVBlock.jsp" %>
        </c:if>
    </div>
</c:if>



