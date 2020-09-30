/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Correo.CCorreos;
import Modelo.Agendamiento;
import Modelo.AgendamientoDAO;
import Modelo.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sergi
 */
@WebServlet(name = "totalsolicitudes", urlPatterns = {"/totalsolicitudes"})
public class totalsolicitudes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    AgendamientoDAO daoagen = new AgendamientoDAO();
    Persona prs = new Persona();
    Agendamiento ang = new Agendamiento();
    CCorreos cco = new CCorreos();
    int ide;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "totalsolicitudes":
                List TotalSolicitud = daoagen.listaAgendamientosadmin(1);
                request.setAttribute("TotalS", TotalSolicitud);
                List TotalSolicitudC = daoagen.listaAgendamientosadmin(2);
                request.setAttribute("TotalSC", TotalSolicitudC);
                List TotalSolicitudCompletadas = daoagen.listaAgendamientosadminCompletada();
                request.setAttribute("TotalSCom", TotalSolicitudCompletadas);

                request.getRequestDispatcher("Totaldesolicitudesdeagendamietno.jsp").forward(request, response);

                break;

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

        String accion = request.getParameter("accion");
        switch (accion) {
            case "aprobarsolicitud":

                String correo = "";
                String array[] = request.getParameterValues("array[]");
                String fechaagendada = request.getParameter("fechaagendada");

                for (int i = 0; i < array.length; i++) {
                    System.out.println(array[i]);
                    correo = daoagen.traerSolicitud(Integer.parseInt(array[i]));

                    if (daoagen.aprobarsolicitud(fechaagendada, Integer.parseInt(array[i])) == true) {
                        prs.setCorreo(null);
                        prs.setCorreo(correo);
                        ang.setFechaAgendamiento(fechaagendada);
                        ang.setIdSolicitud(Integer.parseInt(array[i]));
                        System.out.println(correo);
                        if (cco.enviarCorreo(prs, null, ang, 3) > 0) {
                            response.getWriter().write("true");
                        } else {
                            System.out.println("murio 1");
                        }
                    } else {
                        System.out.println("murio 2");
                    }

                }

                break;
            case "desaprobarsolicitud":
                ide = Integer.parseInt(request.getParameter("id"));
                String razon = request.getParameter("razontext");

                correo = daoagen.traerSolicitud(ide);

                if (daoagen.desaprobarsolicitud(razon, ide) == true) {

                    prs.setCorreo(null);
                    prs.setCorreo(correo);
                    ang.setRazon(razon);
                    ang.setIdSolicitud(ide);

                    if (cco.enviarCorreo(prs, null, ang, 5) > 0) {
                        response.getWriter().write("true");
                    } else {
                        System.out.println("murio");
                    }
                } else {
                    response.getWriter().write("false");
                }

                break;
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
