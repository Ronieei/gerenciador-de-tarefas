<%--
  Created by IntelliJ IDEA.
  User: roni
  Date: 30/08/2024
  Time: 04:02
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="cabecalho_rodape/cabecalho.jsp" %>

<!-- Links de Navegação -->
<div id="nav-links">
    <a href="login" class="nav-link">Login</a>
    <a href="cadastrar" class="nav-link">Cadastrar</a>
    <c:if test="${usuarioLogado != null }">
    <a href="tarefa" class="nav-link">Tarefas</a>
    <a href="sair" class="nav-link">Sair - logout</a>
    </c:if>
    <c:if test="${usuarioLogado != null and usuarioLogado.admin == true }">
    <a href="relatorio_de_usuarios" class="nav-link">Relatorio de Usuarios</a>
     </c:if>
</div>

<%@ include file="cabecalho_rodape/rodape.jsp" %>
