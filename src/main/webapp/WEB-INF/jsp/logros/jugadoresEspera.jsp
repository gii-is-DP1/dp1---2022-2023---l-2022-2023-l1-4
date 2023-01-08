<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


                        <petclinic:layout pageName="espera">

                            <body style="background-color: #bea3cd;">
                                <div class="container" style="margin-top: 20%;">
                                    <div class="row text-center">
                                        <div class="col-6">
                                            <h2>GANADOR</h2>
                                            <p>${ganador.firstName}</p>
                                        </div>
                                        <div class="col-6">
                                            <h2>PERDEDOR</h2>
                                            <p>${perdedor.firstName}</p>
                                        </div>
                                    </div>
                                </div>
                            </body>
                        </petclinic:layout>