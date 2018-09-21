<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>


<c:if test="${attr.visible eq '1'}">
    <c:if test="${attr.editable eq '1'}">
        <c:if test="${attr.required eq '1'}">
            ${attr.prefix}

            <form:textarea path="${attr.path}.value" placeholder="${attr.footer}"
                           minlength="${attr.minLength}" maxlength="${attr.maxLength}"
                           style="width: ${attr.inputWidth}px; height: 100px; text-align: ${attr.alignment}"
                           required="true" value="${attr.value}"/>
            <%--<textarea placeholder="${attr.footer}"--%>
                      <%--minlength="${attr.minLength}" maxlength="${attr.maxLength}"--%>
                      <%--style="width: ${attr.inputWidth}px; height: 100px; text-align: ${attr.alignment}"--%>
                      <%--required>${attr.value} </textarea>--%>
            ${attr.postfix}
        </c:if>
        <c:if test="${attr.required eq '0'}">
            ${attr.prefix}

            <form:textarea path="${attr.path}.value" placeholder="${attr.footer}"
                           minlength="${attr.minLength}" maxlength="${attr.maxLength}"
                           style="width: ${attr.inputWidth}px; height: 100px; text-align: ${attr.alignment}"
                           value="${attr.value}"/>
            <%--<textarea placeholder="${attr.footer}"--%>
                      <%--minlength="${attr.minLength}" maxlength="${attr.maxLength}"--%>
                      <%--style="width: ${attr.inputWidth}px; height: 100px; text-align: ${attr.alignment}">${attr.value} </textarea>--%>
            ${attr.postfix}
        </c:if>
    </c:if>
    <c:if test="${attr.editable eq '0'}">

        <form:textarea path="${attr.path}.value" placeholder="${attr.footer}"
                       minlength="${attr.minLength}" maxlength="${attr.maxLength}"
                       style="width: ${attr.inputWidth}px; height: 100px; text-align: ${attr.alignment}"
                       disabled="true" value="${attr.value}"/>
        <%--<textarea placeholder="${attr.footer}"--%>
                  <%--minlength="${attr.minLength}" maxlength="${attr.maxLength}" style="text-align: ${attr.alignment}"--%>
                  <%--disabled>${attr.value}</textarea>--%>
    </c:if>
</c:if>


<c:if test="${attrType.visible eq '1'}">
    <c:if test="${attrType.editable eq '1'}">
        <c:if test="${attrType.required eq '1'}">
            ${attrType.header}
            ${attrType.prefix}

            <form:textarea path="${attrType.path}.value" placeholder="${attrType.footer}"
                           minlength="${attrType.minLength}" maxlength="${attrType.maxLength}"
                           style="width: ${attrType.inputWidth}px; height: 100px; text-align: ${attrType.alignment}"
                           required="true" value="${attrType.value}"/>
            <%--<textarea placeholder="${attrType.footer}"--%>
                      <%--minlength="${attrType.minLength}" maxlength="${attrType.maxLength}"--%>
                      <%--style="text-align: ${attr.alignment}"--%>
                      <%--required>${attrType.value}</textarea>--%>
            ${attrType.postfix}
        </c:if>
        <c:if test="${attrType.required eq '0'}">
            ${attrType.header}

            <form:textarea path="${attrType.path}.value" placeholder="${attrType.footer}"
                           minlength="${attrType.minLength}" maxlength="${attrType.maxLength}"
                           style="width: ${attrType.inputWidth}px; height: 100px; text-align: ${attrType.alignment}"
                           value="${attrType.value}"/>
            <%--<textarea placeholder="${attrType.footer}"--%>
                      <%--minlength="${attrType.minLength}" maxlength="${attrType.maxLength}"--%>
                      <%--style="text-align: ${attr.alignment}">${attrType.value}</textarea>--%>
        </c:if>
    </c:if>
    <c:if test="${attrType.editable eq '0'}">
        ${attrType.header}
        ${attrType.prefix}

        <form:textarea path="${attrType.path}.value" placeholder="${attrType.footer}"
                       minlength="${attrType.minLength}" maxlength="${attrType.maxLength}"
                       style="width: ${attrType.inputWidth}px; height: 100px; text-align: ${attrType.alignment}"
                       readonly="true" value="${attrType.value}"/>
        <%--<textarea placeholder="${attrType.footer}"--%>
                  <%--minlength="${attrType.minLength}" maxlength="${attrType.maxLength}"--%>
                  <%--style="text-align: ${attr.alignment}"--%>
                  <%--disabled>${attrType.value}</textarea>--%>
        ${attrType.postfix}
    </c:if>
</c:if>
