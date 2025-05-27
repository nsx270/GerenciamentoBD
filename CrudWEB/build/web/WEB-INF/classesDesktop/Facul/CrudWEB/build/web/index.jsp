<%-- 
    Document   : index
    Created on : 24 de mai. de 2025, 12:31:17
    Author     : pedro
    Página principal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                background: 
                    linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),
                    url('/CrudWEB/imagens/fundo.jpg') center/cover fixed;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            
            .login-container {
                background-color: white;
                padding: 2.5rem;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 450px;
                text-align: left;
                
            }
            
            #titulo {
                font-size: 2rem;
                color: #2c3e50;
                font-weight: 600;
                margin-bottom: 1.5rem;
                text-shadow: 1px 1px 3px rgba(0,0,0,0.05);
            }
            
            .input-group {
                margin-bottom: 1.5rem;
                text-align: left;
            }
            
            .input-group label {
                display: block;
                margin-bottom: 0.5rem;
                color: #495057;
                font-size: 0.95rem;
                font-weight: 500;
            }
            
            #log1, #log2 {
                width: 100%;
                padding: 12px 15px;
                font-size: 1rem;
                border: 1px solid #ced4da;
                border-radius: 6px;
                transition: border-color 0.3s ease;
                box-sizing: border-box;
            }
            
            #log1:focus, #log2:focus {
                border-color: #4285f4;
                outline: none;
                box-shadow: 0 0 0 3px rgba(66, 133, 244, 0.1);
            }
            
            #log1::placeholder, #log2::placeholder {
                color: #adb5bd;
            }
            
            #btl {
                width: 100%;
                padding: 14px;
                background-color: #4285f4;
                color: white;
                border: none;
                border-radius: 6px;
                font-size: 1rem;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 0.5rem;
            }
            
            #btl:hover {
                background-color: #3367d6;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="login-container"
        <h1 id="titulo">Página de Login de funcionários</h1>
        <form action="Controller_Autenticacao" method="post">
            <BR>
            <div>
                Login: <br> <input type="text" name="txtlogin" id="log1" placeholder="Insira seu login" autocomplete="off" required><BR>
            <br>
            Senha: <br> <input type="password" name="txtsenha" id="log2" placeholder="Insira sua senha" autocomplete="off" required><BR>
            </div>
            <BR>
            <input type="submit" name="operacao" value="Login" id="btl">
        </form>
        </div>
    </body>
</html>