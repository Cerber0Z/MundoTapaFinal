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
                    <h2 id="titulosa9" style="margin-left: 9%;font-size: revert;z-index: 1;position: absolute;">Certificados de donaciones</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb" id="migasdepan10" style="width: 97.2%; font-size: smaller;background-color: #ffffff;margin-left: 9%;">
                            <li class="breadcrumb-item breasd" id="migasdepan9" style="margin-left: 83%;margin-top: -6px;"><a style="text-decoration:none; color: #8e8e8e;">Información</a></li>
                            <li class="breadcrumb-item" style="margin-top: -6px;"><a style="text-decoration:none; color: #8e8e8e;">Modulos</a></li>
                            <li class="breadcrumb-item" style="margin-top: -6px;"><a style="text-decoration:none; color: #3ca9e2;"  href="#">Certificados</a></li>
                        </ol>
                    </nav>

                    <div id="container-tabla" class="container-fluid">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-gray-700">Donaciones realizadas</h6>
                                <ul class="tabs" id="btnsUser2">
                                    <button  type="button"class="btn btn-success" title="Consultar" data-toggle="modal" data-target="#modalfiltrar" >Filtrar Donaciones <i class="fas fa-search" id=""></i></button>
                                </ul>
                            </div>
                            <div class="card-body" id="tabalascard">
                                <div class="table-responsive">
                                    <div id="container-usuario-table" class="container col-lg-12">
                                        <table class="table table-bordered table-hover dataTable" id="dtBasicExample" width="100%">
                                            <thead class="thead-Success">
                                                <tr>
                                                    <th scope="col">#Solicitud</th>
                                                    <th scope="col">Nombre del donante</th>
                                                    <th scope="col">Cédula del donante</th>
                                                    <th scope="col">Fecha de recolección</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">Material</th>
                                                    <th scope="col">Enviar correo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cer" items="${certificaciones}">
                                                    <tr>
                                                        <td scope="col">${cer.getIdSolicitud()}</td>
                                                        <td scope="col">${cer.getPrimerNombre()} ${cer.getPrimerApellido()}</td>
                                                        <td scope="col">${cer.getCedPersona()}</td>
                                                        <td scope="col">${cer.getFecharecoleccion()}</td>
                                                        <td scope="col">${cer.getCantidad()} / Kg</td>
                                                        <td scope="col">${cer.getMaterial()}</td>
                                                        <td class="text-center">
                                                            <button type="button" onclick="enviarCorreo('${cer.getIdrecoleccion()}')" class=" btn btn-circle text-center  text-info"><i class="fa fa-2x fa-envelope"></i></button>
                                                        </td>
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
                <!--  MODALES -->
                <div class="modal fade" id="modalfiltrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Filtrar</h5>
                            </div>
                            <div class="modal-body">
                                <form action="Certificacion?accion=consultar" method="post">
                                    <div class="row">
                                        <div class="col-lg-6 mb-1">
                                            <label class="control-label text-gray-700" for="datepicker-start">&nbsp; Fecha de inicio</label>
                                            <input id="fechaInicio" class="form-control"  type="date" name="fechaInicio">
                                        </div>
                                        <div class="col-lg-6 mb-2">
                                            <label class="control-label text-gray-700" for="datepicker-end">&nbsp; Fecha de entrega</label>
                                            <input id="fechaFinal" class="form-control"  type="date" name="fechaFinal">
                                        </div>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <input type="submit" value="consultar" class="btn btn-primary">
                            </div>
                            </form>
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