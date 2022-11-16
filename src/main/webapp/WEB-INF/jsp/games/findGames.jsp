<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->

<petclinic:layout pageName="games">

    
    <form:form action="/games" method="get" modelAttribute="game">
                                    <section class="vh-100 gradient-custom">
                                        <div class="container py-5 h-100">
                                            <div class="row justify-content-center align-items-center h-25">
                                                <div class="col-12 col-lg-9 col-xl-7">
                                                    <div class="card shadow-2-strong card-registration"
                                                        style="border-radius: 15px;">
                                                        <div class="card-body p-4 p-md-5">
                                                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Find Games</h3>
                                                            <div class="row">
                                                                <div class="col-md-12 mb-4">

                                                                    <div class="form-outline">
                                                                        <petclinic:inputField label="Name"
                                                                            name="name" />
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 mb-4 pb-2">
                                                                    <div class="col-sm-offset-2 col-sm-10">
                                                                        <button type="submit"
                                                                            class="btn btn-success">Find
                                                                            Game</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </section>


                                </form:form>


	

</petclinic:layout>
