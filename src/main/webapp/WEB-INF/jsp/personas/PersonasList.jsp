<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="personas">
    <h2>Lista de Jugadores</h2>

    <table id="personasTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Nombre y Apellido</th>
            <th style="width: 200px;">Username</th>
            <th style="width: 120px">Telefono</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${selections}" var="persona">
            <tr>
                <td>
                    <spring:url value="/personas/{personaId}" var="personaUrl">
                        <spring:param name="personaId" value="${persona.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(personaUrl)}"><c:out value="${persona.firstName} ${persona.lastName}"/></a>
                </td>
                <td>
                    <c:out value="${persona.username}"/>
                </td>
                <td>
                    <c:out value="${persona.telephone}"/>
                </td>
                                
      
<!--
                <td> 
                    <c:out value="${persona.user.username}"/> 
                </td>
                <td> 
                   <c:out value="${persona.user.password}"/> 
                </td> 
-->
                
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>
