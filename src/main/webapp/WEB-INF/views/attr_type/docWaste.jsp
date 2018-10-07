<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>

<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <style type="text/css">

        #wrap {
            display: none;
            opacity: 0.8;
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            padding: 16px;
            background-color: rgba(1, 1, 1, 0.725);
            z-index: 100;
            overflow: auto;
        }

        #window {
            width: 60%;
            height: 300px;
            margin: 50px auto;
            display: none;
            background: #fff;
            z-index: 200;
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            padding: 16px;
        }

        .close {
            margin-left: 364px;
            margin-top: 4px;
            cursor: pointer;
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
    <script type="text/javascript" src="http://yandex.st/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript">
        function show(state) {
            document.getElementById('window').style.display = state;
            document.getElementById('wrap').style.display = state;
        }

    </script>
</head>
<body>


<h5 style="font-weight: bold">${sessionScope.sessionDoc.docWaste.tableHeader.header}</h5>
<div class="form-control">
    <table name="table" id="table" border="1">
        <tr>
            <c:forEach var="attr" items="${sessionScope.sessionDoc.docWaste.tableHeader.column}">
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
            <c:forEach var="inAttr" items="${sessionScope.sessionDoc.docWaste.tableHeader.column}">
                <c:forEach var="inAttrValue" items="${inAttr.column}">
                    <td>${inAttrValue.header}</td>

                </c:forEach>
            </c:forEach>
        </tr>


       ${mm}

        <c:forEach var="row" items="${docWastePaths}">
            <c:set value="${sessionScope.sessionDoc.docWaste.tableHeader.column.get(0).num}" var="num"></c:set>

            <c:if test="${!(docWasteList.get(row.get(num)) eq '')}">
                <tr name="tr" id="tr">
                    <c:forEach var="attr" items="${sessionScope.sessionDoc.docWaste.tableHeader.column}">
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


<script>
    function testAjax() {
        var selectBoxValue = document.getElementById('select').value;
        // var value = selectBox.value;
        $.ajax({
            type: "post",
            url: "/ajaxTest",
            cache: false,
            data: 'testParam=' + selectBoxValue,
            error: function () {
                alert("ERROR");
            }
        });
        location.reload();
        document.getElementById('mainButton').click();
    }
</script>


<script type="text/javascript" language="javascript"
        src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
<script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>
<script type="text/javascript">
    <%@include file="/WEB-INF/resources/JSFunction/checkBoxChecker.js"%>
</script>

<a href="#" onclick="show('block')" style="margin-left: 93%" class="btn btn-primary btn-sm">Добавить</a>
<div onclick="show('none')" id="wrap" style="display: none;"></div>

<div id="window" style="display: none;">

    <img class="close" onclick="show('none')"
         src="https://sergey-oganesyan.ru/wp-content/uploads/2014/01/close.png"/>

    <select id="select">
        <c:forEach var="qq" items="${newTableRowValue.get('test').keySet()}">
            <option>${qq}</option>
        </c:forEach>
    </select>
    </p>
    <input type="button" id="buttonAdd" value="Добавить значение в таблицу"
           onclick="testAjax(); show('none');">
    <input type="button" id="buttonCancel" value="Отмена"
           onclick="show('none');">
</div>

</body>
</html>