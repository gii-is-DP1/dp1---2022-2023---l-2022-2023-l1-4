<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="La torre infernal">
    <h2>La torre infernal</h2>

    <table id="minijuegosTable" class="table table-striped">
        <thead>
            <tr>
                <th style="width: 150px;">Nombre</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <c:forEach items="${minijuegos}" var="name" >
                        <c:out value="${minijuegos.name} "/>
                    </c:forEach>                    
                </td>
            </tr>
        </tbody>
    </table>
</petclinic:layout>