<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>

<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <style>
        .parent {
            display: flex;
            height: 30px;
            line-height: 26px;
        }

        .child {
            display: block;
            margin-right: 1%;
        }

        .child.max {
            flex: 1;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>
<body>


<c:if test="${docOrgs.visible eq '1'}">
    <h5 style="font-weight: bold">${docOrgs.header}</h5>
    <div class="form-control">
        <c:forEach var="var1" items="${docOrgs.refOrg}">
            <h7 style="font-weight: bold">${var1.header}</h7>
            <div class="form-control">
                <c:if test="${var1.type eq 'HBlock'}">
                    <c:forEach var="attr" items="${var1.attr}">
                        <label style="width: ${attr.textWidth}px">${attr.header}</label>
                        <%@include file="../data_type/TypeMain.jsp" %>
                    </c:forEach>
                    </c:if>
                <c:if test="${var1.type eq 'VBlock'}">
                    <c:forEach var="attr" items="${var1.attr}">
                        <label style="width: ${attr.textWidth}px">${attr.header}</label>
                        <%@include file="../data_type/TypeMain.jsp" %>
                        <br/>
                    </c:forEach>
                </c:if>
            </div>
        </c:forEach>
    </div>
</c:if>


</body>
</html>