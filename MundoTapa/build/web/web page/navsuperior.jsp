<%-- 
    Document   : navsuperior
    Created on : 13/03/2020, 06:23:26 PM
    Author     : sergi
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/CabezoteUser.css" rel="stylesheet">
        <script src="js/tabPersona.js"></script>
        <script srC="js/IngresoCerrarSesion.js"></script>
        <link href="css/responsive.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Topbar -->
        <% if ((int)session.getAttribute("Rol") == 1) {%>
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="margin-bottom: 60px !important;">
            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>

            <div id="logo-favicon">
                <a class="navbar-brand js-scroll-trigger" href="calendarioAdmin?accion=Listar" id="logoimg"><img class="img-fluid" src="img/favicon.png" alt="" ></a>
            </div>
            <a class="navbar-brand js-scroll-trigger" href="calendarioAdmin?accion=Listar" id="titulomundo">Mundo tapa</a>
            <div class="topbar-divider d-none d-sm-block"></div>
            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                <li class="nav-item dropdown no-arrow d-sm-none">

                    <!-- Dropdown - Messages -->
                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>


                <div class="topbar-divider d-none d-sm-block"></div>
                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                        <img class="img-profile rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60">
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60">
                            <div class="dropdown-user-details">

                                <div class="dropdown-user-details-name"><%= session.getAttribute("nombreUs") %></div>
                                <div class="dropdown-user-details-email"><%= session.getAttribute("uname") %></div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="ConfiguracionUser?menu=ConfiguracionU&accion=Listar" id="configuracionUS">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            Configuración
                        </a>
                        <!--<a class="dropdown-item" href="#">
                           <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                           Tema perzonalizado
                       </a>-->
                        <a class="dropdown-item" href="index.jsp" data-toggle="modal" data-target="#logoutModal" onclick="CerrarSessionUsuario();">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Cerrar sesión
                        </a>
                    </div>
                </li>
            </ul>
        </nav>

                                <% } else if ((int)session.getAttribute("Rol") ==2 ) { %>
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="margin-bottom: 60px !important;margin-top: 1.5%;">
            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>

            <div id="logo-favicon">
                <a class="navbar-brand js-scroll-trigger" href="Usuarios?menu=SolicitudAU&accion=SolicitudAU" id="logoimg"><img class="img-fluid" src="img/favicon.png" alt="" ></a>
            </div>
            <a class="navbar-brand js-scroll-trigger" href="Usuarios?menu=SolicitudAU&accion=SolicitudAU" id="titulomundo">Mundo tapa</a>
            <div class="topbar-divider d-none d-sm-block"></div>
            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                <li class="nav-item dropdown no-arrow d-sm-none">

                    <!-- Dropdown - Messages -->
                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>

                <div class="topbar-divider d-none d-sm-block"></div>
                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                        <img class="img-profile rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60">
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60">
                            <div class="dropdown-user-details">

                                <div class="dropdown-user-details-name"><%= session.getAttribute("nombreUs") %></div>
                                <div class="dropdown-user-details-email"><%= session.getAttribute("uname") %></div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="ConfiguracionUser?menu=ConfiguracionU&accion=Listar" id="configuracionUS">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            Configuración
                        </a>
                        <!--<a class="dropdown-item" href="#">
                           <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                           Tema perzonalizado
                       </a>-->
                        <a class="dropdown-item" href="index.jsp" data-toggle="modal" data-target="#logoutModal" onclick="CerrarSessionUsuario();">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Cerrar sesión
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <% } %>
    </body>
</html>
