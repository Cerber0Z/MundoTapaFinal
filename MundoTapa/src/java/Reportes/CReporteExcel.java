/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

/**
 *
 * @author Software X
 */
import Modelo.Agendamiento;
import Modelo.AgendamientoDAO;
import Modelo.CCertificaciones;
import Modelo.CCertificacionesDAO;
import Modelo.Persona;
import Rutas.CRutas;
import java.io.FileOutputStream;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;

public class CReporteExcel {

    private boolean creado = false;

    public boolean reporteExcel(String fechainicio, String fechafinal) {
        try {

            CCertificacionesDAO daocerti = new CCertificacionesDAO();

            Workbook book = new XSSFWorkbook();
            Sheet sheet = book.createSheet("Recoleciones");

            Row row = sheet.createRow(0);

            row.createCell(0).setCellValue("#Solicitud");
            row.createCell(1).setCellValue("Nombre del donante");
            row.createCell(2).setCellValue("Apellido del donante");
            row.createCell(3).setCellValue("Cedula del donante");
            row.createCell(4).setCellValue("Nombre de la trasportadora");
            row.createCell(5).setCellValue("Recolector");
            row.createCell(6).setCellValue("Cantidad kg");
            row.createCell(7).setCellValue("Material");
            row.createCell(8).setCellValue("Fecha de recoleccion");
            List lista = null;
            if (fechainicio == null && fechafinal == null) {
                lista = daocerti.reporteExcelSinFecha();
            } else {
               lista = daocerti.reporteExcel(fechainicio, fechafinal);
            }

            CCertificaciones certificacion;
            Iterator iterator = lista.iterator();
            int fila = 1;

            while (iterator.hasNext()) {
                certificacion = (CCertificaciones) iterator.next();
                Row rowinformacion = sheet.createRow(fila);

                rowinformacion.createCell(0).setCellValue(certificacion.getIdSolicitud());
                rowinformacion.createCell(1).setCellValue(certificacion.getPrimerNombre());
                rowinformacion.createCell(2).setCellValue(certificacion.getPrimerApellido());
                rowinformacion.createCell(3).setCellValue(certificacion.getCedPersona());
                rowinformacion.createCell(4).setCellValue(certificacion.getNombretransportadora());
                rowinformacion.createCell(5).setCellValue(certificacion.getRecolectador());
                rowinformacion.createCell(6).setCellValue(certificacion.getCantidad());
                rowinformacion.createCell(7).setCellValue(certificacion.getMaterial());
                rowinformacion.createCell(8).setCellValue(certificacion.getFechaAgendamiento());

                fila++;
            }

            try (FileOutputStream file = new FileOutputStream(CRutas.rutaReportesExcel())) {
                book.write(file);
            }
            creado = true;

        } catch (IOException e) {
            System.out.println("Error al crear el exel" + e);
        }
        return creado;
    }

    public boolean crearExcelAgendamientos(String fechaagendad) {
        try {

            AgendamientoDAO daoagendamiento = new AgendamientoDAO();

            Workbook book = new XSSFWorkbook();
            Sheet sheet = book.createSheet("Recolecciones");
            DataFormat fmt = book.createDataFormat();
            CellStyle textStyle = book.createCellStyle();
            textStyle.setDataFormat(fmt.getFormat("@"));
            sheet.setDefaultColumnStyle(4, textStyle);

            Row row = sheet.createRow(0);

            row.createCell(0).setCellValue("SOLICITUD");
            row.createCell(1).setCellValue("Nombres donante");
            row.createCell(2).setCellValue("Apellidos donante");
            row.createCell(3).setCellValue("Fecha de recoleccion");
            row.createCell(4).setCellValue("Peso cantidad en Kg");

            row.createCell(5).setCellValue("Recolectador");
            row.createCell(6).setCellValue("Transportadora");

            List lista = daoagendamiento.listaSolicitudes(3,fechaagendad);
            Persona person;
            Iterator iterator = lista.iterator();
            int fila = 1;

            while (iterator.hasNext()) {
                person = (Persona) iterator.next();

                Row rowinformacion = sheet.createRow(fila);

                rowinformacion.createCell(0).setCellValue(person.getRecoleccion());
                rowinformacion.createCell(1).setCellValue(person.getPrimerNombre());
                rowinformacion.createCell(2).setCellValue(person.getPrimerApellido());
                rowinformacion.createCell(3).setCellValue(person.getFechaAgendamiento());

                fila++;
            }

            try (FileOutputStream file = new FileOutputStream(CRutas.rutaReportesExcel())) {
                book.write(file);
            }
            creado = true;

        } catch (IOException e) {
            System.out.println("Error al crear el exel" + e);
        }
        return creado;
    }

}
