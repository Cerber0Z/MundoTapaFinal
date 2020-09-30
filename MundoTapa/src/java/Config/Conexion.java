/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author sergi
 */
public class Conexion {

    Connection conn;
    String url = "jdbc:mysql://localhost:3306/dbtapita";
    String user = "root";
    String pass = "";

    public Connection Conexion() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {

            e.getMessage();
        }
        return conn;
    }

    public Connection closeConexion() {
        try {
            conn.close();
        } catch (Exception e) {
            System.out.println("Error al cerra la conn" + e);
        }
        return conn;
    }

    public java.sql.Connection getConexion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
