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
        .demotable {
            border-collapse: collapse;
            counter-reset: schetchik; /* счётчик с названием "schetchik" работает в рамках класса .demotable */
        }

        .demotable tr {
            counter-increment: schetchik; /* при встрече тега tr счётчик с названием "schetchik" увеличивается на единицу */
        }

        .demotable td,
        .demotable tr:before {
            padding: .1em .5em;
            border: 1px solid #E7D5C0;
        }

        .demotable tr:before {
            content: counter(schetchik); /* значение счётчика с названием "schetchik" записывается в первую клетку строки */
            display: table-cell;
            vertical-align: middle;
            color: #978777;
        }

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"
          integrity="2hfp1SzUoho7/TsGGGDaFdsuuDL0LX2hnUp6VkX3CUQ2K4K+xjboZdsXyp4oUHZj" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/js/bootstrap.min.js"
            integrity="VjEeINv9OSwtWFLAtmc4JCtEJXXBub00gtSnszmspDLCtC0I4z4nqz7rEFbIZLLU"
            crossorigin="anonymous"></script>

</head>
<body>


<h5 style="font-weight: bold">${docWaste.tableHeader.header}</h5>
<div class="form-control">


    <script>
        function addRow() {
            document.getElementById("table").insertRow(-1).innerHTML =
                '<c:forEach items="${document.docWaste.addRow.row.get(0).field}" var="td"><td><c:if test="${!(td.sql eq null)}"><form:select path="${td.path}.value" items="${values.get(td.sql)}"></form:select></c:if><c:if test="${td.sql eq null}"><form:input path="${td.path}.value"></form:input></c:if></td></c:forEach>';
            console.log("row added");
        }
    </script>


    <%--<form:select path="${td.path}.value" items="${values.get(td.sql)}"></form:select>--%>


    <table name="table" id="table" border="1">
        <tr>
            <c:forEach var="attr" items="${docWaste.tableHeader.column}">
                <c:choose>
                    <c:when test="${attr.column.size()>1}">
                        <th colspan="2" width="${attr.columnWidth}px">${attr.header}</th>
                    </c:when>
                    <c:otherwise>
                        <th rowspan="2" width="${attr.columnWidth}px">${attr.header}</th>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <th>Удалить строку</th>
        </tr>
        <tr>
            <c:forEach var="inAttr" items="${docWaste.tableHeader.column}">
                <c:forEach var="inAttrValue" items="${inAttr.column}">
                    <td>${inAttrValue.header}</td>

                </c:forEach>
            </c:forEach>
        </tr>

        <c:forEach var="row" items="${docWastePaths}">
            <c:set value="${docWaste.tableHeader.column.get(0).num}" var="num"></c:set>
            <c:if test="${!(docWasteList.get(row.get(num)) eq '')}">
                <tr name="tr" id="tr">
                    <c:forEach var="attr" items="${docWaste.tableHeader.column}">
                        <c:choose>
                            <c:when test="${attr.column.size()>1}">
                                <c:forEach var="val" items="${attr.column}">
                                    <c:if test="${attr.editable eq '1'}">
                                        <td>
                                            <form:input path="${row.get(val.num)}.value"
                                                        style="width: ${attr.columnWidth}px"></form:input>
                                        </td>
                                    </c:if>
                                    <c:if test="${attr.editable eq '0'}">
                                        <td>
                                            <form:input path="${row.get(val.num)}.value" readonly="true"
                                                        style="width: ${attr.columnWidth}px"></form:input>
                                        </td>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${attr.editable eq '1'}">
                                    <td>
                                        <form:input path="${row.get(attr.num)}.value"
                                                    style="width: ${attr.columnWidth}px"></form:input>
                                    </td>
                                </c:if>
                                <c:if test="${attr.editable eq '0'}">
                                    <td>
                                        <form:input path="${row.get(attr.num)}.value" readonly="true"
                                                    style="width: ${attr.columnWidth}px"></form:input>
                                    </td>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <td name="td" id="td" align="center"><input type="checkbox" class="checkbox" value="111">
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>


</div>


<input type="button" onclick="addRow()" class="btn btn-primary btn-sm" style="margin-left: 97%" value="+"/>

<script type="text/javascript">
    <%@include file="/WEB-INF/resources/JSFunction/checkBoxChecker.js"%>
    <%--<%@include file="/WEB-INF/resources/JSFunction/addNewRow.js"%>--%>
</script>
</body>
</html>