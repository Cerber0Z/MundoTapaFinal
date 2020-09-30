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

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/usuario.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="js/certificados.js"></script>
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
                    <h2 id="titulocarag" style="margin-left: 9%;font-size: revert;z-index: 1;position: absolute; font-family: sans-serif;">Cargar recolecciones</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb" id="migasdepancarga" style="width: 99.2%; font-size: smaller;background-color: #ffffff;margin-left: 9%;">
                            <li class="breadcrumb-item breasd" id="migasdepancarga2"style="margin-left: 84%;margin-top: -6px;"><a style="text-decoration:none; color: #8e8e8e;" href="calendarioAdmin?accion=Listar">Agendamientos</a></li>
                            <li class="breadcrumb-item"style="margin-top: -6px;"><a style="text-decoration:none; color: #3ca9e2;"  href="#">Cargar recolecciones</a></li>
                        </ol>
                    </nav>
                    
                    <ul class="tabs" id="btnsUser4">
                        <button class="btn btn-primary" onclick="fechaExcels()">Excel recolecciones</button>
                        <button class="btn btn-info" data-toggle="modal" data-target="#modalcarga" >Cargar</button>
                    </ul>
                </div>
                <!---------------->
                <div id="modalcarga" class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-gray-700">Cargar recolecciones</h5>
                            </div>
                            <div class="modal-body">
                                <p class="mb-4">Para realizar una carga de reccolecciones debe ser con el <strong> excel recolecciones </strong> generado por el sistema si no lo tiene descarguelo
                                    <a href="#"   onclick="fechaExcels()">aqui.</a>  de lo contrario seleccione el documento </p>
                                <div class="form-group">
                                    <input  name="file" id="file" type="file" class="form-control-file">
                                </div> 
                            </div>
                            <label id="labelcarga"></label>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary text-gray-100" onclick="cargarRecolecciones()">Cargar usuarios</button> 
                                <button type="button" class="btn bg-gradient-secondary text-gray-100" data-dismiss="modal">Cancelar</button>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalafechaexcel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Exportar Excel</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <input type="date" class="form-control" id="fechaexcel" name="fechaexcel">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary" onclick="excelRecolecciones()">Exportar</button>
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
        <script src="js/recolecciones.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    </body>
</html>
<% } else {
  request.getRequestDispatcher("index.jsp").forward(request, response);
} %>
