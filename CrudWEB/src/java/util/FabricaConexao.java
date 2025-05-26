/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pedro
 */
public class FabricaConexao {

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
