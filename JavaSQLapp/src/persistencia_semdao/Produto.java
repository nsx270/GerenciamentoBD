/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia_semdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 *
 * @author PTOLEDO
 */
public class Produto {

    private int id;
    private String descricao;
    private double preco;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public void cadastrar() throws ClassNotFoundException, SQLException {
        Connection con = getConexao();
        PreparedStatement comando = con.prepareStatement("insert into produto(descricao, preco) values(?,?)");
        comando.setString(1, descricao);
        comando.setDouble(2, preco);
        comando.execute();
        con.close();
    }
    
    public void deletar(int id) throws ClassNotFoundException, SQLException {
    try (Connection con = getConexao()) {
        try (PreparedStatement comando = con.prepareStatement("DELETE FROM produto WHERE id = ?")) {
            comando.setInt(1, id);
            int rowsAffected = comando.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Nenhum produto encontrado com o ID: " + id);
                return;
            }
        }
        try (PreparedStatement comando = con.prepareStatement("SELECT COUNT(*) FROM produto");
             ResultSet rs = comando.executeQuery()) {
            if (rs.next() && rs.getInt(1) == 0) {
                try (PreparedStatement resetStmt = con.prepareStatement("ALTER TABLE produto AUTO_INCREMENT = 1")) {
                    resetStmt.execute();
                }
            }
        }
    }
}
    
    public void atualizar(int id, String novaDescricao, double novoPreco) throws ClassNotFoundException, SQLException {
        try (Connection con = getConexao();
             PreparedStatement comando = con.prepareStatement("UPDATE produto SET descricao = ?, preco = ? WHERE id = ?")) {
            comando.setString(1, novaDescricao);
            comando.setDouble(2, novoPreco);
            comando.setInt(3, id);
            int rowsAffected = comando.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Nenhum produto encontrado com o ID: " + id);
            }
        }
    }

    public Produto consultarById(int id) throws ClassNotFoundException, SQLException {
    try (Connection con = getConexao();
         PreparedStatement comando = con.prepareStatement("SELECT * FROM produto WHERE id = ?")) {
        
        comando.setInt(1, id);
        try (ResultSet rs = comando.executeQuery()) {
            if (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                return p;
            }
        }
    }
    return null;
}
    
    public List<Produto> consultarTodos() throws SQLException, ClassNotFoundException {
    List<Produto> listaProdutos = new ArrayList<>();
    
    try (Connection con = getConexao();
         PreparedStatement comando = con.prepareStatement("SELECT * FROM produto");
         ResultSet resultado = comando.executeQuery()) {
        
        while (resultado.next()) {
            Produto prod = new Produto();
            prod.setId(resultado.getInt("id"));
            prod.setDescricao(resultado.getString("descricao"));
            prod.setPreco(resultado.getDouble("preco"));
            listaProdutos.add(prod);
        }
    }
    return listaProdutos;
}
    
    
    
    public Connection getConexao() throws ClassNotFoundException, SQLException {
        //Database properties: verificar em seu computador
        String DRIVER = "com.mysql.cj.jdbc.Driver";
        String URL = "jdbc:mysql://127.0.0.1:3306/aula_ioo";
        String USER = "root";
        String PASSWORD = "";
        // O método forName carrega e inicia o driver passado por parâmetro
        Class.forName(DRIVER);
        // Estabele a conexão
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

}