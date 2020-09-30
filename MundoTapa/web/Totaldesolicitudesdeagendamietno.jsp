<%-- 
    Document   : Totaldesolicitudesdeagendamietno
    Created on : 22/07/2020, 07:54:30 PM
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
        <input type="hidden" id="hdnombre" >
        <input type="hidden" id="hdcec">
        <input type="hidden" id="idUsuario">
        <!-- nav Superior-->
        <div id="navsuperiro">
            <jsp:include page="web page/navsuperior.jsp"/>
        </div> 
        <!-- Container -->
        <div class="container-fluid col-md-10">
            <h2 id="titulocarag2" style="margin-left: 9%;font-size: revert;z-index: 1;position: absolute;">Solicitudes de agendamiento</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb" id="migasdepan15" style="width: 97.2%; font-size: smaller;background-color: #ffffff;margin-left: 9%;">
                    <li class="breadcrumb-item breasd" id="i-agen" style="margin-left: 80%;margin-top: -6px;"><a style="text-decoration:none; color: #8e8e8e;" href="calendarioAdmin?accion=Listar">Agendamientos</a></li>
                    <li class="breadcrumb-item"style="margin-top: -6px;"><a style="text-decoration:none; color: #3ca9e2;"  href="#">Solicitudes de agendamiento</a></li>
                </ol>
            </nav>
            
            <div id="container-tabla" class="container-fluid">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <ul class="tabs" id="btnsSolici">
                <button  type="button" id="butonhabilitadas" class="btn btn-info" title="Solicitudes/Habilitadas" ><a href="#tab1" id="texdecoration">Solicitudes/Habilitadas</a></button>
                <button  type="button" id="butoncancelo" class="btn btn-danger" title="Solicitudes/Canceladas" ><a  href="#tab2" id="texdecoration">Solicitudes/Canceladas</a></button>
                <button  type="button" id="butoncomplet" class="btn btn-primary" title="Solicitudes/Completadas" ><a  href="#tab3" id="texdecoration">Solicitudes/Completadas</a></button>
                <button id="btnlist" type="button" class="btn btn-light" onclick="openLista()"><i class="fa fa-list" aria-hidden="true"></i></button>
            </ul>

                    </div>
                    <div class="card-body" id="tabalascard">
                        <div class="secciones">
                            <article id="tab1">
                                <div class="table-responsive">
                                    <div id="container-usuario-table" class="container col-lg-12">
                                        <table class="table table-bordered table-hover dataTable" id="dtBasicExample" width="100%">
                                            <thead class="thead-Success">
                                                <tr style="text-align: center">
                                                    <th scope="col">Código</th>
                                                    <th scope="col">Cédula</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Apellido</th>
                                                    <th scope="col">Correo Electrónico</th>
                                                    <th scope="col">Localidad</th>
                                                    <th scope="col">Estado</th>
                                                    <th scope="col">Ver</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="lista" items="${TotalS}"> 
                                                <div id="newtr">
                                                    <tr id="tr${lista.getIdSolicitud()}tr" style="text-align: center">
                                                        <td scope="col">${lista.getIdSolicitud()}</td>
                                                        <td scope="col">${lista.getCedPersona()}</td>
                                                        <td scope="col">${lista.getPrimerNombre()}</td>
                                                        <td scope="col">${lista.getPrimerApellido()}</td>
                                                        <td scope="col">${lista.getCorreo()}</td>
                                                        <td scope="col">${lista.getLocalidad()}</td>
                                                        <c:set var="estado" value="${lista.getEstAgenda_idEstAgenda()}"></c:set>  
                                                        <c:if test="${estado == 1}">
                                                            <c:set var="color" value="text-info"></c:set> 
                                                            <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${lista.getEstado()}</td>
                                                            </c:if>
                                                        <td> 
                                                            <button class="btn" id="btnedicion"  onclick="verSolicitud('${lista.getUsuarios_idUsuarios()}', '${lista.getPrimerNombre()}', '${lista.getPrimerApellido()}', '${lista.getIdSolicitud()}', '${lista.getCorreo()}', '${lista.getLocalidad()}', '${lista.getDescripcion()}', '${lista.getImagen()}', '${lista.getTelefono()}', '${lista.getCeluar()}', '${lista.getNomLugarRecoleccion()}', '${lista.getCedPersona()}', '${lista.getEstado()}', '${lista.getDireccion()}', '${lista.getMaterial()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>
                                                        </td>
                                                    </tr>
                                                </div>
                                            </c:forEach> 
                                            <div id="mensaje" class="text-gray-700 ">
                                            </div>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </article>
                            <article id="tab2">
                                <div class="table-responsive">
                                    <div id="container-usuario-table" class="container col-lg-12">
                                        <table class="table table-bordered table-hover dataTable" id="dtablaScudnaria" width="100%">
                                            <thead class="thead-Success">
                                                <tr style="text-align: center">
                                                    <th scope="col">Código</th>
                                                    <th scope="col">Cédula</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Apellido</th>
                                                    <th scope="col">Correo Electrónico</th>
                                                    <th scope="col">Localidad</th>
                                                    <th scope="col">Estado</th>
                                                    <th scope="col">Ver</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="listas" items="${TotalSC}"> 
                                                    <tr style="text-align: center">
                                                        <td scope="col">${listas.getIdSolicitud()}</td>
                                                        <td scope="col">${listas.getCedPersona()}</td>
                                                        <td scope="col">${listas.getPrimerNombre()}</td>
                                                        <td scope="col">${listas.getPrimerApellido()}</td>
                                                        <td scope="col">${listas.getCorreo()}</td>
                                                        <td scope="col">${listas.getLocalidad()}</td>
                                                        <c:set var="estado" value="${listas.getEstAgenda_idEstAgenda()}"></c:set>  
                                                        <c:if test="${estado == 2}">
                                                            <c:set var="color" value="text-danger"></c:set> 
                                                            <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${listas.getEstado()}<!--Solicitado.--></td>
                                                        </c:if>
                                                        <td> 
                                                            <button class="btn" id="btnedicion" onclick="verSolicitudCancelada('${listas.getUsuarios_idUsuarios()}', '${listas.getPrimerNombre()}', '${listas.getPrimerApellido()}', '${listas.getIdSolicitud()}', '${listas.getCorreo()}', '${listas.getLocalidad()}', '${listas.getDescripcion()}', '${listas.getImagen()}', '${listas.getTelefono()}', '${listas.getCeluar()}', '${listas.getNomLugarRecoleccion()}', '${listas.getCedPersona()}', '${listas.getEstado()}', '${listas.getDireccion()}', '${listas.getRazon()}', '${listas.getMaterial()}')"><a href="#"><i class="fa fa-eye" title="Detalles de la cancelacion"></i></a></button>
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
                            <article id="tab3">
                                <div class="table-responsive">
                                    <div id="container-usuario-table" class="container col-lg-12">
                                        <table class="table table-bordered table-hover dataTable" id="dtablaTerciaria" width="100%">
                                            <thead class="thead-Success">
                                                <tr style="text-align: center">
                                                    <th scope="col">Código</th>
                                                    <th scope="col">Cédula</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Apellido</th>
                                                    <th scope="col">Correo Electrónico</th>
                                                    <th scope="col">Localidad</th>
                                                    <th scope="col">Estado</th>
                                                    <th scope="col">Ver</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="listaC" items="${TotalSCom}"> 
                                                    <tr style="text-align: center">
                                                        <td scope="col">${listaC.getIdSolicitud()}</td>
                                                        <td scope="col">${listaC.getCedPersona()}</td>
                                                        <td scope="col">${listaC.getPrimerNombre()}</td>
                                                        <td scope="col">${listaC.getPrimerApellido()}</td>
                                                        <td scope="col">${listaC.getCorreo()}</td>
                                                        <td scope="col">${listaC.getLocalidad()}</td>
                                                        <c:set var="estado" value="${listaC.getEstAgenda_idEstAgenda()}"></c:set>  
                                                        <c:if test="${estado == 6}">
                                                            <c:set var="color" value="text-primary"></c:set> 
                                                            <td scope="col"><i style="font-size: 13px; margin-right: 5px;" class="fa fa-circle ${color}"></i>${listaC.getEstado()}<!--Solicitado.--></td>
                                                        </c:if>
                                                        <td> 
                                                            <button class="btn" id="btnedicion"  onclick="verSolicitudCompletadaAdmin('${listaC.getUsuarios_idUsuarios()}', '${listaC.getPrimerNombre()}', '${listaC.getPrimerApellido()}', '${listaC.getIdSolicitud()}', '${listaC.getCorreo()}', '${listaC.getLocalidad()}', '${listaC.getDescripcion()}', '${listaC.getImagen()}', '${listaC.getTelefono()}', '${listaC.getCeluar()}', '${listaC.getNomLugarRecoleccion()}', '${listaC.getCedPersona()}', '${listaC.getEstado()}', '${listaC.getDireccion()}', '${listaC.getMaterial()}', '${listaC.getIdRecoleccion()}', '${listaC.getFechaAgendamiento()}', '${listaC.getRecolectador()}', '${listaC.getCantidadKG()}', '${listaC.getNombreTrasportadora()}')"><a href="#"><i class="fa fa-eye" title="Detalles"></i></a></button>
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
            <div id="mySidenav" class="sidenav bg-gray-100 border-left h-100 d-inline-block imgchat">
                <a href="javascript:void(0)" class="closebtn mb-1 fas fa-1x" onclick="closeLista();">&times;</a>
                <div id="chatsgrup"  class="scr panel-body w-100 p-3 h-83 d-inline-block ">
                    <div><h4>Lista de solicitudes</h4></div>
                    <hr>
                    <div id="listsolicitudes"></div>
                    <hr>
                    <div>
                        <button class="btn btn-primary" onclick="Solicitudagendada()"><i class="fa fa-check-square" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>
            <div class="p-2">
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
                    <div class="modal-footer">
                        <button id="btndesaprobar" type="button" class="btn btn-danger" onclick="DesaprobarSolicitudRazon()">Desaprobar</button>
                        <button id="btnaprobar" type="button" class="btn btn-primary" onclick="crearSolicitudes()">Aprobar</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal 2-->
        <div class="modal fade" id="modalcompletado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content2">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detalles de solicitud <b>#<label id="codigo2"></label></b></h5>

                        <a  tabindex="0" href="#" id="etiqutacompletada" class="badge badge-success" role="button" data-toggle="popover" data-trigger="focus" data-content="Esta solicitud ya termino su proceso de recogida" ><h6 style="margin-bottom: 0;font-size: small;">Completado</h6></a>
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
                            <hr size="10" style="margin-top: 0px; margin-bottom: 15px;" />
                            <div class="col-sm" id="form-controls">
                                <div class="row">
                                    <div class="col">
                                        <span data-hj-suppress="true" id="labels" class="label required" for="Correoelectronico">Correo electronico</span>
                                        <label id="correo2" class="textsisz"></label>
                                    </div>
                                    <div class="col">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Telefono">Material reciclable</span>
                                        <label id="material2" class="textsisz"></label>
                                    </div>
                                    <div class="col col-lg-5">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">Fecha de la recolección</span> 
                                        <label id="FechaRecolecion2" class="textsisz"></label> 
                                    </div>

                                </div>
                            </div>
                            <hr size="10" style="margin-top: 0px; margin-bottom: 15px;" />
                            <div class="col-sm" id="form-controls">
                                <div class="row">
                                    <div class="col col-sm-2">
                                        <span data-hj-suppress="true" id="labels" class="label required" for="Localidad">Localidad</span>
                                        <label id="localidad2" class="textsisz"></label>
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
                            <hr class="hr2">
                            <div class="form-group" id="form-controls">
                                <div class="col-sm-10 mb-3 mb-sm-0" id="fotodedonativoComp">
                                    <span data-hj-suppress="true" id="labels"  class="label required" for="Celular">Foto</span>
                                    <div id="img2"  style="width: 444px">
                                    </div>
                                </div>
                            </div>
                            <hr size="10" style="margin-top: 0px; margin-bottom: 10px; width: 200%;" />
                            <div class="col-sm" id="form-controls">
                                <div class="row">
                                    <div class="col col-sm-3">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">#Recolección</span>   
                                        <label id="idrecolecion2" class="textsisz"></label> 
                                    </div>
                                    <div class="col col-sm-3">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">Nombre del recolector</span>
                                        <label id="NombreRecoletor2" class="textsisz"></label> 
                                    </div>
                                    <div class="col col-sm-3">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">Trasportadora</span>   
                                        <label id="nombretrasportadora2" class="textsisz"></label> 
                                    </div>
                                    <div class="col col-sm-3">
                                        <span data-hj-suppress="true" id="labels"  class="label required" for="Indicaciones">Cantidad KG</span>   
                                        <label id="cantidadkg2" class="textsisz"></label> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal de razon del cancelamiento-->
        <div class="modal fade" id="modalrazon" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" id="modal-Rcancelamiento">
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
        <!--Modal agendamiento -->
        <div class="modal fade" id="modalagendamiento" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Agendar Solicitudes</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <input type="date" class="form-control" id="fechaagendada" name="fechaagendada">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" onclick="agregarSolicitud()">Agendar</button>
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


