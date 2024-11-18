<%--
  Created by IntelliJ IDEA.
  User: ghost
  Date: 02/09/2024
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>

<%@ include file="../cabecalho_rodape/cabecalho.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<a href="/" class="home-inicio" >Home</a>
<c:if test="${usuarioLogado != null and usuarioLogado.isAdmin()}">
    <h2 class="titulo-relatorio">Relatório de Usuários</h2>

    <form action="pesquisar_tarefas" class="formulario-pesquisa">
        <label for="id_pesquisa" class="label-pesquisa">Tarefa ID: </label>
        <input type="search" placeholder="ID ou número da tarefa" name="id" id="id_pesquisa" alt="pesquisa de tarefa pelo ID" class="campo-pesquisa">
        <input type="submit" value="Pesquisar" alt="botão de pesquisa" class="botao-pesquisa">
    </form>

    <table class="tabela-relatorio">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Login</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Admin</th>
                <th>Senha</th>
                <th>Tarefas</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="usuario" items="${listaUsuarios}">
                <tr>
                    <td>${usuario.id}</td>
                    <td>${usuario.nome}</td>
                    <td>${usuario.login}</td>
                    <td>${usuario.email}</td>
                    <td>${usuario.telefone}</td>
                    <td>${usuario.admin ? 'Sim' : 'Não'}</td>
                    <td>${usuarioLogado.isAdmin() ? usuario.senha : 'Inválido'}</td>
                    <td>
                        <form action="/relatorio_tarefa_usuario" class="formulario-resumo">
                            <input type="submit" value="Resumo" class="botao-resumo">
                            <input value="${usuario.id}" type="hidden" name="id">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<%@ include file="../cabecalho_rodape/rodape.jsp" %>
