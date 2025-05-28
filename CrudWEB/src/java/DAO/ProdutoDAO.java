/**
 *
 * @author pedro
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Produto;
import util.Conexao;

public class ProdutoDAO {
    public void cadastrar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        String SQL = "insert into produto (nome, preco, descricao, quantidade) values (?,?,?,?)";
        PreparedStatement comando = con.prepareStatement(SQL);
        comando.setString(1, prod.getNome());
        comando.setDouble(2, prod.getPreco());
        comando.setString(3, prod.getDescricao());
        comando.setInt(4, prod.getQuantidade());
        comando.execute();
        con.close();
    }
    public void deletar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        String SQL = "delete from produto where id = ?";
        PreparedStatement comando = con.prepareStatement(SQL);
        comando.setInt(1, prod.getId());
        comando.execute();
        con.close();
    }
    public void atualizar(Produto prod) throws ClassNotFoundException, SQLException {
    Connection con = Conexao.getConexao();
    String SQL = "update produto set nome = ?, preco = ?, descricao = ?, quantidade = ? where id = ?";
    PreparedStatement comando = con.prepareStatement(SQL);
    comando.setString(1, prod.getNome());
    comando.setDouble(2, prod.getPreco());
    comando.setString(3, prod.getDescricao());
    comando.setInt(4, prod.getQuantidade());
    comando.setInt(5, prod.getId());
    comando.execute();
    con.close();
}    
    public Produto consultarById(Produto prod) throws ClassNotFoundException, SQLException {
    Connection con = Conexao.getConexao();
    String SQL = "select * from produto where id = ?";
    PreparedStatement comando = con.prepareStatement(SQL);
    comando.setInt(1, prod.getId());
    ResultSet rs = comando.executeQuery();
    Produto p = new Produto(); 
    if (rs.next()) {
        p.setId(rs.getInt("id"));
        p.setNome(rs.getString("nome")); 
        p.setPreco(rs.getDouble("preco"));
        p.setDescricao(rs.getString("descricao"));
        p.setQuantidade(rs.getInt("quantidade"));
    }
    con.close();
    return p;
}
    public List<Produto> consultarTodos() throws ClassNotFoundException, SQLException {
    Connection con = Conexao.getConexao();
    String SQL = "select * from produto";
    PreparedStatement comando = con.prepareStatement(SQL);        
    ResultSet rs = comando.executeQuery();        
    List<Produto> lprod = new ArrayList<Produto>();
    while(rs.next()){
        Produto prod_item = new Produto();
        prod_item.setId(rs.getInt("id"));
        prod_item.setNome(rs.getString("nome"));
        prod_item.setPreco(rs.getDouble("preco")); 
        prod_item.setDescricao(rs.getString("descricao"));
        prod_item.setQuantidade(rs.getInt("quantidade"));
        lprod.add(prod_item);
    }
    con.close();
    return lprod;
    }
}