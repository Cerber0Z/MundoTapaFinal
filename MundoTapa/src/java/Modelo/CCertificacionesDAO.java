/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections4.ListUtils;

/**
 *
 * @author Software X
 */
public class CCertificacionesDAO {

    Connection conn = null;
    Conexion cn = new Conexion();
    ResultSet rs = null;

    public List consultarCertificaciones(CCertificaciones certificacion) {

        List<CCertificaciones> lista = new ArrayList<>();

        try {
            conn = cn.Conexion();

            CallableStatement certi = conn.prepareCall("CALL Sp_Rc_Certificados (?,?)");
            certi.setString(1, certificacion.getFecharecoleccion());
            certi.setString(2, certificacion.getFechafinal());
            rs = certi.executeQuery();

            while (rs.next()) {

                CCertificaciones cer = new CCertificaciones();

                cer.setIdSolicitud(rs.getInt(1));
                cer.setPrimerNombre(rs.getString(2));
                cer.setPrimerApellido(rs.getString(3));
                cer.setCedPersona(rs.getString(4));
                cer.setNombretransportadora(rs.getString(5));
                cer.setRecolectador(rs.getString(6));
                cer.setCantidad(rs.getString(7));
                cer.setMaterial(rs.getString(8));
                cer.setFechaAgendamiento(rs.getString(9));

                lista.add(cer);
            }

        } catch (SQLException e) {
            System.out.println("Error en DAO  al listar las certificaciones " + e);
        } finally {
            conn = cn.closeConexion();
        }
        return lista;
    }
    
    public List consultarCertificacionesFecha(CCertificaciones certificacion,int opcion, int Usuario) {

        List<CCertificaciones> lista = new ArrayList<>();

        try {
            conn = cn.Conexion();

            CallableStatement certi = conn.prepareCall("CALL Sp_Rc_CertificadosConfecha (?,?,?,?)");
            certi.setString(1, certificacion.getFecharecoleccion());
            certi.setString(2, certificacion.getFechafinal());
            certi.setInt(3, opcion);
            certi.setInt(4, Usuario);
            rs = certi.executeQuery();

            while (rs.next()) {

                CCertificaciones cer = new CCertificaciones();

                cer.setIdSolicitud(rs.getInt(1));
                cer.setIdrecoleccion(rs.getString(2));
                cer.setPrimerNombre(rs.getString(3));
                cer.setPrimerApellido(rs.getString(4));
                cer.setCedPersona(rs.getString(5));
                cer.setFecharecoleccion(rs.getString(6));
                cer.setCantidad(rs.getString(7));
                cer.setMaterial(rs.getString(8));
                cer.setCorreo(rs.getString(9));

                lista.add(cer);
            }

        } catch (SQLException e) {
            System.out.println("Error en DAO  al listar las certificaciones " + e);
        } finally {
            conn = cn.closeConexion();
        }
        return lista;
    }
    
    
    

    public List listarCertificaciones(int opcion, int usuario) {
        List<Object> listcertificados = new ArrayList<Object>();

        try {

            conn = cn.Conexion();
            CallableStatement certificaciones = conn.prepareCall("CALL Sp_Rc_ListarCertificados (?,?)");
            certificaciones.setInt(1, opcion);
            certificaciones.setInt(2, usuario);
            rs = certificaciones.executeQuery();
            while (rs.next()) {
                CCertificaciones certi = new CCertificaciones();

                Persona prs = new Persona();
                
                certi.setIdSolicitud(rs.getInt(1));
                certi.setIdrecoleccion(rs.getString(2));
                certi.setPrimerNombre(rs.getString(3));
                certi.setPrimerApellido(rs.getString(4));
                certi.setCedPersona(rs.getString(5));
                certi.setFecharecoleccion(rs.getString(6));
                certi.setCantidad(rs.getString(7));
                certi.setMaterial(rs.getString(8));
                certi.setCorreo(rs.getString(9));
                
                
                listcertificados.add(certi);

            }

        } catch (SQLException e) {
            System.out.println("Error al listar todas las certificaciones" + e);
        } finally {
            conn = cn.closeConexion();
        }

        return listcertificados;
    }

    public CCertificaciones datosCertificado(int IdRecoleccion) {

        CCertificaciones certificado = new CCertificaciones();

        try {
            conn = cn.Conexion();
            CallableStatement certi = conn.prepareCall("CALL Sp_Rc_VerObservacion (?)");
            certi.setInt(1, IdRecoleccion);
            rs = certi.executeQuery();

            if (rs.next()) {
                certificado.setFecharecoleccion(rs.getString(6));
                certificado.setCantidad(rs.getString(7));
            }

        } catch (SQLException e) {
            System.out.println("ERROR PA TRAER OBSERVACIONES " + e);
        } finally {
            conn = cn.closeConexion();
        }
        return certificado;
    }

    public List reporteExcel(String fechainicio, String fechafinal) {
        List<CCertificaciones> listreporte = new ArrayList<>();
        try {
            conn = cn.Conexion();
            CallableStatement reporte = conn.prepareCall("CALL Sp_Rc_ReporteRecoleciones (?,?)");
            reporte.setString(1, fechainicio);
            reporte.setString(2, fechafinal);

            rs = reporte.executeQuery();

            while (rs.next()) {

                CCertificaciones cer = new CCertificaciones();

                cer.setIdSolicitud(rs.getInt(1));
                cer.setPrimerNombre(rs.getString(2));
                cer.setPrimerApellido(rs.getString(3));
                cer.setCedPersona(rs.getString(4));
                cer.setNombretransportadora(rs.getString(5));
                cer.setRecolectador(rs.getString(6));
                cer.setCantidad(rs.getString(7));
                cer.setMaterial(rs.getString(8));
                cer.setFechaAgendamiento(rs.getString(9));

                listreporte.add(cer);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar " + e);
        } finally {
            conn = cn.closeConexion();
        }
        return listreporte;
    }

    public List reporteExcelSinFecha() {
        List<CCertificaciones> listreporte = new ArrayList<>();
        try {
            conn = cn.Conexion();
            CallableStatement reporte = conn.prepareCall("CALL Sp_Rc_ReporteRecolecionesSinfecha()");

            rs = reporte.executeQuery();

            while (rs.next()) {

                CCertificaciones cer = new CCertificaciones();

                cer.setIdSolicitud(rs.getInt(1));
                cer.setPrimerNombre(rs.getString(2));
                cer.setPrimerApellido(rs.getString(3));
                cer.setCedPersona(rs.getString(4));
                cer.setNombretransportadora(rs.getString(5));
                cer.setRecolectador(rs.getString(6));
                cer.setCantidad(rs.getString(7));
                cer.setMaterial(rs.getString(8));
                cer.setFechaAgendamiento(rs.getString(9));

                listreporte.add(cer);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar " + e);
        } finally {
            conn = cn.closeConexion();
        }
        return listreporte;
    }

    public List listarRecolecciones() {
        List<CCertificaciones> listarRecolecciones = new ArrayList<>();
        try {
            conn = cn.Conexion();
            CallableStatement recolecciones = conn.prepareCall("CALL Sp_Rc_ListarRecolecciones");
            rs = recolecciones.executeQuery();

            while (rs.next()) {
                CCertificaciones certi = new CCertificaciones();

                certi.setIdSolicitud(rs.getInt(1));
                certi.setPrimerNombre(rs.getString(2));
                certi.setPrimerApellido(rs.getString(3));
                certi.setCedPersona(rs.getString(4));
                certi.setNombretransportadora(rs.getString(5));
                certi.setRecolectador(rs.getString(6));
                certi.setCantidad(rs.getString(7));
                certi.setMaterial(rs.getString(8));
                certi.setFechaAgendamiento(rs.getString(9));

                listarRecolecciones.add(certi);
            }
        } catch (SQLException e) {
            System.out.println("error al listar" + e);
            //  Logger.getLogger(Certificacion.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            conn = cn.closeConexion();
        }
        return listarRecolecciones;
    }

}
