<%@ page session="false" trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
					<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

						<petclinic:layout pageName="games">

							<body style="background-color: #bea3cd;">
								<div class="row">
									<div class="col-6 h-100">
										<div class="row align-items-center h-100 mx-auto text-center"
											style="margin-top: 20pt;">
											<h1 class="fw-bolder">TU CARTA</h1>
										</div>
										<div class="row align-items-center h-100 mx-auto text-center">
											<div class="col-sm-12">
												<img class="img-responsive" src="${url}"
													style="width: 35%; margin-top: 20pt;">
											</div>
										</div>
										<div class="row align-items-center h-100 mx-auto text-center"
											style="margin-top: 20pt;">
											<c:forEach items="${fotos}" var="foto">
												<div class="col-sm-3">
													<form action="/minijuegos/actualizar" method="get">
														<button name="respuesta" value="${foto}"
															class="btn btn-lg text-white"
															style="margin-bottom: 10pt; width: 100%; background-color:${foto.colourCode};">
															<c:out value="${foto}" />
														</button>
													</form>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="col-6 h-100">
										<div class="row align-items-center h-100 mx-auto text-center"
											style="margin-top: 20pt;">
											<h1 class="fw-bolder">CARTA CENTRAL</h1>
										</div>
										<div class="row align-items-center h-100 mx-auto text-center">
											<div class="col-sm-12">
												<img class="img-responsive" src="${cartaCentralUrl}"
													style="width: 50%; margin-top: 20pt;">
											</div>
										</div>
									</div>
								</div>
								<h1>${end}</h1>
								<c:forEach items="${jugadores}" var="jugador">
									<h1>${jugador.user.username}</h1>
								</c:forEach>
							</body>
						</petclinic:layout>