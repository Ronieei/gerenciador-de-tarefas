<%--
  Created by IntelliJ IDEA.
  User: roni
  Date: 29/08/2024
  Time: 02:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Sistema de gerenciamento de tarefas">
    <meta name="author" content="Roni">
    <meta name="keywords" content="sistema, login, JSP, Tarefas">
    <link type="image/png" sizes="32x32" rel="icon" href="${pageContext.request.contextPath}/WEB-INF/icons.png">
    <link rel="stylesheet" type="text/css" href="estilo_tarefas.css">
    <title>Sistema</title>

</head>
<body>
<h3>
    <c:if test="${not empty mensagemErro}">
        <span class="error-message"><c:out value="${mensagemErro}" /></span>
    </c:if>
</h3>
<h4>
    <c:choose>
        <c:when test="${not empty usuarioLogado}">
        Bem-vindo, <c:out value="${usuarioLogado.nome}" />!
        </c:when>
            <c:otherwise>
            <span class="success-message">Você não está logado.</span>
            </c:otherwise>
    </c:choose>
</h4>
