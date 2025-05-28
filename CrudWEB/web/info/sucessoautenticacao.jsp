<%-- 
    Document   : sucessoautenticacao
    Created on : 15 de mai. de 2025, 10:21:59
    Author     : pedro
    Página de sucesso de autenticação
--%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
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
            
            .success-container {
                background-color: white;
                padding: 2.5rem;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 600px;
                text-align: center;
            }
            
            #titulo {
                font-size: 2rem;
                color: #28a745;
                font-weight: 600;
                margin-bottom: 1.5rem;
                text-shadow: 1px 1px 3px rgba(0,0,0,0.05);
            }
            
            .texto {
                font-size: 1.2rem;
                color: #343a40;
                line-height: 1.6;
                margin: 1.5rem 0;
                text-align: center;
            }
            
            .user-info {
                background-color: #f8f9fa;
                padding: 1.5rem;
                border-radius: 8px;
                margin: 1.5rem 0;
                text-align: left;
                display: inline-block;
            }
            
            .rotulo {
                color: #495057;
                font-weight: bold;
                font-family: Arial, sans-serif;
                display: inline-block;
                min-width: 120px;
            }
            
            .valor {
                color: #28a745;
                font-family: Arial, sans-serif;
            }
            
            button {
                margin-top: 1rem;
                padding: 12px 30px;
                font-size: 1rem;
                border: none;
                border-radius: 30px;
                cursor: pointer;
                background-color: #28a745;
                color: white;
                font-weight: 500;
                transition: all 0.3s ease;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            
            button:hover {
                background-color: #218838;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            }
            
            .check-icon {
                width: 80px;
                height: auto;
                margin-bottom: 1rem;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autenticação Bem-Sucedida</title>
    </head>
    <body>
        <div class="success-container">
            <img src="imagens/success.png" alt="Sucesso" class="check-icon">
            <h1 id="titulo">Autenticação Bem-Sucedida</h1>
            
            <div class="texto">
                Usuário autenticado com sucesso!
            </div>
            
            <div class="user-info">
                <% Usuario usu = (Usuario) request.getAttribute("usu");%>
                <div><span class="rotulo">Nome:</span> <span class="valor"><%=usu.getNome()%></span></div>
                <div><span class="rotulo">Login:</span> <span class="valor"><%=usu.getLogin()%></span></div>
                <div><span class="rotulo">Senha:</span> <span class="valor"><%=usu.getSenha()%></span></div>
                <div><span class="rotulo">Acesso:</span> <span class="valor">Nível <%=usu.getNivelacesso()%></span></div>
            </div>
            <button onclick="window.location.href='principal.html'">Prosseguir</button>
        </div>
    </body>
</html>