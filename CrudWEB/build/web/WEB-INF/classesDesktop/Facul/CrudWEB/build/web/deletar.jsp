<%-- 
    Document   : deletar
    Created on : 24 de mai. de 2025, 11:53:05
    Author     : pedro
    Página onde se seleciona e deleta os produtos
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="estilos/meuestilo.css" rel="stylesheet">
        <title>Deletar Produto</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="formi2">
            <h1>Menu de Deleção de Produtos</h1>
            <%
                List<Produto> listaProdutos = (List<Produto>) request.getAttribute("listaProdutos");
                String mensagem = (String) request.getAttribute("msg");
                if (mensagem != null) {
            %>
            <p style="color: <%= mensagem.startsWith("ERRO") ? "red" : "green" %>;"><%= mensagem %></p>
            <%
                }
            %>
            <% if (listaProdutos != null && !listaProdutos.isEmpty()) { %>
            <form action="ControleProduto" method="POST">
                <div class="form-field-group">
                    <label for="produtoId">Selecione o Produto para Deletar:</label><br>
                    <select name="produtoId" id="produtoId" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; font-size: 0.95rem; margin-bottom: 1rem;">
                        <% for (Produto p : listaProdutos) { %>
                        <option value="<%= p.getId() %>"><%= p.getNome() %> - <%= p.getDescricao() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-buttons">
                    <input type="submit" name="op" value="DELETAR" id="bt3">
                    <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='principal.html'">
                </div>
            </form>
            <% } else if (mensagem == null) { %>
            <p>Não há produtos cadastrados para deletar.</p>
            <div class="form-buttons">
                <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='principal.html'">
            </div>
            <% } else if (mensagem != null && listaProdutos == null) { %>
             <div class="form-buttons">
                <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='principal.html'">
            </div>
            <% } %>
        </div>
    </body>
</html>