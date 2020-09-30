<%-- 
    Document   : master
    Created on : 12/03/2020, 10:47:12 a. m.
    Author     : Sergio
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/footerUser.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <title>Mundo Tapa</title>
        <link href="css/responsive.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <!-- Page Wrapper -->
        <% if ((int)session.getAttribute("Rol") == 1) {%>
        <div id="wrapper">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="calendarioAdmin?accion=Listar">              

            </a>
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" style="color:#fff">              
                    <div class="sidebar-brand-text mx-3">Menú</div>
                </a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link collapsed" id="navlateral2" href="#" data-toggle="collapse" data-target="#AgendamietosWtigt" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="zmdi zmdi-calendar"></i>
                        <span>Agendamientos</span>
                    </a>
                    <div id="AgendamietosWtigt" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="calendarioAdmin?accion=Listar">Calendario</a>
                            <a class="collapse-item" href="recolecciones?accion=recolecciones">Cargar recolecciones</a>
                            <a class="collapse-item" href="totalsolicitudes?accion=totalsolicitudes">Total de solicitudes</a>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    información
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="zmdi zmdi-view-dashboard"></i>
                        <span>Módulos</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="Afiliado?menu=Afiliado&accion=ListarAfiliados">Afiliados</a>
                            <a class="collapse-item" href="Usuarios?menu=Usuarios&accion=Listar">Usuarios</a>     
                            <a class="collapse-item" href="Certificacion?accion=Reportes">Reportes</a>
                            <a class="collapse-item" href="Certificacion?accion=listar">Certificados</a>
                        </div>
                    </div>
                </li>
                <!-- Nav Item - Utilities Collapse Menu -->
                <!--<li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Utilidades</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Utilities:</h6>
                            <a class="collapse-item" href="utilities-color.html">Color</a>
                        </div>
                    </div>
                </li>-->
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div id="complemetos"  class="sidebar-heading">
                    Complementos
                </div>
                <li class="nav-item">
                    <a class="nav-link" href="SolicitudesAdmin?accion=Listar">
                        <i class="zmdi zmdi-trending-up"></i>
                        <span>Analítica</span>
                    </a>
                </li>
                <!-- <li class="nav-item">
                     <a class="nav-link" href="#">
                         <i class="fa fa-magic"></i>
                         <span>Personalización</span>
                     </a>
                 </li>-->
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <!--<button class="rounded-circle border-0" id="sidebarToggle"></button>-->
                </div>

            </ul>
            <!-- End of Sidebar -->

        </div>

        <% } else if ((int)session.getAttribute("Rol") ==2 ) { %>
        <div id="wrapper">
            <!-- Sidebar -->
             <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Usuarios?menu=SolicitudAU&accion=SolicitudAU">
                    
                </a>
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
               <a class="sidebar-brand d-flex align-items-center justify-content-center" style="color:#fff">              
                        <div class="sidebar-brand-text mx-3">Menú</div>
                    </a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a id="navlateral2" class="nav-link" href="Usuarios?menu=SolicitudAU&accion=SolicitudAU">
                        <i class="zmdi zmdi-calendar"></i>
                        <span>Agendamientos</span>
                    </a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    informacion
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="zmdi zmdi-view-dashboard"></i>
                        <span>Modulos</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">

                            <a class="collapse-item" href="Certificacion?accion=listar">Certificados</a>
                        </div>
                    </div>
                </li>
                <!-- Nav Item - Utilities Collapse Menu -->
                <!--<li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Utilidades</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Utilities:</h6>
                            <a class="collapse-item" href="utilities-color.html">Color</a>
                        </div>
                    </div>
                </li>-->
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div id="complemetos" class="sidebar-heading">
                    Complementos
                </div>
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="totalsolicitudesUS?accion=solicitudesUST">
                        <i class="fa fa-list"></i>
                        <span>Total Solicitudes</span>
                    </a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">
                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <!--<button class="rounded-circle border-0" id="sidebarToggle"></button>-->
                </div>
            </ul>
            <!-- End of Sidebar -->
        </div>
        <% } %>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

    </body>

</html>
