/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Software X
 */
public class CCertificaciones extends Persona{
    String usuario,idrecoleccion, fecharecoleccion, idtransportadora, nombretransportadora, recolectador, cantidad, solicitudagendamiento,fechafinal,correo,material;
    int idSolicitud;

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getFechafinal() {
        return fechafinal;
    }

    public void setFechafinal(String fechafinal) {
        this.fechafinal = fechafinal;
    }

    public String getIdrecoleccion() {
        return idrecoleccion;
    }

    public void setIdrecoleccion(String idrecoleccion) {
        this.idrecoleccion = idrecoleccion;
    }

    public String getFecharecoleccion() {
        return fecharecoleccion;
    }

    public void setFecharecoleccion(String fecharecoleccion) {
        this.fecharecoleccion = fecharecoleccion;
    }

    public String getIdtransportadora() {
        return idtransportadora;
    }

    public void setIdtransportadora(String idtransportadora) {
        this.idtransportadora = idtransportadora;
    }

    public String getNombretransportadora() {
        return nombretransportadora;
    }

    public void setNombretransportadora(String nombretransportadora) {
        this.nombretransportadora = nombretransportadora;
    }

    public String getRecolectador() {
        return recolectador;
    }

    public void setRecolectador(String recolectador) {
        this.recolectador = recolectador;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getSolicitudagendamiento() {
        return solicitudagendamiento;
    }

    public void setSolicitudagendamiento(String solicitudagendamiento) {
        this.solicitudagendamiento = solicitudagendamiento;
    }
}
