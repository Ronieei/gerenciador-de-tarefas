<%--
  Created by IntelliJ IDEA.
  User: ghost
  Date: 01/09/2024
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../cabecalho_rodape/cabecalho.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!-- Verifica se existe uma tarefa no modelo -->
<c:if test="${not empty tarefa}">
    <table class="tabela-relatorio" >
        <thead>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Descrição</th>
            <th>Concluído</th>
            <th>ID do Usuário</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${tarefa.id}</td>
            <td>${tarefa.titulo}</td>
            <td>${tarefa.descricao}</td>
            <td>${tarefa.concluido ? 'Sim' : 'Não'}</td>
            <td>${tarefa.usuarioId}</td>
        </tr>
        </tbody>
    </table>
</c:if>

<!-- Link para voltar à página de relatórios -->
<p><a href="relatorio_de_usuarios" class="voltar-link">Voltar para Relatórios de Usuários</a></p>

<%@ include file="../cabecalho_rodape/rodape.jsp" %>