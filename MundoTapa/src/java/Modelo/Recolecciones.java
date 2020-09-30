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
public class Recolecciones {
     int idrecolecion, idsolicitud;
    double cantidadkg;
    String fecharecoleccion, recolectador, nombretransportadora;

    public int getIdrecolecion() {
        return idrecolecion;
    }

    public void setIdrecolecion(int idrecolecion) {
        this.idrecolecion = idrecolecion;
    }

    public int getIdsolicitud() {
        return idsolicitud;
    }

    public void setIdsolicitud(int idsolicitud) {
        this.idsolicitud = idsolicitud;
    }

    public double getCantidadkg() {
        return cantidadkg;
    }

    public void setCantidadkg(double cantidadkg) {
        this.cantidadkg = cantidadkg;
    }

    public String getFecharecoleccion() {
        return fecharecoleccion;
    }

    public void setFecharecoleccion(String fecharecoleccion) {
        this.fecharecoleccion = fecharecoleccion;
    }

    public String getRecolectador() {
        return recolectador;
    }

    public void setRecolectador(String recolectador) {
        this.recolectador = recolectador;
    }

    public String getNombretransportadora() {
        return nombretransportadora;
    }

    public void setNombretransportadora(String nombretransportadora) {
        this.nombretransportadora = nombretransportadora;
    }
}
