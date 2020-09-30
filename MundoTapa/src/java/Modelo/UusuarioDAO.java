package Modelo;

import Config.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sergi
 */
public class UusuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Uusuario Validar(String Email, String Contrasena) {
        Uusuario us = new Uusuario();
        ContrasenaDAO contraDAO = new ContrasenaDAO();
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_InicioUsuarios(?,?)");
            cstmt.setString(1, Email);
            try {
                cstmt.setString(2, contraDAO.Encriptar(Contrasena));
            } catch (Exception e) {
            }

            rs = cstmt.executeQuery();

            while (rs.next()) {
                us.setIdUsuario(rs.getInt("idUsuarios"));
                us.setNombreUsuario(rs.getString("NombreUsuario"));
                us.setEmail(rs.getString("Email"));
                try {
                    us.setContrasena(contraDAO.Desencriptar(rs.getString("Contrasena")));
                } catch (Exception e) {
                }

                us.setPersona_idPersona(rs.getInt("Persona_idPersona"));
                us.setRol_idRol(rs.getInt("Rol_idRol"));
            }
        } catch (Exception e) {

        }
        return us;
    }

    // Crud Usuario
    public List listar() {

        List<Uusuario> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_SelectUsuarios");
            rs = cstmt.executeQuery();

            while (rs.next()) {
                Uusuario uss = new Uusuario();

                uss.setIdUsuario(rs.getInt(1));
                uss.setNombreUsuario(rs.getString(2));
                uss.setEmail(rs.getString(3));
                uss.setBloqueado(rs.getString(4));
                uss.setNombreRol(rs.getString(5));

                lista.add(uss);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public List listartb() {

        List<Uusuario> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_SelectUsuariostab2");
            rs = cstmt.executeQuery();

            while (rs.next()) {
                Uusuario uss = new Uusuario();

                uss.setIdUsuario(rs.getInt(1));
                uss.setNombreUsuario(rs.getString(2));
                uss.setEmail(rs.getString(3));
                uss.setBloqueado(rs.getString(4));
                uss.setNombreRol(rs.getString(5));

                lista.add(uss);

            }
        } catch (Exception e) {
        }
        return lista;
    }

    /*public int agregar(Uusuario em){
        try {
            con=cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL InsertPersona(?,?,?,?)");
            
        } catch (Exception e) {
        }
    }*/
    public boolean Update(int id, String NameUsuario, String Email, String Bloqueado, int rol) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_updateUsuarios(?,?,?,?,?)");
            cstmt.setInt(1, id);
            cstmt.setString(2, NameUsuario);
            cstmt.setString(3, Email);
            cstmt.setString(4, Bloqueado);
            cstmt.setInt(5, rol);
            cstmt.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;

        } finally {
            // cerrar concexion
        }
    }
    public boolean UpdateRol(int id, String Bloqueado, int rol) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_updateRolUs(?,?,?)");
            cstmt.setInt(1, id);
            cstmt.setString(2, Bloqueado);
            cstmt.setInt(3, rol);
            
            cstmt.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;

        } finally {
            // cerrar concexion
        }
    }

    public void delete(int id) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_DeshabilitarUser(?)");
            cstmt.setInt(1, id);
            rs = cstmt.executeQuery();

        } catch (Exception e) {

        }
    }

    public void recuperar(int id) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_HabilitarUser(?)");
            cstmt.setInt(1, id);
            rs = cstmt.executeQuery();
        } catch (Exception e) {
        }
    }

    public List listrol() {

        List<Uusuario> listrol = new ArrayList<>();

        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL spS_SelectRols");
            rs = cstmt.executeQuery();
            while (rs.next()) {
                Uusuario us = new Uusuario();
                us.setRol_idRol(rs.getInt(1));
                us.setNombreRol(rs.getString(2));
                listrol.add(us);
            }
        } catch (Exception e) {

        }
        return listrol;
    }

    public String validarNombre(String nombre, String Apellido) {

        String Sigla = " ", nombrenew = "";

        try {
            con = cn.Conexion();
            CallableStatement csmts = con.prepareCall("CALL spl_SelectNombre(?)");
            csmts.setString(1, nombrenew);
            rs = csmts.executeQuery();

            if (rs.next()) {
                nombrenew = nombreAleatorio(nombre, Apellido, Sigla, 0);
            }

        } catch (Exception e) {
            System.out.println("Error en la validacion del suaur" + e);
        }
        return nombrenew;
    }

    public boolean AgregarUsuario(String NumberCedula, String PrimerNombre, String PrimerApellido, String CelularPersona, String NombreUsuario, String Email, String Bloqueado, int rol, String contraseña) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL InsertarUsuarioDesdeAdmin(?,?,?,?,?,?,?,?,?)");

            String nombrenew = validarNombre(PrimerNombre, PrimerNombre);

            cstmt.setString(1, NumberCedula);
            cstmt.setString(2, PrimerNombre);
            cstmt.setString(3, PrimerApellido);
            cstmt.setString(4, CelularPersona);
            cstmt.setString(5, NombreUsuario.replaceAll(" ", ""));
            cstmt.setString(6, contraseña);
            cstmt.setString(7, Email);
            cstmt.setString(8, Bloqueado);
            cstmt.setInt(9, rol);

            cstmt.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;
        }
    }

    public String nombreAleatorio(String nombre, String apellido, String sigla, int opcion) {

        String nm = "";

        if (opcion == 0) { // Este solo para cuando un nombre usuario ya existe genera letras o numeros de mas

            Random random = new Random();

            for (int i = 0; i < 2; i++) {
                nm += random.nextInt(50);
            }
        }

        String namealeatorio = (nombre.charAt(0) + apellido + sigla.charAt(0)).toLowerCase();
        return namealeatorio + nm;
    }

    public boolean validarCorreoUs(String Email) {
        Uusuario uss = new Uusuario();
        try {
            con = cn.Conexion();
            CallableStatement csmts = con.prepareCall("CALL ValidarCorreo(?)");
            csmts.setString(1, Email);
            rs = csmts.executeQuery();

            if (rs.next()) {
                uss.setEmail(rs.getString(3));
            }
            return true;

        } catch (Exception e) {
            System.out.println("Error en la validacion del suaur" + e);
            return false;
        }

    }

    public Uusuario DatosUsuario(int id) {

        Uusuario uss = new Uusuario();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL DatosUsuario(?)");
            csmt.setInt(1, id);

            rs = csmt.executeQuery();

            while (rs.next()) {

                uss.setNombreUsuario(rs.getString("NombreUsuario"));
                uss.setEmail(rs.getString("Email"));
                uss.setNombreRol(rs.getString("NombreRol"));

            }

        } catch (Exception e) {

        }

        return uss;
    }

    public boolean UpdaterConfigUs(int id, String NombreUs, String EmailUs) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL UpdateDatosUsuario(?,?,?)");
            cstmt.setInt(1, id);
            cstmt.setString(2, NombreUs);
            cstmt.setString(3, EmailUs);

            cstmt.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;

        } finally {
            // cerrar concexion
        }
    }

    public Uusuario SelectContrasena(int i, String Contrasena) {
        Uusuario us = new Uusuario();
        ContrasenaDAO contraDAO = new ContrasenaDAO();
        try {
            con = cn.Conexion();
            CallableStatement csmts = con.prepareCall("CALL SelectContrasena(?,?)");
            csmts.setInt(1, i);
            try {
                csmts.setString(2, contraDAO.Encriptar(Contrasena));
            } catch (Exception e) {
            }

            rs = csmts.executeQuery();

            while (rs.next()) {
                try {
                    us.setContrasena(contraDAO.Desencriptar(rs.getString("Contrasena")));
                } catch (Exception e) {

                }
            }

        } catch (Exception e) {
        }
        return us;
    }

    public boolean UpdateContrasena(int id, String Contrasena) {
        ContrasenaDAO contraDAO = new ContrasenaDAO();
        try {
            con = cn.Conexion();
            CallableStatement csmts = con.prepareCall("CALL UpdateContrasena(?,?)");
            csmts.setInt(1, id);
            csmts.setString(2, contraDAO.Encriptar(Contrasena));

            csmts.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;
        } finally {
            // cerrar concexion
        }

    }
    
     public boolean UpdateContrasenausuario(int id, String Contrasena) {
        ContrasenaDAO contraDAO = new ContrasenaDAO();
        try {
            con = cn.Conexion();
            CallableStatement csmts = con.prepareCall("CALL UpdateContrasenausuario(?,?)");
            csmts.setInt(1, id);
            csmts.setString(2, contraDAO.Encriptar(Contrasena));

            csmts.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;
        } finally {
            // cerrar concexion
        }

    }

    public Persona consultarCorreo(int idUsuario) {
        Persona per = new Persona();
        try {
            con = cn.Conexion();
            CallableStatement consultar = con.prepareCall("CALL Sp_Us_ConsultarCorreo (?)");
            consultar.setInt(1, idUsuario);
            rs = consultar.executeQuery();
            if (rs.next()) {
                per.setCorreo(rs.getString(2));
                per.setPrimerNombre(rs.getString(5));
                per.setSegundoNombre(rs.getString(6));
                per.setPrimerApellido(rs.getString(7));
                per.setSegundoApellido(rs.getString(8));
                per.setCedPersona(rs.getString(4));
            }

        } catch (SQLException e) {
            System.out.println("Error en la recogida del correo " + e);
        } finally {
            con = cn.closeConexion();
        }
        return per;
    }
    
    public Uusuario traeridPersonaconidusuario(int iUsuario){
        Uusuario us = new Uusuario();
        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL traeridPersonaconidusuario(?)");
            cmst.setInt(1, iUsuario);
            rs = cmst.executeQuery();
            if(rs.next()){
                us.setPersona_idPersona(rs.getInt(1));
            }                   
        } catch (Exception e) {
            System.out.println("Error en la recogida del correo " + e);
        }
        finally {
            con = cn.closeConexion();
        }
        return us;
    }

    public Persona correoCertificacion(int recoleccion) {
        Persona persona = new Persona();
        try {
            con = cn.Conexion();
            CallableStatement consultacorreo = con.prepareCall("CALL Sp_CorreoCertificacion (?)");
            consultacorreo.setInt(1, recoleccion);

            rs = consultacorreo.executeQuery();

            if (rs.next()) {

                persona.setCorreo(rs.getString(8));
                persona.setCedPersona(rs.getString(10));
                persona.setPrimerNombre(rs.getString(11));
                persona.setSegundoNombre(rs.getString(12));
                persona.setPrimerApellido(rs.getString(13));
                persona.setSegundoApellido(rs.getString(14));

            } else {
                persona.setCorreo(null);
            }
        } catch (Exception e) {
            System.out.println("Error al consultar el correo en dao " + e);
        } finally {
            con = cn.Conexion();
        }
        return persona;
    }

    public Uusuario seleccorreo(String correo) {
        Uusuario uss = new Uusuario();
        try {
            con = cn.Conexion();
            CallableStatement cosulatcorreos = con.prepareCall("CALL seleccorreo(?)");
            cosulatcorreos.setString(1, correo);

            rs = cosulatcorreos.executeQuery();
            if (rs.next()) {
                uss.setIdUsuario(rs.getInt(1));
                uss.setEmail(rs.getString(2));
            }

        } catch (Exception e) {
            System.out.println("Error al consultar el correo electronico en dao " + e);
            Logger.getLogger(UusuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return uss;
    }
    
     public Uusuario seleccorreo2(String correo) {
        Uusuario uss = new Uusuario();
        try {
            con = cn.Conexion();
            CallableStatement cosulatcorreos = con.prepareCall("CALL seleccorreo(?)");
            cosulatcorreos.setString(1, correo);

            rs = cosulatcorreos.executeQuery();
            if (rs.next()) {
               
                uss.setEmail(rs.getString(2));
            }

        } catch (Exception e) {
            System.out.println("Error al consultar el correo electronico en dao " + e);
            Logger.getLogger(UusuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return uss;
    }

}
