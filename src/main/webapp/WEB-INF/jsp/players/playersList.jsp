<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                        <petclinic:layout pageName="players">
                            <body style="background-color: #bea3cd;">
                                <div class="container h-100 align-items-center">
                                    <table id="playersTable" class="table table-hover table-bordered table-responsive" style="background-color: white; margin-top: 5%;">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Username</th>
                                                <th>Telefono</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${selections}" var="player">
                                                <tr>
                                                    <td>
                                                        <spring:url value="/players/{playerId}" var="playerUrl">
                                                            <spring:param name="playerId" value="${player.id}" />
                                                        </spring:url>
                                                        <a href="${fn:escapeXml(playerUrl)}">
                                                            <c:out value="${player.firstName} ${player.lastName}" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${player.user.username}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${player.telephone}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </body>
                        </petclinic:layout>