/**
 *
 * @author pedro
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "Controller_Autenticacao", urlPatterns = {"/Controller_Autenticacao"})
public class Controller_Autenticacao extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String mensagem = "";
            String pagina = "";
            Usuario usu = new Usuario();

            String operacao = request.getParameter("operacao");
            if (operacao.equals("Login")) {
                String login = request.getParameter("txtlogin");
                String senha = request.getParameter("txtsenha");

                usu.setLogin(login);
                usu.setSenha(senha);

                try {
                    if (usu.autenticar()) {
                        mensagem = "Logado com sucesso!!";
                        pagina = "info/sucessoautenticacao.jsp";
                    } else {
                        mensagem = "Login ou senha não combinam";
                        pagina = "info/erroautenticacao.jsp";
                    }

                } catch (SQLException ex) {
                    mensagem = "Erro SQL: " + ex.getMessage();
                    pagina = "info/erro.jsp";
                } catch (ClassNotFoundException ex) {
                    mensagem = "Erro CNF: " + ex.getMessage();
                    pagina = "info/erro.jsp";
                }
            }

            request.setAttribute("usu", usu);

            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("/" + pagina).forward(request, response);
            request.setAttribute("mensagem", mensagem);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
