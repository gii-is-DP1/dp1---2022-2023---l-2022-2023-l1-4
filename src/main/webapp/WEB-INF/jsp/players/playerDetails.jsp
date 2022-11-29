<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                    <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                    <petclinic:layout pageName="players">

                        <body style="background-color: #bea3cd;">
                            <div class="container h-100 align-items-center">
                                <table id="playersTable" class="table table-hover table-bordered table-responsive"
                                    style="background-color: white; margin-top: 5%;">
                                    <tr>
                                        <th>Nombre y Apellido</th>
                                        <td><b>
                                                <c:out value="${player.firstName} ${player.lastName}" />
                                            </b></td>
                                    </tr>
                                    <tr>
                                        <th>Username</th>
                                        <td>
                                            <c:out value="${player.user.username}" />
                                        </td>
                                    </tr>

                                    <th>Telefono</th>
                                    <td>
                                        <c:out value="${player.telephone}" />
                                    </td>
                                    </tr>
                                </table>

                                <sec:authorize access="hasAuthority('admin')">
                                    <spring:url value="{playerId}/edit" var="editUrl">
                                        <spring:param name="playerId" value="${player.id}" />
                                    </spring:url>
                                    <a href="${fn:escapeXml(editUrl)}" class="btn btn-secondary">Editar Jugador</a>
                                </sec:authorize>

                                <sec:authorize access="hasAuthority('admin')">
                                    <a class="btn btn-secondary"
                                        href='<spring:url value="/players/delete/${player.id}" htmlEscape="true"/>'>Eliminar
                                        Jugador</a>
                                </sec:authorize>
                            </div>
                        </body>
                    </petclinic:layout>