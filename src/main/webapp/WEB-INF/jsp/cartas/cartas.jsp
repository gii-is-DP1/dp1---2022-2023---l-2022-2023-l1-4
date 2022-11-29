<petclinic:layout pageName="cartas">
    <h2><fmt:message key="carta"/></h2>
    <div class="row">
        <div class="col-md-12">
            <spring:url value="/resources/images/cartas/carta01.png" htmlEscape="true" var="carta01"/>
            <spring:url value="/resources/images/logoPNG_3.png" htmlEscape="true" var="logoImage"/>
            <img class="img-responsive" src="${carta01}"/>
            <img class="img-responsive" src="${logoImage}"/>
        </div>
    </div>
</petclinic:layout>