/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cargamasiva;

import Modelo.Recolecciones;
import Modelo.RecoleccionesDAO;
import Rutas.CRutas;
import java.io.FileInputStream;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author sergi
 */
public class Cargasmasivas {

    public static List excelRecolecciones(String documento) {
        List listainvalidos = new ArrayList();
        RecoleccionesDAO recdao = new RecoleccionesDAO();
        Recolecciones recoleccion = new Recolecciones();

        try {

            int caso = 1;

            FileInputStream inputStream = new FileInputStream(new File(CRutas.rutaExcelCargamasiva() + documento));
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet firstSheet = workbook.getSheetAt(0);
            Iterator iterator = firstSheet.iterator();

            DataFormatter formatter = new DataFormatter();
            int contador = 0;

            while (iterator.hasNext()) {

                Row nextRow = (Row) iterator.next();
                Iterator cellIterator = nextRow.cellIterator();
                while (cellIterator.hasNext()) {
                    Cell cell = (Cell) cellIterator.next();
                    String contenido = formatter.formatCellValue(cell);

                    if (contador > 6) {

                        switch (caso) {
                            case 1:
                                recoleccion.setIdsolicitud(Integer.parseInt(contenido));

                                caso++;
                                break;

                            case 4:
                                recoleccion.setFecharecoleccion(contenido);
                                caso++;
                                break;

                            case 5:
                                recoleccion.setCantidadkg(Double.parseDouble(contenido));
                                caso++;
                                break;

                            case 6:
                                recoleccion.setRecolectador(contenido);
                                caso++;
                                break;

                            case 7:
                                recoleccion.setNombretransportadora(contenido);
                                if (recdao.registrarRecolecciones(recoleccion) == true) {
                                    recdao.actualizarEstado(recoleccion.getIdsolicitud(), 6);
                                }
                                caso = 1;

                                break;

                            default:
                                caso++;

                        }

                    } else {
                        contador++;
                    }

                }

            }

        } catch (Exception e) {
        }

        return listainvalidos;
    }
}
