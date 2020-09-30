<%-- 
    Document   : ConfiguracionU
    Created on : 28/04/2020, 10:05:09 AM
    Author     : sergi
--%>
<%
if (session.getAttribute("ID") != null) {
%>

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
        <link href="css/configuracionU.css" rel="stylesheet">
        <script src="js/tabPersona.js"></script>
        <link href="css/responsive.css" rel="stylesheet">
    </head>
    <body>
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
                    
                    <p class="mb-4"></p>
                    <div id="container-tabla" class="container-fluid">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-gray-700">Información de usuario</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="datosdepersona" class="card col-lg-4">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel" style="color:#04bfd0">MIS DATOS</h5>
                                        </div>
                                        <p></p>

                                        <div id="imputsDatosU" >
                                            <span data-hj-suppress="true" class="label required" for="nombre">Pimer nombre*</span>
                                            <input type="text" class="form-control" value="${Persona.getPrimerNombre()}" name="textPrimerNombre" id="Pimernombre" required>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Segundo nombre</span>
                                            <input type="text" class="form-control" value="${Persona.getSegundoNombre()}" name="textSegundoNombre" id="Segundonombre"  required>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Pimer apellido*</span>
                                            <input type="text" class="form-control" value="${Persona.getPrimerApellido()}" name="textPrimerApellido" id="Pimerapellido" required>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Segundo apellido</span>
                                            <input type="text" class="form-control" value="${Persona.getSegundoApellido()}" name="textSegundoApellido" id="Segundoapellido"  required>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Teléfono</span>
                                            <input type="text" maxlength="10" class="form-control" value="${Persona.getTelefonoFijoPers()}" name="textTelefono" id="Telefono"  required>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Celular</span>
                                            <input type="text" maxlength="10" class="form-control" value="${Persona.getCelularPersona()}" name="textCelular" id="Celular"  required>
                                        </div>

                                        <div class="modal-footer" id="modalfooter">
                                            <button id="btnGuardar" type="button" class="btn btn-success" title="Guardar" onclick="actualizardatospers()">GUARDAR</button>
                                        </div>
                                    </div>
                                    <div id="datosdeusuario" class="card col-lg-4">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel" style="color:#04bfd0">CAMBIA LA CONTRASEÑA</h5>
                                        </div>
                                        <p></p>
                                        <div id="cambiocontraseña">
                                            <span data-hj-suppress="true" class="label required" for="ContrasenaAnterior">Introduce tu contraseña anterior</span>
                                            <input type="password" class="form-control" id="ContrasenaAnterior" name="ContrasenaAnterior" autocomplete="off" required>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Introduce tu nueva contraseña</span>
                                            <input type="password" class="form-control" id="NuevaContrasena" name="NuevaContrasena" required>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Vuelve a introducir tu nueva contraseña</span>
                                            <input type="password" class="form-control" id="NuevaContrasena2" name="NuevaContrasena2" required>
                                        </div>
                                        <div class="modal-footer" id="modalfooter">    
                                            <button id="btnGuardarC" type="button" class="btn btn-success" title="Guardar" onclick="actualizarcontrasena()" >GUARDAR</button>
                                        </div>
                                    </div>
                                    <div id="datosdeUs" class="card col-lg">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel" style="color:#04bfd0">MI PERFIL</h5>
                                        </div>
                                        <div class="mt-3 text-center modal-header" id="TajetaPerfil">
                                            <img id="ImagenPerfil" class="img-thumbnail avatar-lg rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60">
                                            <button id="boton2" type="button" class="btn btn-light">
                                                <span id="iconcamara" class="fa fa-camera" aria-hidden="true"></span>
                                            </button>
                                            <div id="infoUsaurio">
                                                <span data-hj-suppress="true" class="label required" for="Numerodedocumento">${Persona.getCedPersona()}</span>
                                                <span data-hj-suppress="true" class="label required" for="Nombre">${Persona.getPrimerNombre()} ${Persona.getPrimerApellido()}</span>
                                                <span data-hj-suppress="true" class="label required" for="Emial">${Usuario.getEmail()}</span>
                                                <span data-hj-suppress="true" class="label required" for="Rol">${Usuario.getNombreRol()}</span>
                                            </div>
                                        </div>
                                        <p></p>
                                        <div id="imputsDatosP">
                                            <span data-hj-suppress="true" class="label required" for="Numerodedocumento">Número de documento</span>
                                            <input type="number" maxlength="10" id="inputbloqueado" class="form-control" value="${Persona.getCedPersona()}" disabled>
                                            <span data-hj-suppress="true" class="label required" for="nombre">Nombre de usuario</span>
                                            <input type="text" class="form-control" value="${Usuario.getNombreUsuario()}" name="txtNombreUs" id="NombreUs" required>
                                            <span data-hj-suppress="true" class="label required" for="Emial">Correo electrónico</span>
                                            <input type="email" class="form-control" value="${Usuario.getEmail()}" name="txtEmailUs" id="EmailUs" required>
                                            <span data-hj-suppress="true"  class="label required" for="Rol">Rol</span>
                                            <input type="text" id="inputbloqueado" class="form-control" value="${Usuario.getNombreRol()}" disabled>
                                        </div>
                                        <div class="modal-footer" id="modalfooter">    
                                            <button id="btnGuardarUs" type="button" class="btn btn-success" title="Guardar" onclick="actilizarusconfig()">GUARDAR</button>
                                        </div>
                                    </div> 
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
<% } else {
  request.getRequestDispatcher("index.jsp").forward(request, response);
} %>
