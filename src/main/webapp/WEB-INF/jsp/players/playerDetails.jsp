<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="players">

    <h2>Información de los Juagdores</h2>


    <table class="table table-striped">
        <tr>
            <th>Nombre y Apellido</th>
            <td><b><c:out value="${player.firstName} ${player.lastName}"/></b></td>
        </tr>
        <tr>
            <th>Username</th>
            <td><c:out value="${player.user.username}"/></td>
        </tr>
        
        <th>Telefono</th>
            <td><c:out value="${player.telephone}"/></td>
        </tr>
    </table>

    <spring:url value="{playerId}/edit" var="editUrl">
        <spring:param name="playerId" value="${player.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(editUrl)}" class="btn btn-default">Editar Jugador</a>

    <sec:authorize access="hasAuthority('admin')">
		<a class="btn btn-default" href='<spring:url value="/players/delete/${player.id}" htmlEscape="true"/>'>Eliminar Jugador</a>
	</sec:authorize>

    

         

</petclinic:layout>
