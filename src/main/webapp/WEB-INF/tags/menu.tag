<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, personas, vets or error"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://w7.pngwing.com/pngs/972/246/png-transparent-uno-asmodee-dobble-asmodee-editions-card-game-asmodee-spot-it-others-purple-game-text-thumbnail.png"
                alt="" width="30" height="24" class="d-inline-block align-text-top">
            DOBBLE
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/players/find">Encontrar Jugadores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/games/find">Encontrar Partidas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logros">Logros</a>
                </li>
            </ul>
            <sec:authorize access="!isAuthenticated()">
                <li class="d-flex">
                    <button class="btn btn-success me-2" type="button"><a href="<c:url value="
                            /login" />">Login</a></button>
                </li>
                <li class="d-flex">
                    <button class="btn btn-success me-2" type="button"><a href="<c:url value="
                            /players/new" />">Registro</a></button>
                </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
                            class="glyphicon glyphicon-user"></span>�
                        <strong>
                            <sec:authentication property="name" />
                        </strong> <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left">
                                            <strong>
                                                <sec:authentication property="name" />
                                            </strong>
                                        </p>
                                        <p class="text-left">
                                            <a href="<c:url value=" /logout" />"
                                            class="btn btn-primary btn-block btn-sm">Logout</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </sec:authorize>
            </ul>
        </div>
    </div>
    </div>
</nav>
