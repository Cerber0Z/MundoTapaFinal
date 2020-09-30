/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Cargamasiva.Cargasmasivas;
import Modelo.AgendamientoDAO;
import Reportes.CReporteExcel;
import Rutas.CRutas;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author sergi
 */
@WebServlet(name = "recolecciones", urlPatterns = {"/recolecciones"})
public class recolecciones extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    AgendamientoDAO agendao = new AgendamientoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String accion = request.getParameter("accion");

        switch (accion) {

            case "recolecciones":
                request.getRequestDispatcher("recolecciones.jsp").forward(request, response);
                break;

            case "Subirexcel":

                // Ruta donde se va subir el documento 
                String rutaenvio = Rutas.CRutas.rutaExcelCargamasiva();
                DiskFileItemFactory factory = new DiskFileItemFactory();

                try {
                    factory.setSizeThreshold(1024);
                    factory.setRepository(new File(rutaenvio));
                    ServletFileUpload uploaddoc = new ServletFileUpload(factory);

                    List<FileItem> partesdoc = uploaddoc.parseRequest(request);

                    for (FileItem items : partesdoc) {
                        File file = new File(rutaenvio, items.getName());
                        items.write(file);
                        break;
                    }

                    response.getWriter().write("true");
                } catch (Exception e) {
                }

                break;

            case "Cargamasiva":

                String nombredoc = request.getParameter("nombredoc").replaceAll("C:\\\\fakepath\\\\", "");
                List solicitudesinvalidas = Cargasmasivas.excelRecolecciones(nombredoc);
                
                if (solicitudesinvalidas.isEmpty()) {
                    response.getWriter().write("true");
                    CRutas.eliminarDocumento(CRutas.rutaExcelCargamasiva(), nombredoc);
                }
                
                break;

            case "Excelrecolecciones":

                CReporteExcel excel = new CReporteExcel();
                String fechaagenda = request.getParameter("fechaexcel");
                
                if (excel.crearExcelAgendamientos(fechaagenda) == true) {
                    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                    response.addHeader("Content-Disposition", "attachment;filename=Recoleciones.xlsx");

                    try (BufferedOutputStream bfout = new BufferedOutputStream(response.getOutputStream());
                            BufferedInputStream infile = new BufferedInputStream(new FileInputStream(CRutas.rutaReportesExcel()))) {
                        byte[] tmp = new byte[8192];
                        int c;
                        while ((c = infile.read(tmp)) > 0) {
                            bfout.write(tmp, 0, c);
                        }
                        bfout.flush();
                    }
                    
                    CRutas.eliminarDocumento(CRutas.rutaReportesExcel(), "");
                }

                break;

            default:
                throw new AssertionError();
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
