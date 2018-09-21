<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>

<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>

    <link rel="shortcut icon" href="http://www.livejournal.com/favicon.png?v=49565" type="image/x-icon">
    <title>${document.docName}</title>
    <style>

        hr {
            border: none;
            background-color: #060606;
            color: #060606;
            height: 5px;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<div class="container">

    <c:set value="${sessionScope.sessionDoc.docSql}" var="docSql"/>
    <c:set value="${sessionScope.sessionDoc.docAttr}" var="docAttr"/>
    <c:set value="${sessionScope.sessionDoc.docDocs}" var="docDocs"/>
    <c:set value="${sessionScope.sessionDoc.docOrgs}" var="docOrgs"/>
    <c:set value="${sessionScope.sessionDoc.docSign}" var="docSign"/>
    <c:set value="${sessionScope.sessionDoc.docWaste}" var="docWaste"/>
    <c:set value="${sessionScope.sessionDoc.docAssets}" var="docAssets"/>
    <c:set value="${sessionScope.sessionDoc.docServices}" var="docServices"/>
    <c:set value="${sessionScope.sessionDoc.docBankDetails}" var="docBankDetails"/>



    <form:form modelAttribute="document" action="/testNext" method="post">


        <h3 style="text-align: center">${document.docName}</h3>
        <br>

        <c:if test="${docAttr !=null}">
            <%@include file="attr_type/docAttr.jsp" %>
            <hr>
        </c:if>

        <c:if test="${docOrgs !=null}">
            <%@include file="attr_type/docOrgs.jsp" %>
            <hr>
        </c:if>

        <c:if test="${docDocs !=null}">
            <%@include file="attr_type/docDocs.jsp" %>
            <hr>
        </c:if>

        <c:if test="${docWaste !=null}">
            <%@include file="attr_type/docWaste.jsp" %>
            <hr>
        </c:if>

        <c:if test="${docAssets !=null}">
            <%@include file="attr_type/docAssets.jsp" %>
            <hr>
        </c:if>

        <c:if test="${docServices !=null}">
            <%@include file="attr_type/docServices.jsp" %>
            <hr>
        </c:if>

        <c:if test="${docBankDetails !=null}">
            <%@include file="attr_type/docBankDetails.jsp" %>
        </c:if>

        <c:if test="${docSign !=null}">
            <%@include file="attr_type/docSign.jsp" %>
            <hr>
        </c:if>

        <input type="submit" onclick="checkBoxChecker()" value="test"/>
    </form:form>

</div>


<script type="text/javascript" src="resources/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    <%@include file="/WEB-INF/resources/JSFunction/checkBoxChecker.js"%>
    <%@include file="/WEB-INF/resources/css/bootstrap.min.css"%>
    <%@include file="/WEB-INF/resources/css/common.css"%>
    <%@include file="/WEB-INF/resources/js/bootstrap.min.js"%>
</script>
</body>
</html>