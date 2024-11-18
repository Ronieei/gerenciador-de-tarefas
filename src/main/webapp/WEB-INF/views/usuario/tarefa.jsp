<%--
  Created by IntelliJ IDEA.
  User: roni
  Date: 31/08/2024
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../cabecalho_rodape/cabecalho.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<a href="/" class="home-inicio" >Home</a>
<h2 class="page-title">Gerenciamento de Tarefas</h2>

<!-- Formulário para adicionar nova tarefa -->
<form action="cadastrar_tarefa" method="post" class="task-form">
    <fieldset class="form-fieldset">
        <legend class="legenda-tarefa">Nova Tarefa</legend>

        <label for="titulo" class="form-label">
            Título:
            <input type="text" id="titulo" name="titulo" placeholder="Título" required class="form-input">
        </label>

        <label for="descricao" class="form-label">
            Descrição:
            <textarea id="descricao" name="descricao" placeholder="Descrição" maxlength="500" required class="form-text"></textarea>
            <!-- input type="text" id="descricao" name="descricao" placeholder="Descrição"  maxlength="500" required class="form-input" -->
        </label>

        <input type="submit" value="Adicionar Tarefa" class="submit-button">
    </fieldset>
</form>

<hr class="divider">

<!-- Lista de tarefas -->
<c:forEach var="tarefa" items="${sessionScope.tarefas}">
    <h3 class="${tarefa.concluido ? 'task-completed' : 'task-pending'} task-title">${tarefa.titulo}</h3>
    <p class="task-description">${tarefa.descricao}</p>

    <!-- Formulário para alterar o status da tarefa -->
    <form action="trocaconclusaodatarefa" method="get" class="status-form">
        <input type="hidden" name="id" value="${tarefa.id}">
        <input type="submit" value="${tarefa.concluido ? 'Marcar Não concluída' : 'Marcar concluída'}" class="status-button">
    </form>

    <!-- Link para deletar a tarefa -->
    <p><a href="deletartarefa?id=${tarefa.id}" class="delete-link">Deletar</a></p>
    <p><a href="editar_tarefa?id=${tarefa.id}" class="edit-link">Editar</a></p>

    <hr class="divider">
</c:forEach>

<%@ include file="../cabecalho_rodape/rodape.jsp" %>
