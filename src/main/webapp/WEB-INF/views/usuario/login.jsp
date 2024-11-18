<%--
  Created by IntelliJ IDEA.
  User: roni
  Date: 29/08/2024
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../cabecalho_rodape/cabecalho.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<h2 class="titulo-formulario">Acesso ao Sistema</h2>
<!-- Formulário de Login -->
<form id="form-login" action="login" method="post" class="formulario-login">

    <label for="usuario" class="label-usuario">Usuário:</label>
    <input type="text" id="usuario" name="login" placeholder="Usuário" required aria-label="Usuário" class="input-usuario">

    <label for="senha" class="label-senha">Senha:</label>
    <input type="password" id="senha" name="senha" placeholder="Senha" required aria-label="Senha" class="input-senha">

    <button type="submit" class="botao-entrar">Entrar</button>
    <a href="cadastrar" class="link-cadastrar-form-login">Cadastrar usuario</a>
</form>


<%@ include file="../cabecalho_rodape/rodape.jsp" %>
