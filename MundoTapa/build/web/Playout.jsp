<%
if (session.getAttribute("ID") != null) {
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <link href="css/agendamietoADM.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <script src="js/playout.js"></script>
        <link href="css/responsive.css" rel="stylesheet">


    </head>

    <body id="page-top">
        <!-- nav Superior-->
        <div id="navsuperiro">
            <jsp:include page="web page/navsuperior.jsp"/>
        </div> 
        <!-- Container -->
        <div id="analiticasadmin" class="container-fluid col-md-10" style="margin-left: 14.3%;">
            <h2 >Analíticas</h2>
            <p></p>
            <div class="row">
                <div class="col-lg-6 col-xl-3">
                    <div class="shadow-sm  mb-2 bg-white rounded">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <h5 class="text-muted font-weight-normal mt-0 text-truncate" title="Usuarios Activos" style="width: 154%;">Donantes Registrados</h5>

                                        <h3 class="my-2 py-1"><c:out value="${contUsuarios.getConut_usuarios()}"/> = <i class="fa fa-user" aria-hidden="true"></i></h3>
                                        <p class="mb-0 text-muted">
                                            <span class="text-success mr-2"><i class="mdi mdi-arrow-up-bold"></i><i class="fa fa-arrow-up" aria-hidden="true">&nbsp;</i><c:out value="${contUsuarios.getConut_usuarios()}"/>% </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xl-3">
                    <div class="shadow-sm  mb-2 bg-white rounded">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <h5 class="text-muted font-weight-normal mt-0 text-truncate" title="Usuarios Activos" style="width: 154%;">Papel o Cartón</h5>
                                        <h3 class="my-2 py-1"><c:out value="${contarPapelycarton.getConut_papelcarton()}"/> KG = <i class="fa fa-file" aria-hidden="true"></i></h3>
                                        <p class="mb-0 text-muted">
                                            <span class="text-success mr-2"><i class="mdi mdi-arrow-up-bold"></i><i class="fa fa-arrow-up" aria-hidden="true">&nbsp;</i><c:out value="${contarPapelycarton2.getCount_papelcarton2()}"/>%</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xl-3">
                    <div class="shadow-sm  mb-2 bg-white rounded">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <h5 class="text-muted font-weight-normal mt-0 text-truncate" title="Usuarios Activos" style="width: 154%;">Plásticos</h5>
                                        <h3 class="my-2 py-1"><c:out value="${contarPlasticos.getContarPlastico()}"/> KG = </h3>
                                        <p class="mb-0 text-muted">
                                            <span class="text-success mr-2"><i class="mdi mdi-arrow-up-bold"></i><i class="fa fa-arrow-up" aria-hidden="true">&nbsp;</i><c:out value="${contarPlasticos2.getContarPlastico2()}"/>%</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xl-3">
                    <div class="shadow-sm  mb-2 bg-white rounded">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <h5 class="text-muted font-weight-normal mt-0 text-truncate" title="Usuarios Activos" style="width: 154%;">Metales</h5>
                                        <h3 class="my-2 py-1"><c:out value="${contarMetal.getContarMetal()}"/> KG = </h3>
                                        <p class="mb-0 text-muted">
                                            <span class="text-success mr-2"><i class="mdi mdi-arrow-up-bold"></i><i class="fa fa-arrow-up" aria-hidden="true">&nbsp;</i><c:out value="${contarMetal2.getContarMetal2()}"/>%</span>
                                        </p>
                                    </div>
                                </div>
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

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>

</html>
<% } else {
  request.getRequestDispatcher("index.jsp").forward(request, response);
} %>
