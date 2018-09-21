<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>


<c:if test="${attr.editable eq '1'}">
    <c:if test="${attr.visible eq '1'}">
        <c:if test="${attr.required eq '1'}">
            ${attr.prefix}

            <form:input type="number" path="${attr.path}.value" value="${attr.value}" min="${attr.minValue}"
                        max="${attr.maxValue}"
                        style="width: ${attr.inputWidth}; margin: 0.3%; text-align: ${attr.alignment}" required="true"/>
            <%--<input id="number" type="number" placeholder="${attr.footer}" min="${attr.minValue}" max="${attr.maxValue}"--%>
            <%--align="${attr.alignment}" value="${attr.value}"--%>
            <%--style="width: ${attr.inputWidth}; margin: 0.3%; text-align: ${attr.alignment}" required/>--%>
            ${attr.postfix}
        </c:if>
        <c:if test="${attr.required eq '0'}">
            ${attr.prefix}

            <form:input type="number" path="${attr.path}.value" value="${attr.value}" min="${attr.minValue}"
                        max="${attr.maxValue}"
                        style="width: ${attr.inputWidth}; margin: 0.3%; text-align: ${attr.alignment}"/>
            <%--<input id="number" type="number" placeholder="${attr.footer}" min="${attr.minValue}" max="${attr.maxValue}"--%>
            <%--align="${attr.alignment}" value="${attr.value}"--%>
            <%--style="width: ${attr.inputWidth}; margin: 0.3%; text-align: ${attr.alignment}"/>--%>
            ${attr.postfix}
        </c:if>
    </c:if>
</c:if>
<c:if test="${attr.editable eq '0'}">
    <c:if test="${attr.visible eq '1'}">

        <form:input type="number" path="${attr.path}.value" value="${attr.value}" min="${attr.minValue}"
                    max="${attr.maxValue}"
                    style="width: ${attr.inputWidth}; margin: 0.3%; text-align: ${attr.alignment}" readonly="true"/>
        <%--<input id="number" type="number" placeholder="${attr.footer}" prefix="${attr.prefix}" postfix="${attr.postfix}"--%>
        <%--min="${attr.minValue}" max="${attr.maxValue}" align="${attr.alignment}" value="${attr.value}"--%>
        <%--disabled style="width: ${attr.inputWidth}; margin: 0.3%; text-align: ${attr.alignment}"/>--%>
    </c:if>
</c:if>


<c:if test="${attrType.editable eq '1'}">
    <c:if test="${attrType.visible eq '1'}">
        <c:if test="${attrType.required eq '1'}">
            ${attrType.header}
            ${attrType.prefix}

            <form:input type="number" path="${attrType.path}.value" value="${attrType.value}" min="${attrType.minValue}"
                        max="${attrType.maxValue}"
                        style="width: ${attrType.inputWidth}; margin: 0.3%; text-align: ${attrType.alignment}"
                        required="true"/>
            <%--<input id="number" type="number" placeholder="${attrType.footer}" --%>
            <%--min="${attrType.minValue}" max="${attrType.maxValue}" align="${attrType.alignment}"--%>
            <%--value="${attrType.value}"--%>
            <%--style="margin: 0.3%; width: ${attrType.inputWidth}px; text-align: ${attrType.alignment}" required/>--%>
            ${attrType.postfix}
        </c:if>
        <c:if test="${attrType.required eq '0'}">
            ${attrType.header}
            ${attrType.prefix}

            <form:input type="number" path="${attrType.path}.value" value="${attrType.value}" min="${attrType.minValue}"
                        max="${attrType.maxValue}"
                        style="width: ${attrType.inputWidth}; margin: 0.3%; text-align: ${attrType.alignment}"/>
            <%--<input id="number" type="number" placeholder="${attrType.footer}" prefix="${attrType.prefix}"--%>
            <%--postfix="${attrType.postfix}"--%>
            <%--min="${attrType.minValue}" max="${attrType.maxValue}" align="${attrType.alignment}"--%>
            <%--value="${attrType.value}"--%>
            <%--style="margin: 0.3%; width: ${attrType.inputWidth}px; text-align: ${attrType.alignment}"/>--%>
            ${attrType.postfix}
        </c:if>
    </c:if>
</c:if>
<c:if test="${attrType.editable eq '0'}">
    <c:if test="${attrType.visible eq '1'}">
        ${attrType.header}
        ${attrType.prefix}

        <form:input type="number" path="${attrType.path}.value" value="${attrType.value}" min="${attrType.minValue}"
                    max="${attrType.maxValue}"
                    style="width: ${attrType.inputWidth}; margin: 0.3%; text-align: ${attrType.alignment}"
                    readonly="true"/>
        <%--<input id="number" type="number" placeholder="${attrType.footer}" prefix="${attrType.prefix}"--%>
        <%--postfix="${attrType.postfix}"--%>
        <%--min="${attrType.minValue}" max="${attrType.maxValue}" align="${attrType.alignment}"--%>
        <%--value="${attrType.value}" disabled--%>
        <%--style="margin: 0.3%; width: ${attrType.inputWidth}px; text-align: ${attrType.alignment}"/>--%>
        ${attrType.postfix}
    </c:if>
</c:if>
