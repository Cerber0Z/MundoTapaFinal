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

/**
 *
 * @author sergi
 */
public class AnaliticasDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Analiticas conutUsuario() {

        Analiticas an = new Analiticas();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL contarUsuarios");

            rs = csmt.executeQuery();
            
            if(rs.next()){
                an.setConut_usuarios(rs.getInt(1));
            }

        } catch (Exception e) {
        }
        
        return  an;
    }
    
    public Analiticas contarPapelycarton() {

        Analiticas an = new Analiticas();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL contarPapelycarton");

            rs = csmt.executeQuery();
            
            if(rs.next()){
                an.setConut_papelcarton(rs.getInt(1));
            }

        } catch (Exception e) {
        }
        
        return  an;
    }
    
    public Analiticas conutPapelyCarton() {

        Analiticas an = new Analiticas();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL conutPapelyCarton");

            rs = csmt.executeQuery();
            
            if(rs.next()){
                an.setCount_papelcarton2(rs.getInt(1));
            }

        } catch (Exception e) {
        }
        
        return  an;
    }
    
    public Analiticas contarPlastico() {

        Analiticas an = new Analiticas();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL contarPlastico");

            rs = csmt.executeQuery();
            
            if(rs.next()){
                an.setContarPlastico(rs.getInt(1));
            }

        } catch (Exception e) {
        }
        
        return  an;
    }
    
    public Analiticas contarPlastico2() {

        Analiticas an = new Analiticas();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL contarPlastico2");

            rs = csmt.executeQuery();
            
            if(rs.next()){
                an.setContarPlastico2(rs.getInt(1));
            }

        } catch (Exception e) {
        }
        
        return  an;
    }
    
     public Analiticas contarMetal() {

        Analiticas an = new Analiticas();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL contarMetal");

            rs = csmt.executeQuery();
            
            if(rs.next()){
                an.setContarMetal(rs.getInt(1));
            }

        } catch (Exception e) {
        }
        
        return  an;
    }
     
      public Analiticas contarMetal2() {

        Analiticas an = new Analiticas();

        try {
            con = cn.Conexion();
            CallableStatement csmt = con.prepareCall("CALL contarMetal2");

            rs = csmt.executeQuery();
            
            if(rs.next()){
                an.setContarMetal2(rs.getInt(1));
            }

        } catch (Exception e) {
        }
        
        return  an;
    }

}
