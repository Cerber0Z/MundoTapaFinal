<%-- 
    Document   : Usuarios
    Created on : 25/03/2020, 01:40:51 PM
    Author     : sergi
--%>

<%
if (session.getAttribute("ID") != null) {
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
           response.setHeader("Programa", "No-cache");
           response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
           response.setDateHeader("Expires", 0);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mundo tapa</title>

        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/usuario.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="js/tabUsuarios.js"></script>
        <script src="js/validacioncampos.js"></script>
        <link href="css/responsive.css" rel="stylesheet">


    </head>
    <body id="page-top">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- nav Superior-->
                <div id="navsuperiro">
                    <jsp:include page="web page/navsuperior.jsp"/>
                </div> 
                <!-- Container -->
                <div class="container-fluid col-md-10">
                    <h2 id="titulosa" style="font-family: sans-serif;"  >Usuarios</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb" id="migasdepans" style="width: 99.2%; font-size: smaller;background-color: #ffffff;margin-left: 9%;">
                            <li class="breadcrumb-item breasd"  id="migasdepan2"><a style="text-decoration:none; color: #8e8e8e;">Información</a></li>
                            <li class="breadcrumb-item" style="margin-top: -6px;"><a style="text-decoration:none; color: #8e8e8e;">Modulos</a></li>
                            <li class="breadcrumb-item" style="margin-top: -6px;"><a style="text-decoration:none; color: #3ca9e2;"  href="#">Usuarios</a></li>
                        </ol>
                    </nav>

                    <div id="container-tabla" class="container-fluid">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-gray-700">Tablas de usuarios</h6>
                                <ul class="tabs" id="btnsUser3">
                                    <button  type="button"class="btn btn-success" title="Usuarios/Habilitados" ><a href="#tab1" id="texdecoration">Usuarios/Habilitados</a></button>
                                    <button  type="button" class="btn btn-danger" title="Usuarios/Eliminados" ><a  href="#tab2" id="texdecoration">Usuarios/Eliminados</a></button>
                                </ul>
                            </div>
                            <div class="card-body" id="tabalascard">
                                <div class="secciones">
                                    <article id="tab1">
                                        <div class="table-responsive">
                                            <div id="container-usuario-table" class="container col-lg-12">
                                                <table class="table table-bordered table-hover dataTable" id="dtBasicExample" width="100%">
                                                    <thead class="thead-Success">
                                                        <tr>
                                                            <th scope="col">Id</th>
                                                            <th scope="col">Nombre</th>
                                                            <th scope="col">Correo Electrónico</th>
                                                            <th scope="col">Bloqueado</th>
                                                            <th scope="col">Rol</th>
                                                            <th scope="col">Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="uss" items="${usuarios}">
                                                            <tr>
                                                                <td scope="col">${uss.getIdUsuario()}</td>
                                                                <td scope="col">${uss.getNombreUsuario()}</td>
                                                                <td scope="col">${uss.getEmail()}</td>
                                                                <td scope="col">${uss.getBloqueado()}</td>
                                                                <td scope="col">${uss.getNombreRol()}</td>
                                                                <td>
                                                                    <button class="btn" onclick="editarpersona('${uss.getIdUsuario()}', '${uss.getNombreUsuario()}', '${uss.getEmail()}', '${uss.getBloqueado()}', '${uss.getNombreRol()}')"  id="btnedicion"><a href="#"><i class="fa fa-edit" title="Editar"></i></a></button>
                                                                    <button class="btn" id="btneliminar"><a style="color:#ef82d7!important" href="Usuarios?menu=Usuarios&accion=Eliminar&id=${uss.getIdUsuario()}"><i class="fa fa-trash" title="Eliminar"></i></a></button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                    </article>
                                    <article id="tab2">
                                        <div class="table-responsive">
                                            <div id="container-usuario-table" class="container col-lg-12">
                                                <table class="table table-bordered table-hover dataTable" id="dtablaScudnaria" width="100%" cellspacing="0">
                                                    <thead class="thead-Success">
                                                        <tr>
                                                            <th scope="col">Id</th>
                                                            <th scope="col">Nombre</th>
                                                            <th scope="col">Correo Electrónico</th>
                                                            <th scope="col">Bloqueado</th>
                                                            <th scope="col">Rol</th>
                                                            <th scope="col">Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="usss" items="${usuariostb}">
                                                            <tr>
                                                                <td scope="col">${usss.getIdUsuario()}</td>
                                                                <td scope="col">${usss.getNombreUsuario()}</td>
                                                                <td scope="col">${usss.getEmail()}</td>
                                                                <td scope="col">${usss.getBloqueado()}</td>
                                                                <td scope="col">${usss.getNombreRol()}</td>
                                                                <td>
                                                                    <button class="btn btn-warning" id="btnrecuperacion" title="Recuperar"><a id="texdecoration" href="Usuarios?menu=Usuarios&accion=Recupear&id=${usss.getIdUsuario()}">Recuperar</a></button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- modal de editar -->
                <div class="modal fade" id="modaleditar" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel" style="color:#04bfd0">Editar Usuario</h5>
                            </div>
                            <div class="needs-validation" novalidate>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <span data-hj-suppress="true" class="label required" for="nombreUs">Nombre de Usuario*</span>
                                        <input type="text" class="form-control" id="nombreus" name="txtNombreus" title="Nombre de Usuario">
                                    </div>
                                    <div class="form-group">
                                        <span data-hj-suppress="true" class="label required" for="Email">Email*</span>
                                        <input type="email" class="form-control" id="emailus" name="txtEmailus" title="Email">
                                    </div>
                                    <div class="from-group">
                                        <span data-hj-suppress="true" class="label required" for="Rol">Rol</span>
                                        <select class="form-control"  title="Rol" id="Rol" name="Rol">
                                            <c:forEach var="uss" items="${listrol}"> 
                                                <option id="roluss" value="${uss.getRol_idRol()}" name="SltRol" scope="col">${uss.getNombreRol()}</option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                    <div class="from-group" id="BloquearUs">
                                        <label for="Bloquear"></label>
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" class="custom-control-input ch" id="opcion" name="txtbloqueado">
                                            <label class="custom-control-label ch" for="opcion">
                                                Bloquear Usuario
                                            </label>
                                        </div>
                                        <p></p>
                                    </div>
                                    <div  id="alert">
                                        ${alert}
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" title="Cancelar">Cancelar</button>
                                    <button id="btnActlizar" type="button" class="btn btn-success" title="Actualizar" onclick="actualizardatos()">Actulizar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Coloar estilos-->

                <!-- nav lateral --> 
                <div id="navlateral">
                    <jsp:include page="web page/navlateral.jsp" />
                </div>
                <!-- Footer -->
                <div>
                    <jsp:include page="web page/navfooter.jsp" />
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <!-- Custom scripts for this template -->
        <script src="js/creative.min.js"></script>
        <script src="js/app.js"></script>
        <script src="js/demo/datatables-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    </body>
</html>
<% } else {
  request.getRequestDispatcher("index.jsp").forward(request, response);
} %>




<%-- 

<ul class="navbar-nav bg-gradient-sidevar sidebar toggled sidebar-dark" id="accordionSidebar">
    <input type="hidden" value="<%=session.getAttribute("NOMBRE")%>" id="nm">
    <input type="hidden" value="<%=session.getAttribute("ID")%>" id="id">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center mb-4" href="#" target="_blank">
        <!--Logo muñeco-->
        <div class="sidebar-brand-icon rotate-n-20">
            <img src="dashboard/Imagenes/LogoWC.png" class="fas fa-laugh-wink" />
        </div>
    </a>
    <div class="mb-4"></div>
    <div class="mb-4"></div>
    <hr class="sidebar-divider">
    <li class="nav-item active">
        <a class="nav-link"  href="users?menu=Perfil&accion=Miperfil">
            <img  src="dashboard/Imagenes/icons/Usuario.png">
            <span>${miname}</span></a>
    </li>
    <li class="nav-item active">
        <a class="nav-link"  href="allindex?">
            <img  src="dashboard/Imagenes/icons/Home.png">
        </a>
    </li>
    <div class="mb-4"></div>
    <hr class="sidebar-divider mb-4">
    <!-- NAV ITEM TAREAS -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#"  data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            <img  src="dashboard/Imagenes/icons/Tareas.png"  />
            <span>Tareas</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-gradient-sidevar py-2 collapse-inner rounded">
                <a class="collapse-item" href="tasks?accion=ListarTareas&opcion=1" >Mis tareas</a>
                <%if ((int) session.getAttribute("IDROL") < 3) {%> 
                <a class="collapse-item " href="tasksofgroup?accion=Listargrupo">Grupales </a> 
                <% } %>
                <% if ((int) session.getAttribute("ID") <= 2) {%>
                <a class="collapse-item " href="taskshistory?accion=Listargrupo">Historial</a>
                <% } else if ((int) session.getAttribute("ID") > 2) { %>
                <a class="collapse-item " href="taskshistory?accion=ListTareas">Historial</a> 
                <% } %>
            </div>
        </div>
    </li>
    <!-- NAV ITEM CALENDARIOS -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
           aria-expanded="true" aria-controls="collapseUtilities">

            <img src="dashboard/Imagenes/icons/calendar.png" />
            <span>Calendario</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-gradient-sidevar py-2 collapse-inner rounded">
                <!-- menu=CalendarioSalas&accion=ListarCalendario -->
                <a class="collapse-item" href="meetings?menu=Salajuntas">Reuniones</a>
                <!--  <a class="collapse-item" href="meetings?menu=Micalendario">Mi calendario</a> -->
            </div>
        </div>
    </li>
    <!-- Divider -->

    <!-- Heading -->
    <!-- NAV ITEM OBJETOS -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
            <img  src="dashboard/Imagenes/icons/objetos.png" />
            <span>Objetos</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-gradient-sidevar py-2 collapse-inner rounded">
                <a class="collapse-item" href="objectsofevents?accion=Listar">Eventos</a>
                <%  if ((int) session.getAttribute("IDROL") < 3) { %>
                <a class="collapse-item" href="objectsofevents?accion=Allobjects">Registros</a>
                <% } %>
                <div class="collapse-divider"></div>
            </div>
        </div>
    </li>
    <!-- Nav Item - Usuarios -->
    <li class="nav-item">
        <a class="nav-link collapsed " href="#" data-toggle="collapse" data-target="#collapseUsers" aria-expanded="true" aria-controls="collapsePages">
            <img  src="dashboard/Imagenes/icons/Registros.png" />
            <span>Grupos</span>
        </a>
        <div id="collapseUsers" class="collapse" aria-labelledby="headingUsers" data-parent="#accordionSidebar">
            <div class="bg-gradient-sidevar py-2 collapse-inner rounded">
                <%if ((int) session.getAttribute("IDROL") == 1) {%> 
                <a class="collapse-item"  href="roleandaddres?">Areas y roles</a>
                <% }%>
                <a class="collapse-item" href="users?menu=Consultar&accion=Listar">Usuarios</a> 
                <div class="collapse-divider"></div>
            </div>
        </div>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <!-- Sidebar Toggler (Sidebar) -->
    <!-- <div class="text-center d-none d-md-inline">
         <button class="rounded-circle border-0" id="sidebarToggleTop"></button>
     </div> -->
</ul> --%>
