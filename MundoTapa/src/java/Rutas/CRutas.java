/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Rutas;

import java.io.File;

/**
 *
 * @author sergi
 */
public class CRutas {
    public static String rutaFotosolicitudes(){
        return "C:\\Users\\sergi\\Documents\\GitHub\\ProyectoSENA\\MundoTapa\\web\\Fotosdonativos";
    }
    
    public static String rutaReportesExcel(){
       return "C:\\Users\\sergi\\Documents\\GitHub\\ProyectoSENA\\MundoTapa\\web\\Reportes\\Recoleciones.xlsx";
    }
    
    public static String rutaExcelCargamasiva() {
        return "C:\\Users\\sergi\\Documents\\GitHub\\ProyectoSENA\\MundoTapa\\web\\Documentos\\";
    }

    public static boolean eliminarDocumento(String ruta , String documento) {
        boolean eliminado = false;

        try {

            String sDirectorio = ruta + documento;
            File file = new File(sDirectorio);
            if (file.delete()) {
                System.out.println("Se elimino el excel de descarga.");
            } else {
                System.out.println("No se elimino el documento de: " + sDirectorio);
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar el documento de la ruta: " + ruta );
        }
        return eliminado;
    }
    
}
