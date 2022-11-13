<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="partidas">
    <h2>Lista de Jugadores</h2>

    <table id="partidasTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Nombre</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${selections}" var="partida">
            <tr>
                <td>
                    <spring:url value="/partidas/{partidaId}" var="partidaUrl">
                        <spring:param name="partidaId" value="${partida.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(partidaUrl)}"><c:out value="${partida.name}"/></a>
                </td>
                <td>
                    <c:out value="${partida.name}"/>
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
