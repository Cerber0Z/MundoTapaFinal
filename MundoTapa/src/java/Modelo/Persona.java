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
public class Persona extends Uusuario {

    int recoleccion;

    public int getRecoleccion() {
        return recoleccion;
    }

    public void setRecoleccion(int recoleccion) {
        this.recoleccion = recoleccion;
    }

    int idPersona;
    String CedPersona;
    String PrimerNombre;
    String SegundoNombre;
    String PrimerApellido;
    String SegundoApellido;
    String TelefonoFijoPers;
    String CelularPersona;
    String correo;
    String clave;
    String correoActilizado;

    public String getCorreoActilizado() {
        return correoActilizado;
    }

    public void setCorreoActilizado(String correoActilizado) {
        this.correoActilizado = correoActilizado;
    }

    public String getFechaAgendamiento() {
        return FechaAgendamiento;
    }

    public void setFechaAgendamiento(String FechaAgendamiento) {
        this.FechaAgendamiento = FechaAgendamiento;
    }
    String FechaAgendamiento;

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Persona() {

    }

    public Persona(int idPersona, String CedPersona, String PrimerNombre, String SegundoNombre, String PrimerApellido, String SegundoApellido, String TelefonoFijoPers, String CelularPersona) {
        this.idPersona = idPersona;
        this.CedPersona = CedPersona;
        this.PrimerNombre = PrimerNombre;
        this.SegundoNombre = SegundoNombre;
        this.PrimerApellido = PrimerApellido;
        this.SegundoApellido = SegundoApellido;
        this.TelefonoFijoPers = TelefonoFijoPers;
        this.CelularPersona = CelularPersona;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getCedPersona() {
        return CedPersona;
    }

    public void setCedPersona(String CedPersona) {
        this.CedPersona = CedPersona;
    }

    public String getPrimerNombre() {
        return PrimerNombre;
    }

    public void setPrimerNombre(String PrimerNombre) {
        this.PrimerNombre = PrimerNombre;
    }

    public String getSegundoNombre() {
        return SegundoNombre;
    }

    public void setSegundoNombre(String SegundoNombre) {
        this.SegundoNombre = SegundoNombre;
    }

    public String getPrimerApellido() {
        return PrimerApellido;
    }

    public void setPrimerApellido(String PrimerApellido) {
        this.PrimerApellido = PrimerApellido;
    }

    public String getSegundoApellido() {
        return SegundoApellido;
    }

    public void setSegundoApellido(String SegundoApellido) {
        this.SegundoApellido = SegundoApellido;
    }

    public String getTelefonoFijoPers() {
        return TelefonoFijoPers;
    }

    public void setTelefonoFijoPers(String TelefonoFijoPers) {
        this.TelefonoFijoPers = TelefonoFijoPers;
    }

    public String getCelularPersona() {
        return CelularPersona;
    }

    public void setCelularPersona(String CelularPersona) {
        this.CelularPersona = CelularPersona;
    }

}
