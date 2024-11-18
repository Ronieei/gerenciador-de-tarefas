<%--
  Created by IntelliJ IDEA.
  User: roni
  Date: 01/08/2024
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>

<%@ include file="../cabecalho_rodape/cabecalho.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<p><a href="relatorio_de_usuarios" class="voltar-link">Voltar </a></p>
<c:if test="${usuarioLogado != null and usuarioLogado.isAdmin()}">
    <h2 class="titulo-relatorio">Resumo de Tarefas do Usuário</h2>
    <table class="tabela-relatorio">
        <thead>
            <tr>
                <th >ID</th>
                <th >Título</th>
                <th >Descrição</th>
                <th >Concluído</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tarefa" items="${tarefas}">
                <tr>
                    <td >${tarefa.id}</td>
                    <td >${tarefa.titulo}</td>
                    <td >${tarefa.descricao}</td>
                    <td >${tarefa.concluido ? 'Sim' : 'Não'}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<%@ include file="../cabecalho_rodape/rodape.jsp" %>
