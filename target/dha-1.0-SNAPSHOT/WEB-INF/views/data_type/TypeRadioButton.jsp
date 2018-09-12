<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"
          integrity="2hfp1SzUoho7/TsGGGDaFdsuuDL0LX2hnUp6VkX3CUQ2K4K+xjboZdsXyp4oUHZj" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/js/bootstrap.min.js"
            integrity="VjEeINv9OSwtWFLAtmc4JCtEJXXBub00gtSnszmspDLCtC0I4z4nqz7rEFbIZLLU"
            crossorigin="anonymous"></script>
</head>


<c:if test="${attr.editable eq '1'}">
    <c:if test="${attr.visible eq '1'}">
        ${attr.header}
        <br>
        <c:forEach var="attrType" items="${attr.attr}">
            <input type="radio" name="radioButtonValue" value="${attrType.value}">${attrType.value}
        </c:forEach>
    </c:if>
    <c:if test="${attr.visible eq '0'}"/>
</c:if>

<c:if test="${attr.editable eq '0'}">
    <c:if test="${attr.visible eq '1'}">
        ${attr.header}
        <br>
        <c:forEach var="attrType" items="${attr.attr}">
            <input type="radio" name="radioButtonValue" value="${attrType.value}" disabled>${attrType.value}
        </c:forEach>
    </c:if>
    <c:if test="${attr.visible eq '0'}"/>
</c:if>