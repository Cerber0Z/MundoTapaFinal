<%-- 
    Document   : Afiliado
    Created on : 16/06/2020, 01:51:39 PM
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
        <title>JSP Page</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/usuario.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="js/tabUsuarios.js"></script>
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
                    <button id="boton" type="button" class="btn btn-success" data-toggle="modal" data-target="#staticBackdrop" title="Agregar Persona">
                        <span id="iconplsu" class="fa fa-plus"></span>
                    </button>
                    <h2 id="titulosa3" style="margin-left: 9%;font-size: revert;z-index: 1;position: absolute;font-family: sans-serif;">Personas afiliadas</h2>
                    <nav aria-label="breadcrumb">
                            <ol class="breadcrumb" id="migasdepan" style="width: 97.2%; font-size: smaller;background-color: #ffffff;margin-left: 9%;">
                                <li class="breadcrumb-item" id="migasdepan2"><a style="text-decoration:none; color: #8e8e8e;">Información</a></li>
                            <li class="breadcrumb-item" style="margin-top: -6px;"><a style="text-decoration:none; color: #8e8e8e;">Modulos</a></li>
                            <li class="breadcrumb-item" style="margin-top: -6px;"><a style="text-decoration:none; color: #3ca9e2;"  href="#">Personas afiliadas</a></li>
                        </ol>
                    </nav>

                    <div id="container-tabla" class="container-fluid">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-gray-700">Tabla de Personas
                                </h6>
                            </div>
                            <div class="card-body" id="tabalascard">
                                <div class="table-responsive">
                                    <div id="container-usuario-table" class="container col-lg-12">

                                        <table class="table table-bordered table-hover dataTable" id="dtBasicExample" width="100%">
                                            <thead class="thead-Success">
                                                <tr>
                                                    <th scope="col">Cédula</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Nombre de usuario</th>
                                                    <th scope="col">Correo Electrónico</th>
                                                    <th scope="col">Celular</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="listaP" items="${Listap}">
                                                    <tr>
                                                        <td scope="col">${listaP.getCedPersona()}</td>
                                                        <td scope="col">${listaP.getPrimerNombre()} ${listaP.getPrimerApellido()}</td>
                                                        <td scope="col">${listaP.getNombreUsuario()}</td>
                                                        <td scope="col">${listaP.getEmail()}</td>
                                                        <td scope="col">${listaP.getCelularPersona()}</td>
                                                    </tr>
                                                </c:forEach>
                                            <div id="mensaje" class="text-gray-700 ">
                                            </div>
                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- modal de agregar usuario-->
                <div class="modal fade" id="staticBackdrop" data-backdrop="staticBackdrop" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel" style="color:#04bfd0">Agregar Persona</h5>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <span data-hj-suppress="true" class="label required" for="NumeroDocumento">Número de documento*</span>
                                    <input type="text" maxlength="10" class="form-control" id="NumDocumento"  name="NumDocumento" required>
                                </div>
                                <div class="form-group">
                                    <span data-hj-suppress="true" class="label required" for="PrimerNombre">Pimer nombre*</span>
                                    <input type="text" class="form-control" id="txtPrimerNombre" name="txtPrimerNombre" required>
                                </div>
                                <div class="form-group">
                                    <span data-hj-suppress="true" class="label required" for="PrimerApellido">Pimer apellido*</span>
                                    <input type="text" class="form-control" id="txtPrimerApellido" name="txtPrimerApellido" required>
                                </div>
                                <div class="form-group">
                                    <span data-hj-suppress="true" class="label required" for="CelularPersona">Celular*</span>
                                    <input type="text" maxlength="10" class="form-control" id="txtCelularPerosna" name="txtCelularPerosna" required>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" class="form-control" id="txtUsuario" name="txtUsuario" required>
                                </div>
                                <div class="form-group">
                                    <span data-hj-suppress="true" class="label required" for="Email">Correo Electrónico*</span>
                                    <input type="email" class="form-control" id="txtEmail" name="txtEmail" required>
                                </div>
                                <div class="from-group">
                                    <span data-hj-suppress="true" class="label required" for="Rol">Rol</span>
                                    <select class="form-control" id="Roluss" name="Rols">
                                        <c:forEach var="uss" items="${listrol}"> 
                                            <option id="rolus" value="${uss.getRol_idRol()}" name="SltRols" scope="col">${uss.getNombreRol()}</option>
                                        </c:forEach> 
                                    </select>
                                </div>
                                <div class="from-group" id="BloquearPrs">
                                    <div class="custom-control custom-switch">
                                        <label for="Bloquear"></label>
                                        <input type="checkbox" class="custom-control-input ch" id="opcion2" name="txtbloqueado2">
                                        <label data-on-label="Si" data-off-label="No" class="custom-control-label ch" for="opcion2">
                                            Bloquear Usuario
                                        </label>
                                    </div>
                                    <p></p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-success" onclick="agregarusuario()">Agregar</button>
                            </div>
                        </div>
                    </div>
                </div>

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
        <script src="js/certificados.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    </body>
</html>
<% } else {
  request.getRequestDispatcher("index.jsp").forward(request, response);
} %>