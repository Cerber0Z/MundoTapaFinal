<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Registro</title>
        <link rel="stylesheet" href="css/registro.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <!-- Font Awesome Icons -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
        <!-- Theme CSS - Includes Bootstrap -->
        <link href="css/creative.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="js/registro.js"></script>
        <script srC="js/tabPersona.js"></script>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="login100-more"></div>
                <div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
                    <span class="login100-form-title p-b-59">
                        Regístrate
                    </span>
                    <div class="wrap-input100 validate-input" data-validate="Numero de documento requerido">
                        <input class="input100" maxlength="10" id="txtNumDoc" type="text" name="txtNumDoc" placeholder="Numero de Documento*">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Primer Nombre requerido">
                        <input class="input100" id="txtPrimerNombre" type="text" name="txtPrimerNombre" placeholder="Primer Nombre*">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Pirmer Apellido requerido">
                        <input  class="input100" id="txtPrimerApellido" type="text" name="txtPrimerApellido" placeholder="Pirmer Apellido*">
                        <span class="focus-input100"></span>
                    </div>
                    <div  class="wrap-input100 validate-input" data-validate="Numero de celular requerido">
                        <input class="input100" maxlength="10" type="text" name="txtCelular" id="txtCelular" placeholder="Celular">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="form-group">
                        <input name="txtUsuario" type="hidden" class="form-control" id="txtUsuario" >
                    </div>
                    <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                        <input class="input100" type="email" name="txtEmail" id="txtEmail" placeholder="Email addess...">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate = "Password is required">
                        <input class="input100" type="password" name="txtContrsena" id="txtContrsena" placeholder="Contraseña">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Repeat Password is required">
                        <input class="input100" type="password" name="txtContrsena2" id="txtContrsena2" placeholder="Repetir contraseña">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="flex-m w-full p-b-33">
                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                            <label class="label-checkbox100" for="ckb1">
                                <span class="txt1">
                                    Al crear una cuenta, confirmo que tengo al menos 18 años acepto los 
                                    <a href="#" class="txt2 hov1">
                                        Términos y Condiciones 
                                    </a>
                                    y la 
                                    <a href="#" class="txt2 hov1">
                                        Política de privacidad
                                    </a>
                                </span>
                            </label>
                        </div>
                    </div>
                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button style="font-family: cursive" type="button" class="login100-form-btn" name="btnRegistrar" onclick="InsertarUsuario()">Registrarse</button>
                        </div>
                        <br></br>
                        <div class="d-flex justify-content-center links">
                            ¿Ya tienes una cuenta? <a href="login.jsp" class="ml-2" style="color: #306b00 ">Inicia Sesión</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/contact_me.js"></script>
        <!-- Custom scripts for this template -->
        <script src="js/creative.min.js"></script>
        <script src="js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    </body>
</html>