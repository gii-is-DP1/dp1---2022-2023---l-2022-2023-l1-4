<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                        <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                            <petclinic:layout pageName="seleccionMinijuego">

                                <body style="background-color: #bea3cd;">
                                    <div class="row justify-content-around text-center" style="margin-top: 5%;">
                                        <c:forEach items="${minijuegos}" var="minijuego">
                                            <div class="col-sm-3">
                                                <c:if test="${minijuego != 'LA_PATATA_CALIENTE'}">
                                                    <a href="/games/${gameId}/minijuegos/${minijuego}/nuevaRonda">
                                                        <div class="card">
                                                </c:if>
                                                <c:if test="${minijuego == 'LA_PATATA_CALIENTE'}">
                                                    <a>
                                                        <div class="card" type="button" class="btn btn-primary"
                                                            data-mdb-toggle="modal" data-mdb-target="#exampleModal">
                                                </c:if>
                                                <img src="https://mdbcdn.b-cdn.net/img/new/standard/nature/184.webp"
                                                    class="card-img-top" alt="Fissure in Sandstone" />
                                                <div class="card-body">
                                                    <h5 class="card-title">
                                                        <c:if test="${minijuego == 'TORRE_INFERNAL'}">
                                                            TORRE INFERNAL
                                                        </c:if>
                                                        <c:if test="${minijuego == 'EL_FOSO'}">
                                                            EL FOSO
                                                        </c:if>
                                                        <c:if test="${minijuego == 'LA_PATATA_CALIENTE'}">
                                                            LA PATATA CALIENTE
                                                        </c:if>
                                                    </h5>
                                                </div>
                                            </div>
                                            </a>
                                    </div>
                                    </c:forEach>
                                    </div>
                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Seleccionar Rondas
                                                    </h5>
                                                    <button type="button" class="btn-close" data-mdb-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-outline">
                                                        <form
                                                            action="/games/${gameId}/minijuegos/LA_PATATA_CALIENTE/nuevaRonda"
                                                            method="get">
                                                            <input type="number" id="rondas" class="form-control"
                                                                max="5" min="3" name="rondas" value="rondas" />
                                                            <label class="form-label" for="typeNumber">Rondas</label>
                                                        
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                        data-mdb-dismiss="modal">Cerrar</button>
                                                    <button name="rondas" value="${rondas}" type="submit"
                                                        class="btn btn-success">Empezar
                                                        partida</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </body>
                            </petclinic:layout>