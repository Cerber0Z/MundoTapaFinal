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
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author sergi
 */
public class PersonaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    int r;

    public Persona datospersona(int id) {

        Persona prs = new Persona();
        try {

            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL DatosPersona(?)");
            csmt.setInt(1, id);

            rs = csmt.executeQuery();

            while (rs.next()) {
                prs.setIdPersona(rs.getInt("idPersona"));
                prs.setCedPersona(rs.getString("CedPersona"));
                prs.setPrimerNombre(rs.getString("PrimerNombre"));
                prs.setSegundoNombre(rs.getString("SegundoNombre"));
                prs.setPrimerApellido(rs.getString("PrimerApellido"));
                prs.setSegundoApellido(rs.getString("SegundoApellido"));
                prs.setTelefonoFijoPers(rs.getString("TelefonoFijoPers"));
                prs.setCelularPersona(rs.getString("CelularPersona"));
            }

        } catch (Exception e) {

        }

        return prs;
    }

    public String validarNombreUS(String nombre, String Apellido) {

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

    public boolean InsertarUsuario(String NumberCedula, String PrimerNombre, String PrimerApellido,String Celular ,String NombreUsuario,String Email, String Contrasena) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL InsertarUsuarios(?,?,?,?,?,?,?)");

            String nombrenew = validarNombreUS(PrimerNombre, PrimerNombre);

            cstmt.setString(1, NumberCedula);
            cstmt.setString(2, PrimerNombre);
            cstmt.setString(3, PrimerApellido);
            cstmt.setString(4, Celular);
            cstmt.setString(5, NombreUsuario.replaceAll(" ", ""));
            cstmt.setString(6, Email);
            cstmt.setString(7, Contrasena);

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

    public boolean Updatepers(int id, String PNombre, String SNombre, String PApellido, String SApellido, String TelefonoPers, String Celular) {
        try {
            con = cn.Conexion();
            CallableStatement cstmt = con.prepareCall("CALL UpdateDatosPersona(?,?,?,?,?,?,?)");
            cstmt.setInt(1, id);
            cstmt.setString(2, PNombre);
            cstmt.setString(3, SNombre);
            cstmt.setString(4, PApellido);
            cstmt.setString(5, SApellido);
            cstmt.setString(6, TelefonoPers);
            cstmt.setString(7, Celular);

            cstmt.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;

        } finally {
            // cerrar concexion
        }
    }

    public boolean SelectCedula(String cedula) {
        try {
            con = cn.Conexion();
            CallableStatement csmts = con.prepareCall("CALL SelectCedula(?)");
            csmts.setString(1, cedula);

            csmts.executeQuery();

            return true;

        } catch (Exception e) {
            return false;
        }

    }
    
    public List SelecionarAfiliados(){
        List<Persona> ListaP = new ArrayList<>();
        try {
            con = cn.Conexion();
            CallableStatement cmst = con.prepareCall("CALL SelecionarAfiliados");
            
            rs = cmst.executeQuery();
            
            while (rs.next()) {                
                Persona prs = new Persona();
                
                prs.setCedPersona(rs.getString(1));
                prs.setPrimerNombre(rs.getString(2));
                prs.setPrimerApellido(rs.getString(3));
                prs.setNombreUsuario(rs.getString(4));
                prs.setEmail(rs.getString(5));
                prs.setCelularPersona(rs.getString(6));
                
                ListaP.add(prs);
                
            }
            
        } catch (Exception e) {
        }
        
        return  ListaP;
    }
    
}
