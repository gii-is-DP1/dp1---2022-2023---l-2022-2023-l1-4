<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                        <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                            <petclinic:layout pageName="seleccionMinijuego">

                                <body style="background-color: #bea3cd;">
                                    <div class="row align-items-center h-100 mx-auto text-center">
                                        <c:forEach items="${minijuegos}" var="minijuego">
                                            <div class="col-sm-3">
                                                <a href="/minijuegos/alvarito/${minijuego.id}/repartir">
                                                    <div class="card">
                                                        <img src="https://mdbcdn.b-cdn.net/img/new/standard/nature/184.webp"
                                                            class="card-img-top" alt="Fissure in Sandstone" />
                                                        <div class="card-body">
                                                            <h5 class="card-title">
                                                                <c:out value="${minijuego.name}"></c:out>
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </body>
                            </petclinic:layout>