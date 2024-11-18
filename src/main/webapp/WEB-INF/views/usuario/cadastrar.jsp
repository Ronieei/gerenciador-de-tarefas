<%--
  Created by IntelliJ IDEA.
  User: roni
  Date: 29/08/2024
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../cabecalho_rodape/cabecalho.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!-- Formulário de Cadastro -->
<form id="form-cadastro" action="cadastrar" method="post" class="formulario-cadastro">
    <fieldset class="grupo-cadastro">
        <legend>Informações do Usuário</legend>

        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" placeholder="Nome" required>

        <label for="login">Login:</label>
        <input type="text" id="login" name="login" placeholder="Login" required>

        <label for="telefone">Telefone:</label>
        <input type="text" id="telefone" name="telefone"
               pattern="\d{2} \d{5}-\d{4}"
               title="Telefone deve estar no formato XX XXXXX-XXXX"
               placeholder="11 12345-6789"
               required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Email">

        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" placeholder="Senha" required>

        <c:if test="${mostrarAdmin}">
            <label>Administrador:</label>
            <input type="radio" id="adminSim" name="admin" value="true"> Sim
            <input type="radio" id="adminNao" name="admin" value="false"> Não
        </c:if>

        <input type="submit" class="botao-submit" value="Cadastrar">
    </fieldset>
</form>
<a href="login" class="link-login">Voltar para o Login</a>

<%@ include file="../cabecalho_rodape/rodape.jsp" %>
