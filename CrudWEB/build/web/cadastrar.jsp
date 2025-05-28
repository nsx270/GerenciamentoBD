<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="estilos/meuestilo.css" rel="stylesheet">
    <title>Cadastrar produto</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .mensagem-erro {
            text-align: left;
            padding: 10px;
            margin-bottom: 15px;
            color: red;
        }
    </style>
</head>
<body>
    <div class="formi2">
        <h1>Menu de cadastro de produtos</h1>

        <%
            String mensagemErro = (String) request.getAttribute("msg");
            if (mensagemErro != null && !mensagemErro.isEmpty() && mensagemErro.toLowerCase().contains("preço inválido")) {
        %>
            <div class="mensagem-erro">
                <%= mensagemErro %>
            </div>
        <%
            }
        %>

        <form action="ControleProduto" method="POST">
            <div class="form-row">
                <div class="form-field-group">
                    <label for="txtnome">Nome:</label><br>
                    <input type="text" id="txtnome" name="txtnome" placeholder="Insira o nome do produto" autocomplete="off" required
                           value="<%= request.getParameter("txtnome") != null ? request.getParameter("txtnome") : "" %>">
                </div>
                <div class="form-field-group">
                    <label for="txtpreco">Preço:</label><br>
                    <input type="text" id="txtpreco" name="txtpreco" placeholder="Insira o preço em reais" autocomplete="off" required
                           value="<%= request.getParameter("txtpreco") != null ? request.getParameter("txtpreco") : "" %>">
                </div>
            </div>

            <div class="form-row">
                <div class="form-field-group">
                    <label for="txtdescricao">Descrição:</label><br>
                    <input type="text" id="txtdescricao" name="txtdescricao" placeholder="Insira a descrição do produto" autocomplete="off" required
                           value="<%= request.getParameter("txtdescricao") != null ? request.getParameter("txtdescricao") : "" %>">
                </div>
                <div class="form-field-group">
                    <label for="txtquantidade">Quantidade:</label><br>
                    <input type="text" id="txtquantidade" name="txtquantidade" placeholder="Insira a quantidade" autocomplete="off" required
                           value="<%= request.getParameter("txtquantidade") != null ? request.getParameter("txtquantidade") : "" %>">
                </div>
            </div>
            
            <div class="form-buttons">
                <input type="submit" name="op" value="CADASTRAR" id="bt1">
                <input type="button" value="RETORNAR" id="btr" onclick="window.location.href='principal.html'">
            </div>
        </form>
    </div>
</body>
</html>