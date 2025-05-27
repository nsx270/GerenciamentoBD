/**
 *
 * @author pedro
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FabricaConexao {
    // Conexão com o banco de dados no MySQL
    public static Connection getConexaoMySQL() throws ClassNotFoundException, SQLException {
        String DRIVER = "com.mysql.cj.jdbc.Driver";
        String URL = "jdbc:mysql://localhost:3306/teste_sqlinjection";
        String USER = "root";
        String PASSWORD = "";
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
        return con;
    }

}
