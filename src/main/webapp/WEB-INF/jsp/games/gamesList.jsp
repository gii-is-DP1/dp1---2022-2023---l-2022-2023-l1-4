<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                        <petclinic:layout pageName="games">
                            <body style="background-color: #bea3cd;">
                                <div class="container h-100 align-items-center">
                                    <table id="playersTable" class="table table-hover table-bordered table-responsive"
                                        style="background-color: white; margin-top: 5%;">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Numero de Jugadores</th>
                                                <th>Estado de Partida</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${selections}" var="game">
                                                <tr>
                                                    <td>
                                                        <spring:url value="/games/{gameId}" var="gameUrl">
                                                            <spring:param name="gameId" value="${game.id}" />
                                                        </spring:url>
                                                        <a href="${fn:escapeXml(gameUrl)}">
                                                            <c:out value="${game.name}" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${game.numPlayers}" />
                                                    </td>

                                                    <td>
                                                        <c:out value="${game.accessible}" />
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
                                </div>
                            </body>
                        </petclinic:layout>