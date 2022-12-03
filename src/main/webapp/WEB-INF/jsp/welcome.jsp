<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
                <!-- %@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %-->

                <petclinic:layout pageName="home">

                    <body style="background-color: #bea3cd;">
                            <div class="row align-items-center h-100 mx-auto text-center">
                                <div class="col-sm-3">
                                    <a href='<spring:url value="/games/new" htmlEscape="true"/>'><button class="btn btn-secondary btn-lg" style="width: 100%;">CREAR PARTIDA</button></a>
                                </div>
                                <div class="col-sm-6">
                                    <img class="img-fluid" 
                                        src="https://fisiquimicamente.com/recursos-fisica-quimica/actividades-juegos/2eso-3eso/dobble-instrumentos-laboratorio/featured.png">
                                </div>
                                <div class="col-sm-3">
                                    <a href='<spring:url value="/games" htmlEscape="true"/>'><button class="btn btn-secondary btn-lg" style="width: 100%;">UNIRSE A PARDIDA</button></a>
                                </div>
                            </div>
                    </body>
                </petclinic:layout>