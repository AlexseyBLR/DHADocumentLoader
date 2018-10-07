<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>Update table</title>
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
<div>
    <form:form action="/toDocPage" method="get">
        <input type="submit" value="back with save this table" class="btn btn-primary"/>
    </form:form>
    <div>
        <table name="table" id="table" border="1">
            <tr>
                <c:forEach var="attr" items="${docWasteObj.tableHeader.column}">
                    <c:choose>
                        <c:when test="${attr.column.size()>1}">
                            <th colspan="2" width="${attr.columnWidth}px">${attr.header}</th>
                        </c:when>
                        <c:otherwise>
                            <th rowspan="2" width="${attr.columnWidth}px">${attr.header}</th>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="inAttr" items="${docWasteObj.tableHeader.column}">
                    <c:forEach var="inAttrValue" items="${inAttr.column}">
                        <td>${inAttrValue.header}</td>
                    </c:forEach>
                </c:forEach>
            </tr>
        </table>

        <script>
            function testAjax() {
                var selectBox = document.getElementById('select');
                var value = selectBox.value;
                drawNewRow(value);
                $.ajax({
                    type: "post",
                    url: "/ajaxTest",
                    cache: false,
                    data: 'testParam=' + value,
                    error: function () {
                        alert("ERROR");
                    }
                });
            }

            function drawNewRow(value) {
                document.getElementById("table").insertRow(-1).innerHTML =
                    '<c:forEach items="${document.docWaste.addRow.row.get(0).field}" var="td"><td>value</td></c:forEach>';
                console.log("row added");
            }
        </script>

        <form method="post">
            <input type="button" value="Ajax Submit" onclick="testAjax();">
        </form>

        <select id="select" onchange="fun()">
            <c:forEach var="qq" items="${newTableRowValue.get('test').keySet()}">
                <option>${qq}</option>
            </c:forEach>
        </select>


    </div>
</div>
<script type="text/javascript" language="javascript"
        src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
<script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>
</body>
</html>