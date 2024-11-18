<%--
  Created by IntelliJ IDEA.
  User: ghost
  Date: 30/09/2024
  Time: 00:19
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../cabecalho_rodape/cabecalho.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<a href="/" class="home-inicio" >Home</a>
<h2 class="page-title">Editar Tarefa</h2>

<form action="editar_tarefa" method="post" class="task-form">
    <input type="hidden" name="id" value="${tarefa.id}" required/>

    <label for="titulo">Título:</label>
    <input type="text" id="titulo" name="titulo" value="${tarefa.titulo}" required
           placeholder="Digite o título da tarefa" aria-label="Título" class="form-input"/><br/>

    <label for="descricao">Descrição:</label>
    <textarea id="descricao" name="descricao" rows="10" cols="60"
              placeholder="Digite a descrição da tarefa" aria-label="Descrição"
              class="form-textarea">${tarefa.descricao}</textarea><br/>

    <button type="submit" class="submit-button">Salvar</button>
</form>

<a href="tarefa" class="back-link">Voltar para a lista de tarefas</a>

<%@ include file="../cabecalho_rodape/rodape.jsp" %>
