/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Correo.CCorreos;
import Modelo.CCertificaciones;
import Modelo.CCertificacionesDAO;
import Modelo.Persona;
import Modelo.Uusuario;
import Modelo.UusuarioDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author sergi
 */
@WebServlet(name = "Certificacion", urlPatterns = {"/Certificacion"})
public class Certificacion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    CCertificacionesDAO ccdao = new CCertificacionesDAO();
    CCertificaciones certificacion = new CCertificaciones();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":

                List listas = null;
                if ((int) session.getAttribute("Rol") == 1) { // Gerente
                    listas = ccdao.listarCertificaciones(1, 0);

                } else if ((int) session.getAttribute("Rol") == 2) { // Donante
                    listas = ccdao.listarCertificaciones(2, (int) session.getAttribute("IdUs"));
                }

                request.setAttribute("certificaciones", listas);

                request.getRequestDispatcher("Certificados.jsp").forward(request, response);

                break;

            case "Reportes":
                List list = ccdao.listarRecolecciones();
                request.setAttribute("recolecciones", list);

                session.removeAttribute("fechaincio");
                session.removeAttribute("fechafinal");

                request.getRequestDispatcher("reportes.jsp").forward(request, response);
                break;

            case "Consultar":

                String fechainicio = request.getParameter("fechainicio");
                String fechafinal = request.getParameter("fechafinal");

                session.setAttribute("fechaincio", fechainicio);
                session.setAttribute("fechafinal", fechafinal);

                certificacion.setFecharecoleccion(fechainicio);
                certificacion.setFechafinal(fechafinal);

                List listaFiltrada = ccdao.consultarCertificaciones(certificacion);
                request.setAttribute("recolecciones", listaFiltrada);

                request.getRequestDispatcher("reportes.jsp").forward(request, response);

                break;

            case "Excel":
                CReporteExcel excel = new CReporteExcel();

                if (excel.reporteExcel((String) session.getAttribute("fechaincio"), (String) session.getAttribute("fechafinal")) == true) {
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

////                    try {
////
////                        String sDirectorio = CRutas.rutaReportesExcel();
////                        File file = new File(sDirectorio);
////                        if (file.delete()) {
////                            System.out.println("Se elimino el excel de descarga.");
////                        } else {
////                            System.out.println("No se elimino el excel de descarga.");
////                        }
////                    } catch (Exception e) {
////                        System.out.println("Error al eliminar el excel de descarga: " + e);
////                    }
                }

                session.removeAttribute("fechaincio");
                session.removeAttribute("fechafinal");

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
        HttpSession session = request.getSession();
        CCorreos correo = new CCorreos();
        Uusuario usuario = new Uusuario();
        Persona person = new Persona();
        PrintWriter out = response.getWriter();

        String fechainicio, fechafinal;
        UusuarioDAO usuariodao = new UusuarioDAO();
        String accion = request.getParameter("accion");
        switch (accion) {

            case "consultar":
                fechainicio = request.getParameter("fechaInicio");
                fechafinal = request.getParameter("fechaFinal");

                certificacion.setFecharecoleccion(fechainicio);
                certificacion.setFechafinal(fechafinal);
                
                List listaFiltrada = null;
                if ((int) session.getAttribute("Rol") == 1) { // Gerente
                    listaFiltrada = ccdao.consultarCertificacionesFecha(certificacion,1, 0);

                } else if ((int) session.getAttribute("Rol") == 2) { // Donante
                    listaFiltrada = ccdao.consultarCertificacionesFecha(certificacion,2, (int) session.getAttribute("IdUs"));
                }
               
                request.setAttribute("certificaciones", listaFiltrada);

                break;

            case "EnviarCorreo":

                int idRecoleccion = Integer.parseInt(request.getParameter("recoleccion"));
                certificacion = ccdao.datosCertificado(idRecoleccion);

                if (certificacion.getCantidad() != null && certificacion.getFecharecoleccion() != null) {
                    person = usuariodao.correoCertificacion(idRecoleccion);
                    if (person.getCorreo() != null) {
                        if (correo.enviarCorreo(person, certificacion, null, 1) > 0) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }
                    }
                }

                break;

            default:
                throw new AssertionError();
        }

        if (!"EnviarCorreo".equals(accion)) {
            request.getRequestDispatcher("Certificados.jsp").forward(request, response);
        }
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
