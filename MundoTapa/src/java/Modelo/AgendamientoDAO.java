/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Config.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sergi
 */
public class AgendamientoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private boolean sentencia = false;

    public boolean InsertarSolicitudUS(String NomLugarRecoleccion, String Direccion, String Telefono, String Celular, int Localidad, int UsuariosidUsuarios, String Descripcion, String Imagen, int Material) {
        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL insertAgendamietoUs(?,?,?,?,?,?,?,?,?)");

            cmst.setString(1, NomLugarRecoleccion);
            cmst.setString(2, Direccion);
            cmst.setString(3, Telefono);
            cmst.setString(4, Celular);
            cmst.setInt(5, UsuariosidUsuarios);
            cmst.setString(6, Descripcion);
            cmst.setString(7, Imagen);
            cmst.setInt(8, Localidad);
            cmst.setInt(9, Material);

            cmst.executeUpdate();

            return true;

        } catch (Exception e) {
        }

        return false;

    }

    public List TotalSolicitudUs(int UsuarioidUsuario) {
        List<Agendamiento> ListarSolicitudes = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cstm = con.prepareCall("CALL Lista_RecoleccionesSolicitadasUs(?)");
            cstm.setInt(1, UsuarioidUsuario);

            rs = cstm.executeQuery();

            while (rs.next()) {

                Agendamiento ang = new Agendamiento();

                ang.setUsuarios_idUsuarios(rs.getInt(1));
                ang.setPrimerNombre(rs.getString(2));
                ang.setPrimerApellido(rs.getString(3));
                ang.setIdSolicitud(rs.getInt(4));
                ang.setCorreo(rs.getString(5));
                ang.setLocalidad(rs.getString(6));
                ang.setDescripcion(rs.getString(7));
                ang.setImagen(rs.getString(8));
                ang.setTelefono(rs.getString(9));
                ang.setCeluar(rs.getString(10));
                ang.setNomLugarRecoleccion(rs.getString(11));
                ang.setCedPersona(rs.getString(12));
                ang.setEstado(rs.getString(13));
                ang.setEstAgenda_idEstAgenda(rs.getInt(14));
                ang.setDireccion(rs.getString(15));
                ang.setMaterial(rs.getString(16));
                ang.setRazon(rs.getString(17));
                ang.setFechaAgendamiento(rs.getString(18));

                ListarSolicitudes.add(ang);

            }

        } catch (Exception e) {
        }

        return ListarSolicitudes;
    }

    public List SelecionarSolicitudUs(int UsuariosidUsuarios) {

        List<Agendamiento> ListarSolicitud = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cmts = con.prepareCall("CALL SelecionarSolicitudUs(?)");
            cmts.setInt(1, UsuariosidUsuarios);
            rs = cmts.executeQuery();

            while (rs.next()) {

                Agendamiento ang = new Agendamiento();

                ang.setUsuarios_idUsuarios(rs.getInt(1));
                ang.setPrimerNombre(rs.getString(2));
                ang.setPrimerApellido(rs.getString(3));
                ang.setIdSolicitud(rs.getInt(4));
                ang.setCorreo(rs.getString(5));
                ang.setLocalidad(rs.getString(6));
                ang.setDescripcion(rs.getString(7));
                ang.setImagen(rs.getString(8));
                ang.setTelefono(rs.getString(9));
                ang.setCeluar(rs.getString(10));
                ang.setNomLugarRecoleccion(rs.getString(11));
                ang.setCedPersona(rs.getString(12));
                ang.setEstado(rs.getString(13));
                ang.setEstAgenda_idEstAgenda(rs.getInt(14));
                ang.setDireccion(rs.getString(15));
                ang.setMaterial(rs.getString(16));

                ListarSolicitud.add(ang);

            }

        } catch (Exception e) {
            System.out.println("Error " + e);
        }

        return ListarSolicitud;
    }

    public List SelecionarSolicitudUsAgendada(int UsuariosidUsuarios) {

        List<Agendamiento> ListarSolicitud = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cmts = con.prepareCall("CALL SelecionarSolicitudUsAgendada(?)");
            cmts.setInt(1, UsuariosidUsuarios);
            rs = cmts.executeQuery();

            while (rs.next()) {

                Agendamiento ang = new Agendamiento();

                ang.setUsuarios_idUsuarios(rs.getInt(1));
                ang.setPrimerNombre(rs.getString(2));
                ang.setPrimerApellido(rs.getString(3));
                ang.setIdSolicitud(rs.getInt(4));
                ang.setCorreo(rs.getString(5));
                ang.setLocalidad(rs.getString(6));
                ang.setDescripcion(rs.getString(7));
                ang.setImagen(rs.getString(8));
                ang.setTelefono(rs.getString(9));
                ang.setCeluar(rs.getString(10));
                ang.setNomLugarRecoleccion(rs.getString(11));
                ang.setCedPersona(rs.getString(12));
                ang.setEstado(rs.getString(13));
                ang.setEstAgenda_idEstAgenda(rs.getInt(14));
                ang.setDireccion(rs.getString(15));
                ang.setMaterial(rs.getString(16));
                ang.setFechaAgendamiento(rs.getString(17));

                ListarSolicitud.add(ang);

            }

        } catch (Exception e) {
            System.out.println("Error " + e);
        }

        return ListarSolicitud;
    }
    
    public List SelecionarSolicitudUsAgendadayCompletadasCalendar(int UsuariosidUsuarios) {

        List<Agendamiento> ListarSolicitud = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cmts = con.prepareCall("CALL SelecionarSolicitudUsAgendadayCompletadasCalendar(?)");
            cmts.setInt(1, UsuariosidUsuarios);
            rs = cmts.executeQuery();

            while (rs.next()) {

                Agendamiento ang = new Agendamiento();

                ang.setUsuarios_idUsuarios(rs.getInt(1));
                ang.setPrimerNombre(rs.getString(2));
                ang.setPrimerApellido(rs.getString(3));
                ang.setIdSolicitud(rs.getInt(4));
                ang.setCorreo(rs.getString(5));
                ang.setLocalidad(rs.getString(6));
                ang.setDescripcion(rs.getString(7));
                ang.setImagen(rs.getString(8));
                ang.setTelefono(rs.getString(9));
                ang.setCeluar(rs.getString(10));
                ang.setNomLugarRecoleccion(rs.getString(11));
                ang.setCedPersona(rs.getString(12));
                ang.setEstado(rs.getString(13));
                ang.setEstAgenda_idEstAgenda(rs.getInt(14));
                ang.setDireccion(rs.getString(15));
                ang.setMaterial(rs.getString(16));
                ang.setFechaAgendamiento(rs.getString(17));

                ListarSolicitud.add(ang);

            }

        } catch (Exception e) {
            System.out.println("Error " + e);
        }

        return ListarSolicitud;
    }

    public List SelecionarSolicitudUsCancel(int UsuariosidUsuarios) {

        List<Agendamiento> ListarSolicitud = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cmts = con.prepareCall("CALL SelecionarSolicitudUsCancel(?)");
            cmts.setInt(1, UsuariosidUsuarios);
            rs = cmts.executeQuery();

            while (rs.next()) {

                Agendamiento ang = new Agendamiento();

                ang.setUsuarios_idUsuarios(rs.getInt(1));
                ang.setPrimerNombre(rs.getString(2));
                ang.setPrimerApellido(rs.getString(3));
                ang.setIdSolicitud(rs.getInt(4));
                ang.setCorreo(rs.getString(5));
                ang.setLocalidad(rs.getString(6));
                ang.setDescripcion(rs.getString(7));
                ang.setImagen(rs.getString(8));
                ang.setTelefono(rs.getString(9));
                ang.setCeluar(rs.getString(10));
                ang.setNomLugarRecoleccion(rs.getString(11));
                ang.setCedPersona(rs.getString(12));
                ang.setEstado(rs.getString(13));
                ang.setEstAgenda_idEstAgenda(rs.getInt(14));
                ang.setDireccion(rs.getString(15));
                ang.setRazon(rs.getString(16));
                ang.setMaterial(rs.getString(17));

                ListarSolicitud.add(ang);

            }

        } catch (Exception e) {
            System.out.println("Error " + e);
        }

        return ListarSolicitud;
    }

    public boolean EliminarSolicitudUs(int IdSolicitud) {
        sentencia = false;
        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL EliminarSolicitudUs(?)");
            cmst.setInt(1, IdSolicitud);

            cmst.executeUpdate();

            sentencia = true;

        } catch (Exception e) {
        }

        return sentencia;
    }

    public List listarLocalidad() {
        List<Agendamiento> lisrlocalidad = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL SelectLocalidades");

            rs = csmt.executeQuery();
            while (rs.next()) {
                Agendamiento ang = new Agendamiento();
                ang.setLocalidad_idLoc(rs.getInt(1));
                ang.setLocalidad(rs.getString(2));
                lisrlocalidad.add(ang);
            }
        } catch (Exception e) {
        }
        return lisrlocalidad;
    }

    public List listMaterial() {
        List<Agendamiento> listmaterial = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL listmaterial");

            rs = cmst.executeQuery();

            while (rs.next()) {
                Agendamiento agn = new Agendamiento();

                agn.setMaterial_idMaterial(rs.getInt(1));
                agn.setMaterial(rs.getString(2));

                listmaterial.add(agn);
            }
        } catch (Exception e) {
        }
        return listmaterial;
    }

    // ==== METODO PARA LISTAR LAS SOLICITUDES DE AGENDAMIENTO CON UN ESTADO EN ESPECIAL
    public List listaSolicitudes(int estado, String fechaagendad) {
        List listagendamientos = new ArrayList();

        try {
            con = cn.Conexion();
            CallableStatement agendamientos = con.prepareCall("CALL Recolecion_Excel (?,?)");
            agendamientos.setInt(1, estado);
            agendamientos.setString(2, fechaagendad);

            rs = agendamientos.executeQuery();

            while (rs.next()) {
                Persona per = new Persona();
                per.setRecoleccion(rs.getInt(2));
                per.setCedPersona(rs.getString(3));
                per.setPrimerNombre(rs.getString(4));
                per.setPrimerApellido(rs.getString(5));
                per.setFechaAgendamiento(rs.getString(6));

                listagendamientos.add(per);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar los agendamientos en dao: " + e);
        } finally {
            con = cn.closeConexion();
        }
        return listagendamientos;
    }

    public String traerSolicitud(int solicitud) {

        String correo = "";

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL solicitudUsuario (?)");
            csmt.setInt(1, solicitud);
            rs = csmt.executeQuery();

            if (rs.next()) {
                correo = rs.getString(5);
            }
        } catch (Exception e) {
            System.out.println("");
        } finally {
            con = cn.closeConexion();
        }
        return correo;
    }

    public String traeEstadoSolicitud(int solicitud) {

        String estado = null;

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL solicitudUsuario (?)");
            csmt.setInt(1, solicitud);
            rs = csmt.executeQuery();

            if (rs.next()) {
                estado = rs.getString(13);
            }
        } catch (Exception e) {
            System.out.println("");
        } finally {
            con = cn.closeConexion();
        }
        return estado;
    }

    public int traeidUsuariodeSolicitud(int solicitud) {

        int iUsuario = 0;

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL solicitudUsuario (?)");
            csmt.setInt(1, solicitud);
            rs = csmt.executeQuery();

            if (rs.next()) {
                iUsuario = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("");
        } finally {
            con = cn.closeConexion();
        }
        return iUsuario;
    }

    public boolean aprobarsolicitud(String fechaagendada, int idsolicitud) {

        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL aprobarsolicitud(?,?)");
            cmst.setString(1, fechaagendada);
            cmst.setInt(2, idsolicitud);

            cmst.executeUpdate();

            return true;

        } catch (Exception e) {
            System.out.println("Error" + e);
        } finally {
            con = cn.closeConexion();
        }

        return false;
    }

    public List listaAgendamientosadmin(int estado) {
        List listagendamientos = new ArrayList();

        try {
            con = cn.Conexion();
            CallableStatement agendamientos = con.prepareCall("CALL Lista_RecoleccionesSolicitadas(?)");
            agendamientos.setInt(1, estado);

            rs = agendamientos.executeQuery();

            while (rs.next()) {
                Agendamiento ag = new Agendamiento();
                ag.setUsuarios_idUsuarios(rs.getInt(1));
                ag.setPrimerNombre(rs.getString(2));
                ag.setPrimerApellido(rs.getString(3));
                ag.setIdSolicitud(rs.getInt(4));
                ag.setCorreo(rs.getString(5));
                ag.setLocalidad(rs.getString(6));
                ag.setDescripcion(rs.getString(7));
                ag.setImagen(rs.getString(8));
                ag.setTelefono(rs.getString(9));
                ag.setCeluar(rs.getString(10));
                ag.setNomLugarRecoleccion(rs.getString(11));
                ag.setCedPersona(rs.getString(12));
                ag.setEstado(rs.getString(13));
                ag.setEstAgenda_idEstAgenda(rs.getInt(14));
                ag.setDireccion(rs.getString(15));
                ag.setRazon(rs.getString(16));
                ag.setMaterial(rs.getString(17));

                listagendamientos.add(ag);

            }

        } catch (SQLException e) {
            System.out.println("Error al listar los agendamientos en dao: " + e);
        } finally {
            con = cn.closeConexion();
        }
        return listagendamientos;
    }

    public List listaAgendamientosadminCompletada() {
        List listagendamientos = new ArrayList();

        try {
            con = cn.Conexion();
            CallableStatement agendamientos = con.prepareCall("CALL Lista_RecoleccionesCompletadas");

            rs = agendamientos.executeQuery();

            while (rs.next()) {
                Agendamiento ag = new Agendamiento();
                ag.setUsuarios_idUsuarios(rs.getInt(1));
                ag.setPrimerNombre(rs.getString(2));
                ag.setPrimerApellido(rs.getString(3));
                ag.setIdSolicitud(rs.getInt(4));
                ag.setCorreo(rs.getString(5));
                ag.setLocalidad(rs.getString(6));
                ag.setDescripcion(rs.getString(7));
                ag.setImagen(rs.getString(8));
                ag.setTelefono(rs.getString(9));
                ag.setCeluar(rs.getString(10));
                ag.setNomLugarRecoleccion(rs.getString(11));
                ag.setCedPersona(rs.getString(12));
                ag.setEstado(rs.getString(13));
                ag.setEstAgenda_idEstAgenda(rs.getInt(14));
                ag.setDireccion(rs.getString(15));
                ag.setRazon(rs.getString(16));
                ag.setMaterial(rs.getString(17));
                ag.setIdRecoleccion(rs.getInt(18));
                ag.setFechaAgendamiento(rs.getString(19));
                ag.setRecolectador(rs.getString(20));
                ag.setCantidadKG(rs.getInt(21));
                ag.setNombreTrasportadora(rs.getString(22));

                listagendamientos.add(ag);

            }

        } catch (SQLException e) {
            System.out.println("Error al listar los agendamientos en dao: " + e);
        } finally {
            con = cn.closeConexion();
        }
        return listagendamientos;
    }

    public boolean desaprobarsolicitud(String razon, int idsolicitud) {
        try {
            con = cn.Conexion();
            CallableStatement desaprobadoS = con.prepareCall("CALL desaprobarsolicitud(?,?)");

            desaprobadoS.setString(1, razon);
            desaprobadoS.setInt(2, idsolicitud);

            desaprobadoS.executeUpdate();

            return true;

        } catch (Exception e) {
        }
        return false;
    }

    public List selectsolicitudesagendadasADMIN() {
        List listaagendada = new ArrayList();
        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL selectsolicitudesagendadasADMIN()");

            rs = cmst.executeQuery();

            while (rs.next()) {
                Agendamiento ang = new Agendamiento();
                ang.setUsuarios_idUsuarios(rs.getInt(1));
                ang.setPrimerNombre(rs.getString(2));
                ang.setPrimerApellido(rs.getString(3));
                ang.setIdSolicitud(rs.getInt(4));
                ang.setCorreo(rs.getString(5));
                ang.setLocalidad(rs.getString(6));
                ang.setDescripcion(rs.getString(7));
                ang.setImagen(rs.getString(8));
                ang.setTelefono(rs.getString(9));
                ang.setCeluar(rs.getString(10));
                ang.setNomLugarRecoleccion(rs.getString(11));
                ang.setCedPersona(rs.getString(12));
                ang.setEstado(rs.getString(13));
                ang.setEstAgenda_idEstAgenda(rs.getInt(14));
                ang.setDireccion(rs.getString(15));
                ang.setMaterial(rs.getString(16));
                ang.setFechaAgendamiento(rs.getString(17));

                listaagendada.add(ang);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los agendamientos en dao: " + e);
        } finally {
            con = cn.closeConexion();
        }

        return listaagendada;
    }

    public List solicitudesCompeltadasyagendadcalendar() {
        List listaagendadas = new ArrayList();
        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL solicitudesCompeltadasyagendadcalendar()");

            rs = cmst.executeQuery();

            while (rs.next()) {
                Agendamiento ang = new Agendamiento();
                ang.setUsuarios_idUsuarios(rs.getInt(1));
                ang.setPrimerNombre(rs.getString(2));
                ang.setPrimerApellido(rs.getString(3));
                ang.setIdSolicitud(rs.getInt(4));
                ang.setCorreo(rs.getString(5));
                ang.setLocalidad(rs.getString(6));
                ang.setDescripcion(rs.getString(7));
                ang.setImagen(rs.getString(8));
                ang.setTelefono(rs.getString(9));
                ang.setCeluar(rs.getString(10));
                ang.setNomLugarRecoleccion(rs.getString(11));
                ang.setCedPersona(rs.getString(12));
                ang.setEstado(rs.getString(13));
                ang.setEstAgenda_idEstAgenda(rs.getInt(14));
                ang.setDireccion(rs.getString(15));
                ang.setMaterial(rs.getString(16));
                ang.setFechaAgendamiento(rs.getString(17));

                listaagendadas.add(ang);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los agendamientos en dao: " + e);
        } finally {
            con = cn.closeConexion();
        }

        return listaagendadas;
    }

//    public boolean SelecionarDatosSolicitud(int IdSolicitud) {
//        try {
//            con = cn.Conexion();
//            CallableStatement cmst = con.prepareCall("CALL SelecionarDatosSolicitud(?)");
//            cmst.setInt(1, IdSolicitud);
//
//            rs = cmst.executeQuery();
//
//            return true;
//        } catch (Exception e) {
//        }
//        return false;
//    }
}
