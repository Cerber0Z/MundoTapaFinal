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
public class Agendamiento extends Persona {

    int idLugarRecoleccion;
    String NomLugarRecoleccion;
    String Direccion;
    String Telefono;
    int Ext;
    String Celuar;
    int Usuarios_idUsuarios;
    int idSolicitud;
    String Descripcion;
    String FechaSolicitud;
    int EstAgenda_idEstAgenda;
    int LgarRecolec_idLgarRecolec;
    String Estado;
    String HoraSolicitud;
    String Imagen;
    int Localidad_idLoc;
    String Localidad;
    String correo;
    String razon;
    String material;
    int Material_idMaterial;
    int idRecoleccion;
    String FechaAgendamiento;
    String Recolectador;
    int CantidadKG;
    String NombreTrasportadora;
    

    public String getNombreTrasportadora() {
        return NombreTrasportadora;
    }

    public void setNombreTrasportadora(String NombreTrasportadora) {
        this.NombreTrasportadora = NombreTrasportadora;
    }
    

    public int getCantidadKG() {
        return CantidadKG;
    }

    public void setCantidadKG(int CantidadKG) {
        this.CantidadKG = CantidadKG;
    }

    public String getRecolectador() {
        return Recolectador;
    }

    public void setRecolectador(String Recolectador) {
        this.Recolectador = Recolectador;
    }
    
    public int getIdRecoleccion() {
        return idRecoleccion;
    }

    public void setIdRecoleccion(int idRecoleccion) {
        this.idRecoleccion = idRecoleccion;
    }

    public String getFechaAgendamiento() {
        return FechaAgendamiento;
    }

    public void setFechaAgendamiento(String FechaAgendamiento) {
        this.FechaAgendamiento = FechaAgendamiento;
    }

    public int getMaterial_idMaterial() {
        return Material_idMaterial;
    }

    public void setMaterial_idMaterial(int Material_idMaterial) {
        this.Material_idMaterial = Material_idMaterial;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getRazon() {
        return razon;
    }

    public void setRazon(String razon) {
        this.razon = razon;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Agendamiento() {

    }

    public Agendamiento(int idLugarRecoleccion, String NomLugarRecoleccion, String Direccion, String Telefono, int Ext, String Celuar, int Usuarios_idUsuarios, int idSolicitud, String Descripcion, String FechaSolicitud, int EstAgenda_idEstAgenda, int LgarRecolec_idLgarRecolec, String Estado, String HoraSolicitud, String Imagen, int Localidad_idLoc, String Localidad) {
        this.idLugarRecoleccion = idLugarRecoleccion;
        this.NomLugarRecoleccion = NomLugarRecoleccion;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Ext = Ext;
        this.Celuar = Celuar;
        this.Usuarios_idUsuarios = Usuarios_idUsuarios;
        this.idSolicitud = idSolicitud;
        this.Descripcion = Descripcion;
        this.FechaSolicitud = FechaSolicitud;
        this.EstAgenda_idEstAgenda = EstAgenda_idEstAgenda;
        this.LgarRecolec_idLgarRecolec = LgarRecolec_idLgarRecolec;
        this.Estado = Estado;
        this.HoraSolicitud = HoraSolicitud;
        this.Imagen = Imagen;
        this.Localidad_idLoc = Localidad_idLoc;
        this.Localidad = Localidad;
    }

    public int getIdLugarRecoleccion() {
        return idLugarRecoleccion;
    }

    public void setIdLugarRecoleccion(int idLugarRecoleccion) {
        this.idLugarRecoleccion = idLugarRecoleccion;
    }

    public String getNomLugarRecoleccion() {
        return NomLugarRecoleccion;
    }

    public void setNomLugarRecoleccion(String NomLugarRecoleccion) {
        this.NomLugarRecoleccion = NomLugarRecoleccion;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public int getExt() {
        return Ext;
    }

    public void setExt(int Ext) {
        this.Ext = Ext;
    }

    public String getCeluar() {
        return Celuar;
    }

    public void setCeluar(String Celuar) {
        this.Celuar = Celuar;
    }

    public int getUsuarios_idUsuarios() {
        return Usuarios_idUsuarios;
    }

    public void setUsuarios_idUsuarios(int Usuarios_idUsuarios) {
        this.Usuarios_idUsuarios = Usuarios_idUsuarios;
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getFechaSolicitud() {
        return FechaSolicitud;
    }

    public void setFechaSolicitud(String FechaSolicitud) {
        this.FechaSolicitud = FechaSolicitud;
    }

    public int getEstAgenda_idEstAgenda() {
        return EstAgenda_idEstAgenda;
    }

    public void setEstAgenda_idEstAgenda(int EstAgenda_idEstAgenda) {
        this.EstAgenda_idEstAgenda = EstAgenda_idEstAgenda;
    }

    public int getLgarRecolec_idLgarRecolec() {
        return LgarRecolec_idLgarRecolec;
    }

    public void setLgarRecolec_idLgarRecolec(int LgarRecolec_idLgarRecolec) {
        this.LgarRecolec_idLgarRecolec = LgarRecolec_idLgarRecolec;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getHoraSolicitud() {
        return HoraSolicitud;
    }

    public void setHoraSolicitud(String HoraSolicitud) {
        this.HoraSolicitud = HoraSolicitud;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public int getLocalidad_idLoc() {
        return Localidad_idLoc;
    }

    public void setLocalidad_idLoc(int Localidad_idLoc) {
        this.Localidad_idLoc = Localidad_idLoc;
    }

    public String getLocalidad() {
        return Localidad;
    }

    public void setLocalidad(String Localidad) {
        this.Localidad = Localidad;
    }

}
