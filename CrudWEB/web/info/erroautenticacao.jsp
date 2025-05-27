<%-- 
    Document   : erroautenticacao
    Created on : 24 de mai. de 2025, 12:31:17
    Author     : pedro
    Página de erro de autenticação
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                text-align: center;
                background-color: #f8f9fa;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            }
            
            #title {
                font-size: 2.5rem;
                color: #dc3545;
                font-weight: 600;
                margin-bottom: 1.5rem;
                text-shadow: 1px 1px 3px rgba(0,0,0,0.1);
            }
            
            .msg-container {
                background-color: white;
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                max-width: 600px;
                width: 90%;
                margin: 0 auto 2rem;
            }
            
            .msg {
                font-size: 1.3rem;
                color: #343a40;
                line-height: 1.6;
                margin-bottom: 1.5rem;
            }
            
            button {
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
            
            button:hover {
                background-color: #5a6268;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            }
            
            .imagem {
                width: 120px;
                height: auto;
                margin-top: 2rem;
                filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Falha na Autenticação</title>
    </head>
    <body>
        <div class="msg-container">
            <h1 id="title">Falha na Autenticação</h1>
            <img src="imagens/error.webp" alt="Erro" class="imagem">
            
            <div class="msg">
                <% String m = (String) request.getAttribute("mensagem");%>
                <%=m%>
            </div>
            
            <button onclick="window.location.href='index.jsp'">Tentar Novamente</button>
        </div>
    </body>
</html>