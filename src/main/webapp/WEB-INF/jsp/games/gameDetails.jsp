<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                    <petclinic:layout pageName="games">
                        <body style="background-color: #bea3cd;">
                            <div class="container h-100 align-items-center">
                                <table id="playersTable" class="table table-hover table-bordered table-responsive"
                                    style="background-color: white; margin-top: 5%;">
                                    <tr>
                                        <th>Nombre</th>
                                        <td><b>
                                                <c:out value="${game.name}" />
                                            </b></td>
                                    </tr>
                                    <tr>
                                        <th>Estado de la Partida</th>
                                        <td>
                                            <c:out value="${game.startGame}" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </body>
                    </petclinic:layout>

