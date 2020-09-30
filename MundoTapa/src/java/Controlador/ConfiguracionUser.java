/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Correo.CCorreos;
import Modelo.ContrasenaDAO;
import Modelo.Persona;
import Modelo.PersonaDAO;
import Modelo.Uusuario;
import Modelo.UusuarioDAO;

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
@WebServlet(name = "ConfiguracionUser", urlPatterns = {"/ConfiguracionUser"})
public class ConfiguracionUser extends HttpServlet {

    UusuarioDAO ussDAO = new UusuarioDAO();
    Uusuario uss = new Uusuario();
    PersonaDAO persDAO = new PersonaDAO();
    Persona prs = new Persona();
    ContrasenaDAO conDAO = new ContrasenaDAO();
    CCorreos cco = new CCorreos();
    int ide;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object id = session.getAttribute("ID");
        int i = (Integer) id;
        Object us = session.getAttribute("uname");
        if (us == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            String accion = request.getParameter("accion");

            String menu = request.getParameter("menu");

            if (menu.equals("ConfiguracionU")) {
                switch (accion) {
                    case "Listar":
                        Persona p = persDAO.datospersona(i);
                        request.setAttribute("Persona", p);
                        Object u = ussDAO.DatosUsuario(i);
                        request.setAttribute("Usuario", u);
                        request.getRequestDispatcher("ConfiguracionUser.jsp").forward(request, response);
                        break;
                }
            }

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
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        Object us = session.getAttribute("uname");
        Object id = session.getAttribute("ID");
        int i = (Integer) id;
        if (us == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {

            String accion = request.getParameter("accion");

            String menu = request.getParameter("menu");

            if (menu.equals("ConfiguracionUser")) {
                switch (accion) {

                    case "Acualizarpers":

                        String PNombre = request.getParameter("textPrimerNombre");
                        String SNombre = request.getParameter("textSegundoNombre");
                        String PApellido = request.getParameter("textPrimerApellido");
                        String SApellido = request.getParameter("textSegundoApellido");
                        String TelefonoPers = request.getParameter("textTelefono");
                        String Celular = request.getParameter("textCelular");

                        if (persDAO.Updatepers(i, PNombre, SNombre, PApellido, SApellido, TelefonoPers, Celular)) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }

                        break;

                    case "ActilizarUsConfig":
                        String NombreUs = request.getParameter("txtNombreUs");
                        String EmailUs = request.getParameter("txtEmailUs");
                        uss = ussDAO.seleccorreo2(EmailUs);
                        prs = ussDAO.consultarCorreo(i);
                        prs.setCorreoActilizado(EmailUs);
                        
                        if (uss.getEmail() == null) {                                                     
                            if (cco.enviarCorreo(prs, null, null, 6) > 0) {
                                if (ussDAO.UpdaterConfigUs(i, NombreUs, EmailUs)) {
                                    out.print("true");
                                }

                            } else {
                                out.print("false");
                            }
                        } else {
                            out.print("false");
                            System.out.println("El correo ya existe");
                        }

                        break;

                    case "ActulizarContrasena":

                        HttpSession sessions = request.getSession();
                        Object ids = sessions.getAttribute("IdUs");
                        int ius = (Integer) ids;

                        String AnContrasena = request.getParameter("ContrasenaAnterior");

                        uss = ussDAO.SelectContrasena(ius, AnContrasena);

                        if (uss.getContrasena() != null) {
                            String NewContasena = request.getParameter("NuevaContrasena");
                            String New2Contrasena = request.getParameter("NuevaContrasena2");

                            if (NewContasena.equals(New2Contrasena)) {
                                ussDAO.UpdateContrasena(i, NewContasena);
                                out.print("true");

                            } else {
                                out.print("false");
                            }
                        } else {
                            out.print("false");
                        }

                        break;

                }

            }

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
