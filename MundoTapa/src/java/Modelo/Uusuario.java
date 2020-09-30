/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author sergi
 */
public class Uusuario {
    int idUsuario ;
    String NombreUsuario;
    String Email;
    String Contrasena;
    String CambioContrasena;
    String Bloqueado;
    int Persona_idPersona;
    int Rol_idRol;
    String NombreRol;
    int Rol;
    
    public Uusuario() {
    }

    public Uusuario(int idUsuario, String NombreUsuario, String Email, String Contrasena, String CambioContrasena, String Bloqueado, int Persona_idPersona, int Rol_idRol, String NombreRol , int Rol) {
        this.idUsuario = idUsuario;
        this.NombreUsuario = NombreUsuario;
        this.Email = Email;
        this.Contrasena = Contrasena;
        this.CambioContrasena = CambioContrasena;
        this.Bloqueado = Bloqueado;
        this.Persona_idPersona = Persona_idPersona;
        this.Rol_idRol = Rol_idRol;
        this.NombreRol = NombreRol;
        this.Rol = Rol;
        
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public void setContrasena(String Contrasena) {
        this.Contrasena = Contrasena;
    }

    public String getCambioContrasena() {
        return CambioContrasena;
    }

    public void setCambioContrasena(String CambioContrasena) {
        this.CambioContrasena = CambioContrasena;
    }

    public String getBloqueado() {
        return Bloqueado;
    }

    public void setBloqueado(String Bloqueado) {
        this.Bloqueado = Bloqueado;
    }

    public int getPersona_idPersona() {
        return Persona_idPersona;
    }

    public void setPersona_idPersona(int Persona_idPersona) {
        this.Persona_idPersona = Persona_idPersona;
    }

    public int getRol_idRol() {
        return Rol_idRol;
    }

    public void setRol_idRol(int Rol_idRol) {
        this.Rol_idRol = Rol_idRol;
    }
    
    
     public String getNombreRol() {
        return NombreRol;
    }

    public void setNombreRol(String NombreRol) {
        this.NombreRol = NombreRol;
    }
    
     public int getRol() {
        return Rol;
    }

    public void setRol(int Rol) {
        this.Rol = Rol;
    }

    public void getEmail(String EmailUs) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
            
}
