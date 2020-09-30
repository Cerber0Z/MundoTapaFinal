/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Correo.CCorreos;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author sergi
 */
@WebServlet(name = "IngresaUsuario", urlPatterns = {"/IngresaUsuario"})
public class IngresaUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UusuarioDAO usdao = new UusuarioDAO();
    Uusuario us = new Uusuario();
    Persona prs = new Persona();
    PersonaDAO prsDAO = new PersonaDAO();
    CCorreos email = new CCorreos();

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
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion");

        switch (accion) {
            case "Ingresar":
                String user = request.getParameter("txtcorreo");
                String pass = request.getParameter("txtpass");
                String sessionId = null;
                us = usdao.Validar(user, pass);
                if (us.getEmail() != null && us.getContrasena() != null) {

                    session.setAttribute("ID", us.getPersona_idPersona());
                    session.setAttribute("IdUs", us.getIdUsuario());
                    session.setAttribute("Rol", us.getRol_idRol());
                    session.setAttribute("nombreUs", us.getNombreUsuario());
                    session.setAttribute("uname", user);
//                    session.setAttribute("upass", pass);

                    if (us.getRol_idRol() == 1) {
                        response.getWriter().write("one");
                    } else if (us.getRol_idRol() == 2) {
                        response.getWriter().write("two");
                    }

                    sessionId = session.getId();
                    Object a = usdao.DatosUsuario(us.getPersona_idPersona());
                    request.setAttribute("email", a);

//                    out.print("true");
                } else {
                    out.print("false");
                }

                break;

            case "CerrarSesion":

                //  Object uss = session.getAttribute("uname");
                session.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);

                break;

            case "confirmar": // Case para comprobar que el correo existe en la db para recuperar contraseña

                String correo = request.getParameter("correo");
                if (correo != null) {

                    us.setEmail(null);
                    us.setIdUsuario(0);
                    us = usdao.seleccorreo(correo);

                    if (us.getEmail() != null && us.getIdUsuario() > 0) {

                        if (us.getEmail().equalsIgnoreCase(correo)) {
                            prs.setCorreo(correo);
                            session.setAttribute("USUARIORECUPERA", us.getIdUsuario());
                            session.setAttribute("CODIGOEMAIL", email.enviarCorreo(prs, null, null, 4));
                            response.getWriter().write("true");
                        } else {
                            response.getWriter().write("false");
                        }
                    }

                } else {
                    response.getWriter().write("campos");
                }
                break;

            case "confirmarcodigo":

                int codigo = Integer.parseInt(request.getParameter("codigo"));
                if (codigo > 0) {
                    if (codigo == (int) session.getAttribute("CODIGOEMAIL")) {
                        response.getWriter().write("true");
                    } else {
                        response.getWriter().write("false");
                    }
                }

                break;

            case "actualizarpass":

                String contraseña = request.getParameter("contraseña");

                if (contraseña != null) {
                    if (usdao.UpdateContrasenausuario((int) session.getAttribute("USUARIORECUPERA"), contraseña) == true) {
                        response.getWriter().write("true");
                    } else {
                        response.getWriter().write("false");
                    }
                } else {
                    response.getWriter().write("campos");
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
