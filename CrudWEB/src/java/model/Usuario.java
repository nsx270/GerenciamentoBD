/**
 *
 * @author pedro
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import util.FabricaConexao;

public class Usuario {

    private int id;
    private String nome;
    private String login;
    private String senha;
    private String nivelacesso;
    
    // Getters e setters
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNivelacesso() {
        return nivelacesso;
    }

    public void setNivelacesso(String nivelacesso) {
        this.nivelacesso = nivelacesso;
    }

    public boolean autenticar() throws ClassNotFoundException, SQLException {
        boolean aux = false;
        Connection con = null; 
        PreparedStatement comando = null; 
        ResultSet resultado = null;

        try {
            //Carregar Driver e criar conexao
            con = FabricaConexao.getConexaoMySQL();

            // Construir string SQL com PreparedStatement (usando ? como placeholders)
            String sql = "SELECT * FROM tb_usuario WHERE login = ? AND senha = ?";
            comando = con.prepareStatement(sql);

            // Definir os valores para os placeholders (?)
            comando.setString(1, this.login); 
            comando.setString(2, this.senha);

            // Executar e tratar resultados
            resultado = comando.executeQuery();

            if (resultado.next()) {
                // Se encontrou, preenche os dados do usuário no objeto atual
                this.setId(resultado.getInt("id"));
                this.setNome(resultado.getString("nome"));
                this.setLogin(resultado.getString("login")); 
                this.setSenha(resultado.getString("senha")); 
                this.setNivelacesso(resultado.getString("nivelacesso"));
                aux = true;
            }
        } finally {
            // Bloco finally para garantir que os recursos sejam fechados
            if (resultado != null) {
                try {
                    resultado.close();
                } catch (SQLException e) {
                    // Logar ou tratar o erro ao fechar ResultSet
                    e.printStackTrace();
                }
            }
            if (comando != null) {
                try {
                    comando.close();
                } catch (SQLException e) {
                    // Logar ou tratar o erro ao fechar PreparedStatement
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    // Logar ou tratar o erro ao fechar Connection
                    e.printStackTrace();
                }
            }
        }
        return aux;
    }
}


