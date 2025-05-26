<%-- 
    Document   : atualizar
    Created on : 24 de mai. de 2025, 12:10:03
    Author     : pedro
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="estilos/meuestilo.css" rel="stylesheet">
        <title>Atualizar Produto - Seleção</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="formi2">
            <h1>Selecione o Produto para Atualizar</h1>
            <%
                List<Produto> listaProdutos = (List<Produto>) request.getAttribute("listaProdutos");
                String mensagem = (String) request.getAttribute("msg");

                if (mensagem != null) {
            %>
            <p style="color: <%= mensagem.startsWith("ERRO") ? "red" : "blue" %>;"><%= mensagem %></p>
            <%
                }
            %>

            <% if (listaProdutos != null && !listaProdutos.isEmpty()) { %>
            <form action="ControleProduto" method="GET">
                <input type="hidden" name="op" value="carregarParaEditar">
                <div class="form-field-group">
                    <label for="produtoId">Selecione o Produto:</label><br>
                    <select name="produtoId" id="produtoId" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; font-size: 0.95rem; margin-bottom: 1rem;">
                        <% for (Produto p : listaProdutos) { %>
                        <option value="<%= p.getId() %>"><%= p.getNome() %> - <%= p.getDescricao() %></option>
                        <% } %>
                    </select>
                </div>
                
                <div class="form-buttons">
                    <input type="submit" value="EDITAR PRODUTO SELECIONADO" class="button" id="bt2">
                    <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='principal.html'">
                </div>
            </form>
            <% } else if (mensagem == null) { %>
            <p>Não há produtos cadastrados.</p>
             <div class="form-buttons">
                <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='principal.html'">
            </div>
            <% } %>
        </div>
    </body>
</html>