<%-- 
    Document   : SolicitudDeAgendamientos
    Created on : 28/05/2020, 12:32:14 PM
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
        <meta http-equiv="Expires" content="0" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta name="description" content="">
        <meta name="author" content="">
        <title>Mundo Tapa</title>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href='packages/core/main.css' rel='stylesheet' />
        <link href='packages/daygrid/main.css' rel='stylesheet' />
        <link href='packages/timegrid/main.css' rel='stylesheet' />
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src='packages/core/main.js'></script>
        <script src='packages/interaction/main.js'></script>
        <script src='packages/daygrid/main.js'></script>
        <script src='packages/timegrid/main.js'></script>
        <script src="js/caledarioAdministracion.js"></script>
        <script src="js/calendarioAdmin.js"></script> 
        <link href="css/calendario.css" rel="stylesheet">
        <script>
            $(document).ready(function () {
            $('[data-toggle="popover"]').popover({html: true});
            });
        </script>
        <link href="css/responsive.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <input type="hidden" id="hdsoliciutd" >
        <input type="hidden" id="hdnombre" >
        <input type="hidden" id="hdcec">
        <!-- nav Superior-->
        <div id="navsuperiro">
            <jsp:include page="web page/navsuperior.jsp"/>
        </div> 
        <!-- Container -->
        <div class="container-fluid col-md-8"  id="containercaledar">
            <h2 id="tituloss" style="font-size: revert;z-index: 1;position: absolute; font-family: sans-serif;">Solicitudes agendadas</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb migasdepans" id="migasdepan">
                    <li class="breadcrumb-item breasd" id="breasd" style="margin-left: 83%;margin-top: -6px;">Agendamientos</li>
                    <li class="breadcrumb-item"style="margin-top: -6px;"><a style="text-decoration:none; color: #3ca9e2;"  href="calendarioAdmin?accion=Listar">Solicitudes agendadas</a></li>
                </ol>
            </nav>
            <div class="card shadow col-md-10 center" id="calendarioXD">
                <div class="row">

                    <div id='calendar'></div>
                </div>

                <script>

                    document.addEventListener('DOMContentLoaded', function () {

                    var fa = new Date();
                    fa.setHours(0, 0, 0, 0);
                    fechaactual = new Date(fa);
                    var calendarEl = document.getElementById('calendar');
                    var calendar = new FullCalendar.Calendar(calendarEl, {
                    plugins: ['interaction', 'dayGrid', 'timeGrid'],
                            header: {
                            left: 'prev,next',
                                    center: 'title',
                                    locale: 'es',
                                    right: 'today'
                            },
                            dayClick: function (date, jsEvent, view, resource) {

                            alert('Clicked on: ' + date.format());
                            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                            alert('Current view: ' + view.name);
                            // change the day's background color just for fun
                            $(this).css('background-color', 'red');
                            },
                            defaultDate: fechaactual,
                            navLinks: true, // can click day/week names to navigate views
                            editable: false,
                            eventLimit: true, // allow "more" link when too many events
                            events: [
                    <c:forEach var="Lista" items="${listacompletada}"><c:set var="estado" value="${Lista.getEstAgenda_idEstAgenda()}"></c:set>
                            {
                        <c:if test="${estado == 6}">
                            title: 'Completada #${Lista.getIdSolicitud()}',
                                    start: '${Lista.getFechaAgendamiento()}',
                                    backgroundColor: '#0cb976',
                                    borderColor: "#0cb976",
                        </c:if>
                        <c:if test="${estado == 3}">
                            title: 'Solicitud: #${Lista.getIdSolicitud()}',
                                    start: '${Lista.getFechaAgendamiento()}',
                                    borderColor: "#fdc22a",
                        </c:if>
                            },
                    </c:forEach>
                            ],
                    }
                    );
                    calendar.render();
                    });
                </script>


            </div>
            <table class="table table-sm table-centered shadow col-md-5" id="TabalSolicitud"> 
                <thead> 
                    <tr >
                        <th >ID#&nbsp;&nbsp;&nbsp;</th>
                        <th>Localidad</th>
                        <th>Fecha de recolección</th>
                        <th  style="text-align: center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="Lista" items="${listaagendada}"> 
                        <tr >
                            <td scope="col">${Lista.getIdSolicitud()}<!--36--></td>
                            <td scope="col">${Lista.getLocalidad()}<!--2020-06-18--></td>
                            <c:set var="estado" value="${Lista.getEstAgenda_idEstAgenda()}"></c:set>  
                            <c:if test="${estado == 3}">
                                <c:set var="color" value="text-warning"></c:set> 
                            </c:if>
                            <td scope="col"><i title="Estado Agendado" style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${Lista.getFechaAgendamiento()}<!--Solicitado.--></td>
                            <td  style="text-align: center">
                                <button class="btn" id="btnedicion"  onclick="verSolicitud('${Lista.getUsuarios_idUsuarios()}', '${Lista.getPrimerNombre()}', '${Lista.getPrimerApellido()}', '${Lista.getIdSolicitud()}', '${Lista.getCorreo()}', '${Lista.getLocalidad()}', '${Lista.getDescripcion()}', '${Lista.getImagen()}', '${Lista.getTelefono()}', '${Lista.getCeluar()}', '${Lista.getNomLugarRecoleccion()}', '${Lista.getCedPersona()}', '${Lista.getEstado()}', '${Lista.getDireccion()}', '${Lista.getMaterial()}', '${Lista.getFechaAgendamiento()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>
                                <button class="btn" id="btneliminar" onclick="cancelarsolicitudAgendad('${Lista.getIdSolicitud()}')"><a style="color:#ef82d7!important"><i class="fa fa-ban" title="Cancelar"></i></a></button>
                            </td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
        </div>

        <!--Modal detalles de solicitud -->
        <div class="modal fade" id="modalinfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo"></label></b></h5>
                        <a  tabindex="0" href="#" id="etiqutacompletada" class="badge badge-warning" role="button" data-toggle="popover" data-trigger="focus" data-content="Estado Agendado pediente para la recogida" ><h6 style="margin-bottom: 0;font-size: small;">Agendado</h6></a>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="NombreAfiliado">Nombre</span>
                                    <label id="nombre" class="textsisz"></label>
                                    <label id="apellido" class="textsisz"></label> 
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Cedula">Cedula</span>
                                    <label id="cedula" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Celular</span>
                                    <label id="celular" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="telefono">teléfono</span>
                                    <label id="telefono" class="textsisz"></label>
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Correoelectronico">Correo electronico</span>
                                    <label id="correo" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-4">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Material reciclable</span>
                                    <label id="material" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-4">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Fecha de recolección</span>
                                    <label id="fecharecogida" class="textsisz"></label>
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col col-sm-2">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Localidad">Localidad</span>
                                    <label id="localidad" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Direccion">Dirección residencial</span>
                                    <label id="direccion" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-6">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Nombredellugar">Edificio / Conjunto / Apartamento</span>
                                    <label id="nombrelugar" class="textsisz"></label> 
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="form-group" id="form-controls">
                            <div class="col-sm-10 col-md-8">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">Indicaciones</span>
                                <label id="descrip"  class="textsisz"></label>
                            </div> 
                        </div>
                        <div class="form-group" id="form-controls">
                            <div class="col-sm-10 mb-3 mb-sm-0">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Foto</span>
                                <div id="img"  style="width: 444px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal desaprobar solicitud ya agendada-->
        <div class="modal fade" id="modalrazon" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" id="modal-Rcancelamiento2">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Desaprobar solicitud <b>#<label id="codigoC"></label></b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <blockquote class="blockquotess">
                                    <p>Escribe la razón por la cual <b>DESAPRUEBAS</b> esta solicitud, una vez <b>DESAPROBADA</b>, la solcitud no se podra recuperar. Por favor ser especifico ya que la respuesta la podra ver el donante.</p> 
                                </blockquote>
                                <textarea class="form-control" id="razontext" name="razontext" rows="7"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button id="btndesaprobar2" type="button" class="btn btn-danger" onclick="DesaprobarSolicitudRazon2()">Desaprobar</button>
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
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    </body>
</html>
<% } else {
  request.getRequestDispatcher("index.jsp").forward(request, response);
} %>
