<%@ page session="false" trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
					<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

						<petclinic:layout pageName="games">

							<body style="background-color: #bea3cd;">
								<div class="row align-items-center h-100 mx-auto text-center">
									<div class="col-sm-12">
										<img class="img-fluid" src="${url}" style="width: 500px; margin-top: 25pt;">
									</div>
								</div>
								<div class="row align-items-center h-100 mx-auto text-center" style="margin-top: 25pt; padding-right: 35%; padding-left: 35%;">
									<c:forEach items="${fotos}" var="foto">
										<div class="col-sm-6">
											<button class="btn btn-lg btn-warning" style="margin-top: 25pt; width: 100%;">
												<c:out value="${foto}" />
											</button>
										</div>
									</c:forEach>
								</div>
							</body>
						</petclinic:layout>