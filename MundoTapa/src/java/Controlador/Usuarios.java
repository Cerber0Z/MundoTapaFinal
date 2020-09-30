/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Correo.CCorreos;
import Modelo.Agendamiento;
import Modelo.AgendamientoDAO;
import Modelo.ContrasenaDAO;
import Modelo.Persona;
import Modelo.PersonaDAO;
import Modelo.Uusuario;
import Modelo.UusuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
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
@WebServlet(name = "Usuarios", urlPatterns = {"/Usuarios"})
public class Usuarios extends HttpServlet {

    Uusuario uss = new Uusuario();
    UusuarioDAO ussDAO = new UusuarioDAO();
    Persona prs = new Persona();
    PersonaDAO persDAO = new PersonaDAO();
    Agendamiento ang = new Agendamiento();
    AgendamientoDAO angDAO = new AgendamientoDAO();
    CCorreos cco = new CCorreos();
    int ide;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Object us = session.getAttribute("uname");
        Object rol = session.getAttribute("Rol");

        if (us == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            String accion = request.getParameter("accion");
            String menu = request.getParameter("menu");
            String convertedToString = String.valueOf(rol);
            switch (convertedToString) {
                case "1":

                    if (menu.equals("Usuarios")) {
                        switch (accion) {
                            case "Listar":
                                List lista = ussDAO.listar();
                                request.setAttribute("usuarios", lista);
                                List listartb = ussDAO.listartb();
                                request.setAttribute("usuariostb", listartb);
                                List listrol = ussDAO.listrol();
                                request.setAttribute("listrol", listrol);

                                String alert = request.getParameter("alert");

                                if (alert != null) {
                                    request.setAttribute("alert", alert);
                                }
                                break;

                            case "Eliminar":
                                if (accion.equals("Eliminar")) {

                                    ide = Integer.parseInt(request.getParameter("id"));
                                    ussDAO.delete(ide);
                                    request.getRequestDispatcher("Usuarios?menu=Usuarios&accion=Listar").forward(request, response);
                                    break;
                                }

                            case "Recupear":
                                ide = Integer.parseInt(request.getParameter("id"));
                                ussDAO.recuperar(ide);
                                request.getRequestDispatcher("Usuarios?menu=Usuarios&accion=Listar").forward(request, response);
                                break;
                        }
                        request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                    }
                    break;
                case "2":
                    if (menu.equals("SolicitudAU")) {
                        switch (accion) {
                            case "SolicitudAU":
                                request.getRequestDispatcher("SolicitudDeAgendamiento?menu=SolicitudAU&accion=SolicitudAU").forward(request, response);
                                break;
                        }
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
        ContrasenaDAO conDAO = new ContrasenaDAO();
        PrintWriter out = response.getWriter();
        CCorreos email = new CCorreos();

        String accion = request.getParameter("accion");
        switch (accion) {

            case "Playout":
                processRequest(request, response);
                break;
            case "SolicitudAU":
                processRequest(request, response);
                break;
            case "Actualizar":
                ide = Integer.parseInt(request.getParameter("id"));
                String NombreUser2 = request.getParameter("txtNombreus");
                String EmailUser2 = request.getParameter("txtEmailus");
                String Bloqueadouser2 = request.getParameter("txtbloqueado");
                int RolUser2 = Integer.parseInt(request.getParameter("SltRol"));

                uss = ussDAO.seleccorreo2(EmailUser2);
                uss = ussDAO.traeridPersonaconidusuario(ide);
                boolean verficarEmail2 = ussDAO.validarCorreoUs(EmailUser2);
                prs.setCorreo(EmailUser2);
                if (verficarEmail2 == true) {
                    prs = ussDAO.consultarCorreo(uss.getPersona_idPersona());
                    prs.setCorreoActilizado(EmailUser2);
                    if (cco.enviarCorreo(prs, null, null, 6) > 0) {
                        if (ussDAO.Update(ide, NombreUser2, EmailUser2, Bloqueadouser2, RolUser2)) {
                            out.print("true");
                        }
                    } else {
                        out.print("false");
                    }
                } else if (prs.getCorreo().equals(EmailUser2)) {
                    if (ussDAO.UpdateRol(ide, Bloqueadouser2, RolUser2)) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } else {
                    out.print("false");
                }
                

                break;

            case "Agregar":

                String NumDocumento = request.getParameter("NumDocumento");
                String PrimerNombre = request.getParameter("txtPrimerNombre");

                String PrimerApellido = request.getParameter("txtPrimerApellido");
                String CeluarPersona = request.getParameter("txtCelularPerosna");
                String NombreUsuario = request.getParameter("txtUsuario");
                String Emails = request.getParameter("txtEmail");
                String Bloqueado = request.getParameter("txtbloqueado2");
                int RolUser3 = Integer.parseInt(request.getParameter("SltRols"));

                Random rnd = new Random();
                int contraseña = rnd.nextInt(2153482) * 6;
                String contra = conDAO.Encriptar(Integer.toString(contraseña));

                prs.setCorreo(Emails);
                prs.setClave(Integer.toString(contraseña));

                String nombrenew = ussDAO.validarNombre(PrimerNombre, PrimerApellido);
                boolean verficarEmail = ussDAO.validarCorreoUs(Emails);
                boolean verficarCed = persDAO.SelectCedula(NumDocumento);
                if (verficarEmail == true && verficarCed == true && !Emails.equals("") && !PrimerNombre.equals("") && !PrimerApellido.equals("")) {
                    if (ussDAO.AgregarUsuario(NumDocumento, PrimerNombre, PrimerApellido, CeluarPersona, nombrenew, Emails, Bloqueado, RolUser3, contra) == true) {
                        out.print("true");
                        email.enviarCorreo(prs, null, null, 2);
                    } else {
                        out.print("false");
                    }
                } else {
                    out.print("false");
                }
                break;

            default:
                throw new AssertionError();
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
