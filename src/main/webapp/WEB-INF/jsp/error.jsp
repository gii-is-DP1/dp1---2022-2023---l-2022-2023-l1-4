<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="error">
    <spring:url value="/resources/images/elBicho.png" var="petsImage"/>
    <img src="${petsImage}" style="display: block; margin: 0 auto;"/>

    <h2 style="text-align: center;">Ups, hay un error</h2>
    <h3 style="text-align: center;">EL BICHO ACABA DE FICHAR POR EL BETIS O EN SU DEFECTO LA PAGINA NO HA SIDO ENCONTRADA</h3>

    <p>${exception.message}</p>
</petclinic:layout>
