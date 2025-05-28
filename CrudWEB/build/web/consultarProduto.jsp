<%-- 
    Document   : consultarProduto
    Created on : 24 de mai. de 2025, 12:31:17
    Author     : pedro
    Página de consulta de produtos
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="estilos/meuestilo.css" rel="stylesheet">
    <title>Consultar Produtos</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .tabela-produtos {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            font-size: 0.9rem;
        }
        .tabela-produtos th, .tabela-produtos td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .tabela-produtos th {
            background-color: #f2f2f2;
            color: #333;
        }
        .tabela-produtos tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .detalhe-produto p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="formi2" style="max-width: 800px;">
        <h1>Consultar Produtos</h1>
        <%
            String mensagem = (String) request.getAttribute("msg");
            if (mensagem != null) {
        %>
            <p style="color: <%= mensagem.startsWith("ERRO") ? "red" : "red" %>;"><%= mensagem %></p>
        <%
            }
        %>

        <form action="ControleProduto" method="GET" style="margin-bottom: 20px;">
            <input type="hidden" name="op" value="consultarPorId">
            <div class="form-field-group">
                <label for="txtProdutoId">Consultar por ID:</label>
                <input type="text" id="txtProdutoId" name="produtoId" placeholder="Digite o ID do Produto" style="margin-top:5px; margin-bottom:10px;">
            </div>
            <input type="submit" value="BUSCAR POR ID" id="bt4" class="button">
        </form>
        <hr style="margin: 20px 0;">

        <form action="ControleProduto" method="GET">
            <input type="hidden" name="op" value="consultarTodos">
            <input type="submit" value="LISTAR TODOS OS PRODUTOS" id="bt4" class="button">
        </form>
        <hr style="margin: 20px 0;">
        
        <% 
            Produto produtoConsultado = (Produto) request.getAttribute("produtoConsultado");
            List<Produto> listaProdutosConsultados = (List<Produto>) request.getAttribute("listaProdutosConsultados");
        %>

        <% if (produtoConsultado != null && produtoConsultado.getId() != 0) { %>
            <h2>Detalhes do Produto (ID: <%= produtoConsultado.getId() %>)</h2>
            <div class="detalhe-produto">
                <p><strong>Nome:</strong> <%= produtoConsultado.getNome() %></p>
                <p><strong>Preço:</strong> R$ <%= String.format("%.2f", produtoConsultado.getPreco()) %></p>
                <p><strong>Descrição:</strong> <%= produtoConsultado.getDescricao() %></p>
                <p><strong>Quantidade:</strong> <%= produtoConsultado.getQuantidade() %></p>
            </div>
            <hr style="margin: 20px 0;">
        <% } else if (request.getParameter("op") != null && request.getParameter("op").equals("consultarPorId") && (produtoConsultado == null || produtoConsultado.getId() == 0) && mensagem == null) { %>
            <p>Produto não encontrado com o ID fornecido.</p>
            <hr style="margin: 20px 0;">
        <% } %>
        <% if (listaProdutosConsultados != null && !listaProdutosConsultados.isEmpty()) { %>
            <h2>Lista de Todos os Produtos</h2>
            <table class="tabela-produtos">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Preço</th>
                        <th>Descrição</th>
                        <th>Quantidade</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Produto p : listaProdutosConsultados) { %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td><%= p.getNome() %></td>
                        <td>R$ <%= String.format("%.2f", p.getPreco()) %></td>
                        <td><%= p.getDescricao() %></td>
                        <td><%= p.getQuantidade() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else if (request.getParameter("op") != null && request.getParameter("op").equals("consultarTodos") && (listaProdutosConsultados == null || listaProdutosConsultados.isEmpty()) && mensagem == null) { %>
             <p>Não há produtos cadastrados para listar.</p>
        <% } %>
        
        <div class="form-buttons" style="margin-top: 30px;">
            <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='principal.html'">
        </div>
    </div>
</body>
</html>
