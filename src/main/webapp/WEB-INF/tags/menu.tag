<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, personas, vets or error"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="color: yellow;">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img src="https://fisiquimicamente.com/recursos-fisica-quimica/actividades-juegos/2eso-3eso/dobble-instrumentos-laboratorio/featured.png"
                alt="" width="80" height="75" class="d-inline-block align-text-top">
        </a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav">
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
                <li class="nav-item">
                    <a class="nav-link" href="/instructions">Instrucciones</a>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <sec:authorize access="!isAuthenticated()">
                <li class="d-flex">
                    <a href="<c:url value="/login" />"><button class="btn btn-warning me-2" type="button">Login</button></a>
                </li>
                <li class="d-flex">
                    <a href="<c:url value="/players/new" />"><button class="btn btn-warning me-2" type="button">Registro</button></a>
                </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li class="dropdown">
                    <div class="dropdown">
                        <button
                          class="btn btn-warning dropdown-toggle"
                          type="button"
                          id="dropdownMenuButton"
                          data-mdb-toggle="dropdown"
                          aria-expanded="false"
                        >
                        <sec:authentication property="name" />
                        </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href='<c:url value=" /logout" />'>Logout <i class="fa-solid fa-right-from-bracket"></i></a></li>
                        <li><sec:authorize url="/myProfile">
                            <petclinic:menuItem active="${name eq 'players'}" url="/myProfile" title="my profile">
                                <span class="dropdown-item">My Profile <i class="fa-solid fa-user"></i></a></li></span>
                            </petclinic:menuItem>
                        </sec:authorize></li>  
                    </ul>
                </li>
            </sec:authorize>
        </div>
    </div>
    </div>
</nav>
