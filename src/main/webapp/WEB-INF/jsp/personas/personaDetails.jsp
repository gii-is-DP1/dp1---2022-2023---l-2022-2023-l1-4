<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="personas">

    <h2>Información de los Juagdores</h2>


    <table class="table table-striped">
        <tr>
            <th>Nombre y Apellido</th>
            <td><b><c:out value="${persona.firstName} ${persona.lastName}"/></b></td>
        </tr>
        <tr>
            <th>Username</th>
            <td><c:out value="${persona.user.username}"/></td>
        </tr>
        
        <th>Telefono</th>
            <td><c:out value="${persona.telefono}"/></td>
        </tr>
    </table>

    <spring:url value="{personaId}/editar" var="editUrl">
        <spring:param name="personaId" value="${persona.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(editUrl)}" class="btn btn-default">Editar Persona</a>

         

</petclinic:layout>
