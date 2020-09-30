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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sergi
 */
@WebServlet(name = "InsertarUsuario", urlPatterns = {"/InsertarUsuario"})
public class InsertarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Persona prs = new Persona();
    PersonaDAO persDAO = new PersonaDAO();
    Uusuario uss = new Uusuario();
    UusuarioDAO ussDAO = new UusuarioDAO();
    ContrasenaDAO contraDAO = new ContrasenaDAO();
    CCorreos cco = new CCorreos();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        switch (accion) {

            case "Insertar":

                String NumDocumento = request.getParameter("txtNumDoc");
                String PrimerNombre = request.getParameter("txtPrimerNombre");
                String PrimerApellido = request.getParameter("txtPrimerApellido");
                String Celular = request.getParameter("txtCelular");
                String NombreUsuario = request.getParameter("txtUsuario");
                String Emails = request.getParameter("txtEmail");
                String Contrasena = request.getParameter("txtContrsena");
                String Contrasena2 = request.getParameter("txtContrsena2");

                if (Contrasena.equals(Contrasena2)) {

                    prs.setCedPersona(NumDocumento);
                    prs.setPrimerNombre(PrimerNombre);
                    prs.setPrimerApellido(PrimerApellido);
                    prs.setCelularPersona(Celular);
                    uss.setNombreUsuario(NombreUsuario);
                    uss.setEmail(Emails);
                    uss.setContrasena(Contrasena);

                    Contrasena = contraDAO.Encriptar(Contrasena);

                    String nombrenew = ussDAO.validarNombre(PrimerNombre, PrimerApellido);
                    uss = ussDAO.seleccorreo2(Emails);
                    prs.setCorreo(Emails);
                    if (uss.getEmail() == null) {
                        if (persDAO.InsertarUsuario(NumDocumento, PrimerNombre, PrimerApellido, Celular, nombrenew, Emails, Contrasena) == true) {
                            if (cco.enviarCorreo(prs, null, null, 7)>0) {
                                out.print("true");
                            } else {
                                out.print("false");
                            }
                            
                        } else {
                            out.print("false");
                        }
                    } else {
                        out.print("false");
                    }
                } else {

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
