<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"  href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<title>Logros</title>
</head>
<body>
	<h2>Logros:</h2>
	<div class="container">
		<br />
		<c:if test="${message != null}">
		<div class="alert alert-${messageType}">
			<c:out value="${message}"></c:out>
			<a href="#" class="close" data-dismiss="alert" aria-label="close">�</a>
		</div>
		</c:if>
	</div>
	<a href="/logros/create"><span class="glyphicon glyphicon-plus sucess" aria-hidden="true"></span>Crear Logro</a>
	<table class="table table-striped">
		<tr>
			<th>Nombre</th>
			<th>Nivel</th>			
			<th>Actions</th>
		</tr>
		<c:forEach items="${logros}" var="logro">
			<tr>
				<td><c:out value="${logro.name}"/></td>
				<td><c:out value="${logro.nivel}"/></td>				
				<td><a href="/logros/edit/${logro.id}" ><span class="glyphicon glyphicon-pencil warning" aria-hidden="true"></span></a>&nbsp;<a href="/logros/delete/${logro.id}"><span class="glyphicon glyphicon-trash alert" aria-hidden="true"></a> </td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>