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
        <script src="js/tabAgendamientosUS.js"></script> 
        <link href="css/calendario.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <script>
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover({html: true});
            });
        </script>
    </head>
    <body id="page-top">
        <input type="hidden" name="idEstado" id="idEstado">
        <!-- nav Superior-->
        <div id="navsuperiro" style="margin-top: -1.5%;">
            <jsp:include page="web page/navsuperior.jsp"/>
        </div> 
        <!-- Container -->
        <div id="titleAgendaUs" class="container-fluid col-md-8" style="margin-left: 15%;">
            <h2 style="font-size: revert;z-index: 1; font-family: sans-serif;">Agendamientos</h2>
            <p class="mb-4"></p>
            <div class="card shadow col-md-10 center" id="calendarioXD">
                <div class="row">
                    <button id="buntonAgregarSolic" type="button" class="btn btn-success" data-toggle="modal" title="Agregar Agendamiento" onclick="agregaragendamiento()">
                        <span id="iconplsu" class="fa fa-plus"></span>
                    </button>
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
                    <c:forEach var="ListaCalendar" items="${ListaCalendar}"><c:set var="estado" value="${ListaCalendar.getEstAgenda_idEstAgenda()}"></c:set>
                            {
                        <c:if test="${estado == 6}">
                            title: 'Completada #${ListaCalendar.getIdSolicitud()}',
                                    start: '${ListaCalendar.getFechaAgendamiento()}',
                                    backgroundColor: '#0cb976',
                                    borderColor: "#0cb976",
                        </c:if>
                        <c:if test="${estado == 3}">
                            title: 'Solicitud: #${ListaCalendar.getIdSolicitud()}',
                                    start: '${ListaCalendar.getFechaAgendamiento()}',
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
                    <tr style="text-align: center">
                        <th>ID#</th>
                        <th>Localidad</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="Lista" items="${ListaUS}"> 
                        <tr style="text-align: center">
                            <td scope="col">${Lista.getIdSolicitud()}<!--36--></td>
                            <td scope="col">${Lista.getLocalidad()}<!--2020-06-18--></td>
                            <c:set var="estado" value="${Lista.getEstAgenda_idEstAgenda()}"></c:set>  
                            <c:if test="${estado == 1}">
                                <c:set var="color" value="text-info"></c:set> 
                            </c:if>
                            <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${Lista.getEstado()}<!--Solicitado.--></td>
                            <td>
                                <button class="btn" id="btnedicion"  onclick="verSolicitud('${Lista.getUsuarios_idUsuarios()}', '${Lista.getPrimerNombre()}', '${Lista.getPrimerApellido()}', '${Lista.getIdSolicitud()}', '${Lista.getCorreo()}', '${Lista.getLocalidad()}', '${Lista.getDescripcion()}', '${Lista.getImagen()}', '${Lista.getTelefono()}', '${Lista.getCeluar()}', '${Lista.getNomLugarRecoleccion()}', '${Lista.getCedPersona()}', '${Lista.getEstado()}', '${Lista.getDireccion()}', '${Lista.getMaterial()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>
                                <button class="btn" id="btneliminar" onclick="EliminarSolicitud('${Lista.getIdSolicitud()}')"><a style="color:#ef82d7!important"><i class="fa fa-ban" title="Cancelar"></i></a></button>
                            </td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
            <table class="table  table-sm table-centered shadow col-md-5" id="TabalSolicitud2">
                <thead>
                    <tr style="text-align: center">
                        <th>ID#</th>
                        <th>Localidad</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ListaCan" items="${ListaCans}"> 
                        <tr style="text-align: center">
                            <td scope="col">${ListaCan.getIdSolicitud()}<!--36--></td>
                            <td scope="col">${ListaCan.getLocalidad()}<!--2020-06-18--></td>
                            <c:set var="estados" value="${ListaCan.getEstAgenda_idEstAgenda()}"></c:set>  
                            <c:if test="${estados == 2}">
                                <c:set var="colors" value="text-danger"></c:set> 
                            </c:if>
                            <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${colors}"></i>${ListaCan.getEstado()}<!--Solicitado.--></td>
                            <td>
                                <button class="btn" id="btnedicionc"  onclick="verSolicitudCancelada2('${ListaCan.getUsuarios_idUsuarios()}', '${ListaCan.getPrimerNombre()}', '${ListaCan.getPrimerApellido()}', '${ListaCan.getIdSolicitud()}', '${ListaCan.getCorreo()}', '${ListaCan.getLocalidad()}', '${ListaCan.getDescripcion()}', '${ListaCan.getImagen()}', '${ListaCan.getTelefono()}', '${ListaCan.getCeluar()}', '${ListaCan.getNomLugarRecoleccion()}', '${ListaCan.getCedPersona()}', '${ListaCan.getEstado()}', '${ListaCan.getDireccion()}', ' ${ListaCan.getRazon()}', '${ListaCan.getMaterial()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>
                            </td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
            <table class="table table-sm table-centered shadow col-md-5" id="TabalSolicitud3"> 
                <thead> 
                    <tr style="text-align: center">
                        <th>ID#</th>
                        <th>Localidad</th>
                        <th>Fecha recolección</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ListaAgen" items="${ListaAgen}"> 
                        <tr style="text-align: center">
                            <td scope="col">${ListaAgen.getIdSolicitud()}<!--36--></td>
                            <td scope="col">${ListaAgen.getLocalidad()}<!--2020-06-18--></td>
                            <td scope="col">${ListaAgen.getFechaAgendamiento()}<!--2020-06-18--></td>
                            <c:set var="estado" value="${ListaAgen.getEstAgenda_idEstAgenda()}"></c:set>  
                            <c:if test="${estado == 3}">
                                <c:set var="color" value="text-warning"></c:set> 
                            </c:if>
                            <td scope="col"><i title="Estado Agendado" style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${ListaAgen.getEstado()}<!--Solicitado.--></td>
                            <td>
                                <button class="btn" id="btnedicion"  onclick="verSolicitudAgendad('${ListaAgen.getUsuarios_idUsuarios()}', '${ListaAgen.getPrimerNombre()}', '${ListaAgen.getPrimerApellido()}', '${ListaAgen.getIdSolicitud()}', '${ListaAgen.getCorreo()}', '${ListaAgen.getLocalidad()}', '${ListaAgen.getDescripcion()}', '${ListaAgen.getImagen()}', '${ListaAgen.getTelefono()}', '${ListaAgen.getCeluar()}', '${ListaAgen.getNomLugarRecoleccion()}', '${ListaAgen.getCedPersona()}', '${ListaAgen.getEstado()}', '${ListaAgen.getDireccion()}', '${ListaAgen.getMaterial()}', '${ListaAgen.getFechaAgendamiento()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>
                            </td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
        </div>
        <!--Agnedamiento por parte de usuario-->
        <div class="modal fade" id="modalAgregarsolicitud" data-backdrop="staticBackdrop"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel" style="color:#04bfd0;">Agregar Solicitud</h5>
                    </div>
                    <div class="text-center modal-header" id="TajetaPerfil">
                        <img id="ImagenPerfil" class="img-thumbnail avatar-lg rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60">
                        <div id="infoUsaurio">
                            <span data-hj-suppress="true" class="label required" id="ifoUsuario" for="Numerodedocumento">${DPersona.getCedPersona()}</span>
                            <span data-hj-suppress="true" class="label required" id="ifoUsuario" for="Nombre">${DPersona.getPrimerNombre()} ${DPersona.getPrimerApellido()}</span>
                            <span data-hj-suppress="true" class="label required" id="ifoUsuario" for="Emial">${DUsuario.getEmail()}</span>
                        </div>
                    </div>
                    <form class="needs-validation" novalidate>
                        <div class="modal-body">
                            <div class="form-group">
                                <span data-hj-suppress="true" id="labels" class="label required" for="Nombredellugar">Edificio / Conjunto / Apartamento*</span>
                                <input type="text" class="form-control" id="Nombredellugar"  name="Nombredellugar" >
                            </div>
                            <div class="form-group">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Direccion">Dirección*</span>
                                <input type="text" class="form-control" maxlength="250" id="Direccion" name="Direccion" required>
                            </div>
                            <div class="form-group">
                                <span data-hj-suppress="true" id="labels" class="label required" for="Telefono">Teléfono</span>
                                <input type="text" maxlength="10" class="form-control" id="Telefono" name="Telefono" required value="${DPersona.getTelefonoFijoPers()}">
                            </div>
                            <div class="form-group">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Celular*</span>
                                <input type="text" maxlength="10" class="form-control" id="Celular" name="Celular" required value="${DPersona.getCelularPersona()}">
                            </div>
                            <div class="form-group">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Localidad">Localidad*</span>
                                <select id="localidad" class="form-control">
                                    <option value="0">Localidades</option>
                                    <c:forEach var="listLoc" items="${Listarloc}"> 
                                        <option  value="${listLoc.getLocalidad_idLoc()}">${listLoc.getLocalidad()}</option>
                                    </c:forEach> 
                                </select>
                            </div>
                            <div class="form-group" >
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Idicaciones">Indicaciones</span>
                                <textarea  class="form-control" rows="4" cols="63" id="Descripcion" name="Descripcion" required></textarea>
                            </div>
                            <div class="form-group">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="material">Material reciclable*</span>
                                <select id="material" class="form-control">
                                    <option value="0">Materiales</option>
                                    <c:forEach var="Listam" items="${ListaM}"> 
                                        <option  value="${Listam.getMaterial_idMaterial()}">${Listam.getMaterial()}</option>
                                    </c:forEach> 
                                </select>
                            </div>
                            <div class="custom-file mb-3">
                                <input type="file" class="form-control" id="validatedCustomFile" name="validatedCustomFile" required>
                                <label class="custom-file-label" for="validatedCustomFile">Selecionar imagen del donativo....</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button"  class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" id="AgregarSolicitud" class="btn btn-success" onclick="InsertAgendamietoUS()">Agregar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Modal detalles de solicitud -->
        <div class="modal fade" id="modalinfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo"></label></b></h5>
                        <a  tabindex="0" href="#" id="etiqutacompletada" class="badge badge-info" role="button" data-toggle="popover" data-trigger="focus" data-content="Pendiente por aprobar o cancelar" ><h6 style="margin-bottom: 0;font-size: small;">Solicitado</h6></a>
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
                                    <label id="materialesR" class="textsisz"></label>
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col col-sm-2">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Localidad">Localidad</span>
                                    <label id="localidads" class="textsisz"></label>
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
                                <label id="descrip" class="textsisz"></label>
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
        <!--Modal cancelado -->
        <div class="modal fade" id="modalcancelado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo2"></label></b></h5>
                        <a  tabindex="0" href="#" id="etiqutacompletada" class="badge badge-danger" role="button" data-toggle="popover" data-trigger="focus" data-content="Esta solicitud fue cancelada" ><h6 style="margin-bottom: 0;font-size: small;">Cancelada</h6></a>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="NombreAfiliado">Nombre</span>
                                    <label id="nombre2" class="textsisz"></label>
                                    <label id="apellido2" class="textsisz"></label> 
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Cedula">Cedula</span>
                                    <label id="cedula2" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Celular</span>
                                    <label id="celular2" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="telefono">teléfono</span>
                                    <label id="telefono2" class="textsisz"></label>
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Correoelectronico">Correo electronico</span>
                                    <label id="correo2" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-4">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Material reciclable</span>
                                    <label id="materialesR2" class="textsisz"></label>
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col col-sm-2">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Localidad">Localidad</span>
                                    <label id="localidads2" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Direccion">Dirección residencial</span>
                                    <label id="direccion2" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-6">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Nombredellugar">Edificio / Conjunto / Apartamento</span>
                                    <label id="nombrelugar2" class="textsisz"></label> 
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="form-group" id="form-controls">
                            <div class="col-sm-10 mb-3 mb-sm-0">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Foto</span>
                                <div id="img2"  style="width: 444px">
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="d-flex justify-content-center">
                            <div class="p-2 flex-fill bd-highlight">
                                <a  tabindex="0" href="#" id="etiqutacompletadasRazon2" class="btn btn-outline-danger" role="button" data-toggle="popover" data-trigger="focus" data-content="Esta solicitud fue rechazada por el siguiente motivo:"><h6 style="margin-bottom: 0;font-size: small;">Razón</h6></a>
                            </div>
                        </div>
                        <div class="form-group" id="form-controls">
                            <div class="p-2 flex-fill bd-highlight">
                                <textarea class="form-control" id="razoncancelacion2" name="razontext" rows="2" disabled></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal solicitudes agendads -->
        <div class="modal fade" id="modalagendamitoUS" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo4"></label></b></h5>
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
                                    <label id="nombre4" class="textsisz"></label>
                                    <label id="apellido4" class="textsisz"></label> 
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Cedula">Cedula</span>
                                    <label id="cedula4" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Celular</span>
                                    <label id="celular4" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="telefono">teléfono</span>
                                    <label id="telefono4" class="textsisz"></label>
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Correoelectronico">Correo electronico</span>
                                    <label id="correo4" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-4">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Material reciclable</span>
                                    <label id="material4" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-4">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Fecha de recolección</span>
                                    <label id="fecharecogida4" class="textsisz"></label>
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="col-sm" id="form-controls">
                            <div class="row">
                                <div class="col col-sm-2">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Localidad">Localidad</span>
                                    <label id="localidad4" class="textsisz"></label>
                                </div>
                                <div class="col">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Direccion">Dirección residencial</span>
                                    <label id="direccion4" class="textsisz"></label>
                                </div>
                                <div class="col col-lg-6">
                                    <span data-hj-suppress="true" id="labels" class="label required" for="Nombredellugar">Edificio / Conjunto / Apartamento</span>
                                    <label id="nombrelugar4" class="textsisz"></label> 
                                </div>
                            </div>
                        </div>
                        <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                        <div class="form-group" id="form-controls">
                            <div class="col-sm-10 col-md-8">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">Indicaciones</span>
                                <label id="descrip4"  class="textsisz"></label>
                            </div> 
                        </div>
                        <div class="form-group" id="form-controls">
                            <div class="col-sm-10 mb-3 mb-sm-0">
                                <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Foto</span>
                                <div id="img4"  style="width: 444px">
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
