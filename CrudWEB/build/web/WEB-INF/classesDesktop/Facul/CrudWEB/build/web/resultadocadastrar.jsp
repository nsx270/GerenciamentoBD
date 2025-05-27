<%-- 
    Document   : resultadocadastrar
    Created on : 15 de mai. de 2025, 10:21:59
    Author     : pedro
    Página de sucesso de cadastro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <style>
        body{
            text-align: center;
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #28a745;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .check-icon{
                width: 80px;
                height: auto;
                margin-bottom: 1rem;
        }
        #btr{
                margin-top: 1rem;
                padding: 12px 30px;
                font-size: 1rem;
                border: none;
                border-radius: 30px;
                cursor: pointer;
                background-color: #6c757d;
                color: white;
                font-weight: 500;
                transition: all 0.3s ease;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
    </style>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <img src="imagens/success.png" alt="Sucesso" class="check-icon">
        <%String msg = (String) request.getAttribute("msg");%>
        <h1><%out.println(msg);%></h1>
        <input type="button" value="Retornar" id="btr" onclick="window.location.href='cadastrar.html'">
    </body>
</html>
