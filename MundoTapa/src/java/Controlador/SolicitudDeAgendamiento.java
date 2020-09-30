/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Agendamiento;
import Modelo.AgendamientoDAO;
import Modelo.ContrasenaDAO;
import Modelo.Persona;
import Modelo.PersonaDAO;
import Modelo.Uusuario;
import Modelo.UusuarioDAO;
import Rutas.CRutas;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author sergi
 */
@WebServlet(name = "SolicitudDeAgendamiento", urlPatterns = {"/SolicitudDeAgendamiento"})
public class SolicitudDeAgendamiento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
    UusuarioDAO ussDAO = new UusuarioDAO();
    Uusuario us = new Uusuario();
    PersonaDAO persDAO = new PersonaDAO();
    Persona prs = new Persona();
    ContrasenaDAO conDAO = new ContrasenaDAO();
    Agendamiento ang = new Agendamiento();
    AgendamientoDAO angDAO = new AgendamientoDAO();
    int ide;
    int idU;
    int ida;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object idUs = session.getAttribute("IdUs");
        idU = (Integer) idUs;
        Object id = session.getAttribute("ID");
        ide = (Integer) id;
        Object us = session.getAttribute("uname");
        Object rol = session.getAttribute("Rol");

        if (us == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            String accion = request.getParameter("accion");

            String menu = request.getParameter("menu");

            if (menu.equals("SolicitudAU")) {
                switch (accion) {
                    case "SolicitudAU":

                        List listSc = angDAO.SelecionarSolicitudUs(idU);
                        request.setAttribute("ListaUS", listSc);
                        List listCancel = angDAO.SelecionarSolicitudUsCancel(idU);
                        request.setAttribute("ListaCans", listCancel);
                        List ListaAgen = angDAO.SelecionarSolicitudUsAgendada(idU);
                        request.setAttribute("ListaAgen", ListaAgen);
                        List ListaCalendar = angDAO.SelecionarSolicitudUsAgendadayCompletadasCalendar(idU);
                        request.setAttribute("ListaCalendar", ListaCalendar);
                        Persona p = persDAO.datospersona(ide);
                        request.setAttribute("DPersona", p);
                        Object u = ussDAO.DatosUsuario(ide);
                        request.setAttribute("DUsuario", u);
                        List Listlocalidad = angDAO.listarLocalidad();
                        request.setAttribute("Listarloc", Listlocalidad);
                        List ListaMaterial = angDAO.listMaterial();
                        request.setAttribute("ListaM", ListaMaterial);

                        break;

                }
                request.getRequestDispatcher("SolicitudDeAgendamientosUS.jsp").forward(request, response);
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

        HttpSession session = request.getSession();
        Object idUs = session.getAttribute("IdUs");
        idU = (Integer) idUs;

        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");

        switch (accion) {

            case "Subirfoto":

                // Elimina la foto de perfil anterior de ese usuario
               
                // Luego envia la foto nueva 
                try {

                // Ruta de la foto a subir
                String rutafoto = CRutas.rutaFotosolicitudes();
                DiskFileItemFactory filefactory = new DiskFileItemFactory();
                filefactory.setSizeThreshold(1024);
                filefactory.setRepository(new File(rutafoto));
                ServletFileUpload uploadfoto = new ServletFileUpload(filefactory);

                List<FileItem> partesfoto = uploadfoto.parseRequest(request);

                for (FileItem items : partesfoto) {
                    File file = new File(rutafoto, items.getName());
                    items.write(file);
                    break;
                }

                response.getWriter().write("true");

            } catch (Exception e) {
                System.out.println("Error al subir la foto en post " + e);
            }

            break;

            case "InsertAgendamientoUS":

                String Nombredellugar = request.getParameter("Nombredellugar");
                String Direccion = request.getParameter("Direccion");
                String Telefono = request.getParameter("Telefono");
                String Celular = request.getParameter("Celular");
                int localidadt = Integer.parseInt(request.getParameter("localidad"));
                String Descripcion = request.getParameter("Descripcion");
                String validatedCustomFile = request.getParameter("validatedCustomFile").replaceAll("C:\\\\fakepath\\\\", "");
                int material = Integer.parseInt(request.getParameter("material"));

                ang.setNomLugarRecoleccion(Nombredellugar);
                ang.setDireccion(Direccion);
                ang.setTelefono(Telefono);
                ang.setCeluar(Celular);
                ang.setLocalidad_idLoc(localidadt);
                ang.setDescripcion(Descripcion);
                ang.setImagen(validatedCustomFile);
                ang.setMaterial_idMaterial(material);

                if (Nombredellugar != "" && Direccion != "" && Celular != "" && localidadt > 0 && Telefono != "") {
                    if (angDAO.InsertarSolicitudUS(Nombredellugar, Direccion, Telefono, Celular, localidadt, idU, Descripcion, validatedCustomFile, material) == true) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } else {
                    out.print("campos");
                }
                break;

            case "EliminarSolicitudUs":

                int idSolciud = Integer.parseInt(request.getParameter("solicitud"));
                String estado = angDAO.traeEstadoSolicitud(idSolciud);
                int iUsuario = angDAO.traeidUsuariodeSolicitud(idSolciud);

                if (estado.equals("Solicitado")) {
                    
                    if (iUsuario == idU) {
                        if (angDAO.EliminarSolicitudUs(idSolciud) == true) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }
                    } else {
                        System.out.println("La solicitud no pertenese al usuario");
                    }

                } else {
                    System.out.println("La solicitud no se puede eliminar por que no es de estado 1");
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
