<%-- 
    Document   : totaldesolicitudesUS
    Created on : 28/07/2020, 02:28:18 PM
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
        <script src="js/playout.js"></script>
        <script src="js/tabUsuarios.js"></script>
        <link href="css/responsive.css" rel="stylesheet">

        <script>
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover({html: true});
            });
        </script>
    </head>
    <body id="page-top">
        <input type="hidden" id="hdsoliciutd" >
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
                    <h2 style="margin-left: 9%;font-size: revert;z-index: 1; font-family: sans-serif;">Solicitudes de agendamiento</h2>

                    <p class="mb-4"></p>
                    <div id="container-tabla" class="container-fluid">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 id="esconderTitle" class="m-0 font-weight-bold text-gray-700">Solicitudes de agendamientos</h6>
                            </div>
                            <div class="card-body" id="tabalascard">
                                <div class="secciones">
                                    <article id="tab1">
                                        <div class="table-responsive">
                                            <div id="container-usuario-table" class="container col-lg-12">
                                                <table class="table table-bordered table-hover dataTable" id="dtBasicExample" width="100%">
                                                    <thead class="thead-Success">
                                                        <tr style="text-align: center">
                                                            <th scope="col">Codigo</th>
                                                            <th scope="col">Cedula</th>
                                                            <th scope="col">Nombre</th>
                                                            <th scope="col">Apellido</th>
                                                            <th scope="col">Correo Electrónico</th>
                                                            <th scope="col">Localidad</th>
                                                            <th scope="col">Estado</th>
                                                            <th scope="col">Ver</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="lista" items="${TotalSolicitud}"> 
                                                            <tr style="text-align: center">
                                                                <td scope="col">${lista.getIdSolicitud()}</td>
                                                                <td scope="col">${lista.getCedPersona()}</td>
                                                                <td scope="col">${lista.getPrimerNombre()}</td>
                                                                <td scope="col">${lista.getPrimerApellido()}</td>
                                                                <td scope="col">${lista.getCorreo()}</td>
                                                                <td scope="col">${lista.getLocalidad()}</td>
                                                                <c:set var="estado" value="${lista.getEstAgenda_idEstAgenda()}"></c:set>  
                                                                <c:if test="${estado == 1}">
                                                                    <c:set var="color" value="text-info"></c:set> 
                                                                    <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${lista.getEstado()}<!--Solicitado.--></td>
                                                                </c:if>
                                                                <c:if test="${estado == 2}">
                                                                    <c:set var="color" value="text-danger"></c:set> 
                                                                    <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${lista.getEstado()}<!--Solicitado.--></td>
                                                                </c:if>
                                                                <c:if test="${estado == 6}">
                                                                    <c:set var="color" value="text-primary"></c:set> 
                                                                    <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${lista.getEstado()}<!--Solicitado.--></td>
                                                                </c:if>
                                                                <c:if test="${estado == 3}">
                                                                    <c:set var="color" value="text-warning"></c:set> 
                                                                    <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${lista.getEstado()}<!--Solicitado.--></td>
                                                                </c:if>
                                                                <td> 
                                                                    <c:set var="estado" value="${lista.getEstAgenda_idEstAgenda()}"></c:set> 
                                                                    <c:if test="${estado == 1}">
                                                                        <button class="btn" id="btnedicion"  onclick="verSolicitud('${lista.getUsuarios_idUsuarios()}', '${lista.getPrimerNombre()}', '${lista.getPrimerApellido()}', '${lista.getIdSolicitud()}', '${lista.getCorreo()}', '${lista.getLocalidad()}', '${lista.getDescripcion()}', '${lista.getImagen()}', '${lista.getTelefono()}', '${lista.getCeluar()}', '${lista.getNomLugarRecoleccion()}', '${lista.getCedPersona()}', '${lista.getEstado()}', '${lista.getDireccion()}', '${lista.getMaterial()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>
                                                                            </c:if>
                                                                            <c:if test="${estado == 2}">
                                                                        <button class="btn" id="btnedicion" onclick="verSolicitudCancelada('${lista.getUsuarios_idUsuarios()}', '${lista.getPrimerNombre()}', '${lista.getPrimerApellido()}', '${lista.getIdSolicitud()}', '${lista.getCorreo()}', '${lista.getLocalidad()}', '${lista.getDescripcion()}', '${lista.getImagen()}', '${lista.getTelefono()}', '${lista.getCeluar()}', '${lista.getNomLugarRecoleccion()}', '${lista.getCedPersona()}', '${lista.getEstado()}', '${lista.getDireccion()}', '${lista.getRazon()}', '${lista.getMaterial()}')"><a href="#"><i class="fa fa-eye" title="Detalles de la cancelacion"></i></a></button>
                                                                            </c:if>
                                                                            <c:if test="${estado == 6}">
                                                                        <button class="btn" id="btnedicion"  onclick="verSolicitudCompletada2('${lista.getUsuarios_idUsuarios()}', '${lista.getPrimerNombre()}', '${lista.getPrimerApellido()}', '${lista.getIdSolicitud()}', '${lista.getCorreo()}', '${lista.getLocalidad()}', '${lista.getDescripcion()}', '${lista.getImagen()}', '${lista.getTelefono()}', '${lista.getCeluar()}', '${lista.getNomLugarRecoleccion()}', '${lista.getCedPersona()}', '${lista.getEstado()}', '${lista.getDireccion()}', '${lista.getMaterial()}', '${lista.getFechaAgendamiento()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>    
                                                                            </c:if>
                                                                            <c:if test="${estado == 3}">
                                                                        <button class="btn" id="btnedicion"  onclick="verSolicitudAgendad('${lista.getUsuarios_idUsuarios()}', '${lista.getPrimerNombre()}', '${lista.getPrimerApellido()}', '${lista.getIdSolicitud()}', '${lista.getCorreo()}', '${lista.getLocalidad()}', '${lista.getDescripcion()}', '${lista.getImagen()}', '${lista.getTelefono()}', '${lista.getCeluar()}', '${lista.getNomLugarRecoleccion()}', '${lista.getCedPersona()}', '${lista.getEstado()}', '${lista.getDireccion()}', '${lista.getMaterial()}', '${lista.getFechaAgendamiento()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>    
                                                                            </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach> 
                                                    <div id="mensaje" class="text-gray-700 ">
                                                    </div>
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
                <!-- modal -->
                <div class="modal fade" id="modalinfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content2">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo"></label></b></h5>
                                <a  tabindex="0" href="#" id="etiqutacompletada" class="badge badge-info" role="button" data-toggle="popover" data-trigger="focus" data-content="Pendiente por aprobar o cancelar" ><h6 style="margin-bottom: 0;font-size: small;">Pendiente</h6></a>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="controls-divs-info">
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
                                            <div class="col-8">
                                                <span data-hj-suppress="true" id="labels" class="label required" for="Correoelectronico">Correo electronico</span>
                                                <label id="correo" class="textsisz"></label>
                                            </div>
                                            <div class="col">
                                                <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Material reciclable</span>
                                                <label id="material" class="textsisz"></label>
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
                                        <div class="col-sm-12">
                                            <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">Indicaciones</span>
                                            <label id="descrip"  class="textsisz"></label>
                                        </div> 
                                    </div>
                                </div>
                                <hr class="hr6">
                                <div class="form-group" id="form-controls">
                                    <div class="col-sm-10 mb-3 mb-sm-0"  id="fotodedonativo">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Foto</span>
                                        <div id="img"  style="width: 465px">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--modal 2-->
                <div class="modal fade" id="modalcompletado2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo22"></label></b></h5>

                                <a  tabindex="0" href="#" id="etiqutacompletada" class="badge badge-success" role="button" data-toggle="popover" data-trigger="focus" data-content="Esta solicitud ya termino su proceso de recogida" ><h6 style="margin-bottom: 0;font-size: small;">Completado</h6></a>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="col-sm" id="form-controls">
                                    <div class="row">
                                        <div class="col">
                                            <span data-hj-suppress="true" id="labels" class="label required" for="NombreAfiliado">Nombre</span>
                                            <label id="nombre22" class="textsisz"></label>
                                            <label id="apellido22" class="textsisz"></label> 
                                        </div>
                                        <div class="col">
                                            <span data-hj-suppress="true" id="labels" class="label required" for="Cedula">Cedula</span>
                                            <label id="cedula22" class="textsisz"></label>
                                        </div>
                                        <div class="col">
                                            <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Celular</span>
                                            <label id="celular22" class="textsisz"></label>
                                        </div>
                                        <div class="col">
                                            <span data-hj-suppress="true" id="labels"  class="label required" for="telefono">teléfono</span>
                                            <label id="telefono22" class="textsisz"></label>
                                        </div>
                                    </div>
                                </div>
                                <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                                <div class="col-sm" id="form-controls">
                                    <div class="row">
                                        <div class="col">
                                            <span data-hj-suppress="true" id="labels" class="label required" for="Correoelectronico">Correo electronico</span>
                                            <label id="correo22" class="textsisz"></label>
                                        </div>
                                        <div class="col col-lg-6">
                                            <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Material reciclable</span>
                                            <label id="material22" class="textsisz"></label>
                                        </div>
                                        <div class="col col-lg-6">
                                            <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Fecha de la recolección</span>
                                            <label id="FechaRecolecion22" class="textsisz"></label>
                                        </div>
                                    </div>
                                </div>
                                <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                                <div class="col-sm" id="form-controls">
                                    <div class="row">
                                        <div class="col col-sm-2">
                                            <span data-hj-suppress="true" id="labels" class="label required" for="Localidad">Localidad</span>
                                            <label id="localidad22" class="textsisz"></label>
                                        </div>
                                        <div class="col">
                                            <span data-hj-suppress="true" id="labels"  class="label required" for="Direccion">Dirección residencial</span>
                                            <label id="direccion22" class="textsisz"></label>
                                        </div>
                                        <div class="col col-lg-6">
                                            <span data-hj-suppress="true" id="labels" class="label required" for="Nombredellugar">Edificio / Conjunto / Apartamento</span>
                                            <label id="nombrelugar22" class="textsisz"></label> 
                                        </div>
                                    </div>
                                </div>
                                <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                                <div class="form-group" id="form-controls">
                                    <div class="col-sm-10 mb-3 mb-sm-0">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Foto</span>
                                        <div id="img22"  style="width: 444px">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--modal de deaprobado-->
                <div class="modal fade" id="modalcancelado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content2">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo3"></label></b></h5>

                                <a  tabindex="0" href="#" id="etiqutacompletada" class="badge badge-danger" role="button" data-toggle="popover" data-trigger="focus" data-content="Esta solicitud esta cancelada" ><h6 style="margin-bottom: 0;font-size: small;">Cancelada</h6></a>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="controls-divs-info">
                                    <div class="col-sm" id="form-controls">
                                        <div class="row">
                                            <div class="col">
                                                <span data-hj-suppress="true" id="labels" class="label required" for="NombreAfiliado">Nombre</span>
                                                <label id="nombre3" class="textsisz"></label>
                                                <label id="apellido3" class="textsisz"></label> 
                                            </div>
                                            <div class="col">
                                                <span data-hj-suppress="true" id="labels" class="label required" for="Cedula">Cedula</span>
                                                <label id="cedula3" class="textsisz"></label>
                                            </div>
                                            <div class="col">
                                                <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Celular</span>
                                                <label id="celular3" class="textsisz"></label>
                                            </div>
                                            <div class="col">
                                                <span data-hj-suppress="true" id="labels"  class="label required" for="telefono">teléfono</span>
                                                <label id="telefono3" class="textsisz"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                                    <div class="col-sm" id="form-controls">
                                        <div class="row">
                                            <div class="col">
                                                <span data-hj-suppress="true" id="labels" class="label required" for="Correoelectronico">Correo electronico</span>
                                                <label id="correo3" class="textsisz"></label>
                                            </div>
                                            <div class="col-4">
                                                <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Material reciclable</span>
                                                <label id="material3" class="textsisz"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                                    <div class="col-sm" id="form-controls">
                                        <div class="row">
                                            <div class="col col-sm-2">
                                                <span data-hj-suppress="true" id="labels" class="label required" for="Localidad">Localidad</span>
                                                <label id="localidad3" class="textsisz"></label>
                                            </div>
                                            <div class="col">
                                                <span data-hj-suppress="true" id="labels"  class="label required" for="Direccion">Dirección residencial</span>
                                                <label id="direccion3" class="textsisz"></label>
                                            </div>
                                            <div class="col col-lg-6">
                                                <span data-hj-suppress="true" id="labels" class="label required" for="Nombredellugar">Edificio / Conjunto / Apartamento</span>
                                                <label id="nombrelugar3" class="textsisz"></label> 
                                            </div>
                                        </div>
                                    </div>
                                    <hr size="10" style="margin-top: 0px; margin-bottom: 10px;" />
                                    <div class="form-group" id="form-controls">
                                        <div class="col-sm-10 mb-3 mb-sm-0"  id="fotodedonativoC">
                                            <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Foto</span>
                                            <div id="img3"  style="width: 444px">
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="hr3">
                                    <div class="d-flex justify-content-center">
                                        <div class="p-2 flex-fill bd-highlight">
                                            <blockquote class="blockquotess2">
                                                <p>Esta solicitud fue rechazada por el siguiente motivo:</p> 
                                            </blockquote>
                                        </div>
                                    </div>
                                    <div class="form-group" id="form-controls">
                                        <div class="p-2 flex-fill bd-highlight">
                                            <textarea class="form-control" id="razoncancelacion" name="razontext" rows="2" disabled></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- modal -->
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