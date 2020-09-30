/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Config.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sergi
 */
public class RecoleccionesDAO {

    Conexion cn = new Conexion();
    Connection con;
    ResultSet rs;

    public boolean registrarRecolecciones(Recolecciones rec) {
        boolean registrado = false;
        try {

            con = cn.Conexion();
            CallableStatement add = con.prepareCall("CALL registrarRecoleccion (?,?,?,?,?)");
            add.setString(1, rec.getFecharecoleccion());
            add.setString(2, rec.getRecolectador());
            add.setDouble(3, rec.getCantidadkg());
            add.setInt(4, rec.getIdsolicitud());
            add.setString(5, rec.getNombretransportadora());

            add.executeUpdate();
            registrado = true;

        } catch (SQLException e) {
            System.out.println("No se logro registrar la reccoleccion " + e);
        } finally {
            con = cn.closeConexion();
        }
        return registrado;
    }

    public boolean actualizarEstado(int solicitud, int estado) {
        boolean actualizado = false;
        try {
            con = cn.Conexion();

            CallableStatement update = con.prepareCall("CALL upadte_estado(?,?)");
            update.setInt(1, solicitud);
            update.setInt(2, estado);

            update.executeUpdate();
            actualizado = true;

        } catch (Exception e) {
            System.out.println("Error al actualizar el estado de la solicitud");
            
        } finally{
            con = cn.closeConexion();
        }
        return actualizado;
    }
}
