
<!------ Include the above in your HEAD tag ---------->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/util2.css">
        <link rel="stylesheet" type="text/css" href="css/main2.css">

    </head>
    <!--Coded with love by Mutiullah Samim-->
    <body>
        <div class="container-login100">

            <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
                <div class="d-flex justify-content-center">
                    <a href="index.jsp"><img src="img/favicon.png" class="brand_logo" alt="Logo" style="margin-left: 30%; margin-top: -20%;"></a>
                </div>
                <form class="login100-form validate-form">
                    <span class="login100-form-title p-b-37">
                        Recuperar contraseña
                    </span>
                    <div class="wrap-input100 validate-input m-b-20" data-validate="Enter username or email">
                        <input class="input100" type="text" id="txtcorreo" name="txtcorreo" placeholder="Correo electrónico">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="text-center p-b-20">
                        
                    </div>
                    <div class="container-login100-form-btn">
                        <button type="button"  name="btnIngresar" class="login100-form-btn" onclick="recoveryPass()">Confirmar</button>
                    </div>

                    <div class="text-center p-t-57 p-b-20">
                        <span class="txt1">

                        </span>
                    </div>
                    <div class="text-center">
                        <div class="d-flex justify-content-center links">
                            ¿No tienes una cuenta? <a href="registro.jsp" style="text-decoration: none;" class="ml-2">Regístrate</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="dropDownSelect1"></div>
    </body>

    <!--===============================================================================================-->
    <script srC="js/IngresoCerrarSesion.js"></script>
    <!--===============================================================================================-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</html>
