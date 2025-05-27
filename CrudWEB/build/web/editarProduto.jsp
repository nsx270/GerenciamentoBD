<%-- 
    Document   : editarproduto
    Created on : 24 de mai. de 2025, 12:10:27
    Author     : pedro
    Página de edição dos produtos
--%>

<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="estilos/meuestilo.css" rel="stylesheet">
    <title>Editar Produto</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="formi2">
        <h1>Editar Produto</h1>
        <%
            Produto produtoParaEditar = (Produto) request.getAttribute("produtoParaEditar");
            String mensagem = (String) request.getAttribute("msg");

            if (mensagem != null) {
        %>
            <p style="color: <%= mensagem.startsWith("ERRO") ? "red" : "green" %>;"><%= mensagem %></p>
        <%
            }

            if (produtoParaEditar != null) {
        %>
        <form action="ControleProduto" method="POST">
            <input type="hidden" name="op" value="SALVAR_ATUALIZACAO">
            <input type="hidden" name="produtoId" value="<%= produtoParaEditar.getId() %>">

            <div class="form-row">
                <div class="form-field-group">
                    <label for="txtnome">Nome:</label><br>
                    <input type="text" id="txtnome" name="txtnome" value="<%= produtoParaEditar.getNome() != null ? produtoParaEditar.getNome() : "" %>" placeholder="Insira o nome do produto">
                </div>
                <div class="form-field-group">
                    <label for="txtpreco">Preço:</label><br>
                    <input type="text" id="txtpreco" name="txtpreco" value="<%= produtoParaEditar.getPreco() %>" placeholder="Insira o preço em reais">
                </div>
            </div>

            <div class="form-row">
                <div class="form-field-group">
                    <label for="txtdescricao">Descrição:</label><br>
                    <input type="text" id="txtdescricao" name="txtdescricao" value="<%= produtoParaEditar.getDescricao() != null ? produtoParaEditar.getDescricao() : "" %>" placeholder="Insira a descrição do produto">
                </div>
                <div class="form-field-group">
                    <label for="txtquantidade">Quantidade:</label><br>
                    <input type="text" id="txtquantidade" name="txtquantidade" value="<%= produtoParaEditar.getQuantidade() != null ? produtoParaEditar.getQuantidade() : "" %>" placeholder="Insira a quantidade">
                </div>
            </div>
            
            <div class="form-buttons">
                <input type="submit" value="SALVAR ALTERAÇÕES" id="bt2">
                <input type="button" value="CANCELAR" id="btr" onclick="window.location.href='ControleProduto?op=listarParaAtualizar'">
            </div>
        </form>
        <%
            } else if (mensagem == null) {
        %>
            <p>Produto não encontrado para edição.</p>
            <div class="form-buttons">
                <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='ControleProduto?op=listarParaAtualizar'">
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
