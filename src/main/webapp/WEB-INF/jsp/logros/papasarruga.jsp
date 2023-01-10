<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                    <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                        <petclinic:layout pageName="papacaliente">

                            <body style="background-color: #bea3cd;">
                                <div class="row">
                                    <div class="col-6 h-100">
                                        <div class="row align-items-center h-100 mx-auto text-center"
                                            style="margin-top: 20pt;">
                                            <h1 class="fw-bolder">TU CARTA</h1>
                                        </div>
                                        <div class="row align-items-center h-100 mx-auto text-center">
                                            <div class="col-sm-12">
                                                <img class="img-responsive" src="${miCarta}"
                                                    style="width: 35%; margin-top: 10pt;">
                                            </div>
                                        </div>
                                        <div class="row align-items-center h-100 mx-auto text-center"
                                            style="margin-top: 20pt;">
                                            <c:forEach items="${misBotones}" var="foto">
                                                <div class="col-sm-3">
                                                    <form action="/minijuegos/actualizar" method="get">
                                                        <c:if test="${boton == true}">
                                                        <button name="respuesta" value="${foto}"
                                                            class="btn btn-outline-dark btn-lg text-white"
                                                            style="margin-bottom: 5pt; width: 75%; background-color:${foto.colourCode};">
                                                            <c:out value="${foto}" />
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${boton == false}">
                                                        <button name="respuesta" value="${foto}" disabled
                                                            class="btn btn-outline-dark btn-lg text-white"
                                                            style="margin-bottom: 5pt; width: 75%; background-color:${foto.colourCode};">
                                                            <c:out value="${foto}" />
                                                        </button>
                                                    </c:if>
                                                    </form>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-6 h-100">
                                        <c:forEach items="${listaCartas}" var="carta">
                                            <div class="text-center">
                                                    <a href="/minijuegos/cartaSeleccionada/${carta.id}"><img
                                                            class="img-responsive hover-shadow" src="${carta.url}"
                                                            style="width: 25%; margin-top: 20pt;"></a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </body>
                        </petclinic:layout>