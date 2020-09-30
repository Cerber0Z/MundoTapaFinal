function validarEmail(correo) {
    if (/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.([a-zA-Z]{2,4})+$/.test(correo)) {
        return true;
    } else {
        return false;
    }
}
function validarNumero(telefono) {
    if (/^([0-9])*$/.test(telefono)) {
        return true;
    } else {
        return false;
    }
}
function validarLetras(telefono) {
    if (/^([a-z A-Z])*$/.test(telefono)) {
        return true;
    } else {
        return false;
    }
}

function actualizardatospers() {
    Usuario = document.getElementById('btnGuardar').value;
    Pnombre = document.getElementById('Pimernombre').value;
    Snombre = document.getElementById('Segundonombre').value;
    Papellido = document.getElementById('Pimerapellido').value;
    Sapellido = document.getElementById('Segundoapellido').value;
    Telefono = document.getElementById('Telefono').value;
    Celular = document.getElementById('Celular').value;

// 
    var arrayinputs = ["#Pimernombre", "#Segundonombre", "#Pimerapellido", "#Segundoapellido", "#Telefono", "#Celular"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }

    if (Pnombre === null || Pnombre === '') {
        mensajeError1('Por favor complete el campo primer nombre', '#Pimernombre');
    } else if (validarLetras(Pnombre) === false) {
        mensajeError1('Por favor ingrese solo letras', '#Pimernombre');
    } else if (validarLetras(Snombre) === false) {
        mensajeError1('Por favor ingrese solo letras', '#Segundonombre');
    } else if (Papellido === null || Papellido === '') {
        mensajeError1('Por favor complete el campo primer apellido', '#Pimerapellido');
    } else if (validarLetras(Papellido) === false) {
        mensajeError1('Por favor ingrese solo letras', '#Pimerapellido');
    } else if (validarLetras(Sapellido) === false) {
        mensajeError1('Por favor ingrese solo letras', '#Segundoapellido');
    } else if (Telefono === null || Telefono === '') {
        mensajeError1('Por favor complete el campo telefono', '#Telefono');
    } else if (validarNumero(Telefono) === false) {
        mensajeError1('Por favor ingrese solo numeros', '#Telefono');
    } else if (validarNumero(Celular) === false) {
        mensajeError1('Por favor ingrese solo numeros', '#Celular');
    } else {

        var arrayinputs = ["#Pimernombre", "#Segundonombre", "#Pimerapellido", "#Segundoapellido", "#Telefono", "#Celular"];

        for (var i = 0; i < arrayinputs.length; i++) {
            $(arrayinputs[i]).removeClass('is-invalid').addClass('is-valid');
        }

        $.post("ConfiguracionUser?menu=ConfiguracionUser&accion=Acualizarpers", {id: Usuario, textPrimerNombre: Pnombre, textSegundoNombre: Snombre, textPrimerApellido: Papellido, textSegundoApellido: Sapellido, textTelefono: Telefono, textCelular: Celular}, function (out) {

            if (out === 'true') {
                Swal.fire({
                    title: 'Datos Actualizados!',
                    icon: 'success',
                    timer: 1500,
                    timerProgressBar: true,
                    showCancelButton: false,
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    padding: '2rem',
                    width: '25%',
                    onBeforeOpen: () => {
                        timerInterval = setInterval(() => {

                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {

                    if (result.dismiss === Swal.DismissReason.timer) {
                        console.log('I was closed by the timer');
                        window.location = `ConfiguracionUser?menu=ConfiguracionU&accion=Listar`;
                    }
                });

            } else if (out === 'false') {
                mensajeError1('los datos de la persona no se puedo actualizar!');
            } else {
                $('#alert').text('mierda error').addClass('alert alert-danger');
            }
        });
    }
}
function actilizarusconfig() {
    Usuario = document.getElementById('btnGuardarUs').value;
    NombreUs = document.getElementById('NombreUs').value;
    EmailUs = document.getElementById('EmailUs').value;


    var arrayinputs = ["#NombreUs", "#EmailUs"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }

    if (NombreUs === null || NombreUs === '') {
        mensajeError1('Por favor complete el campo Nombre de usuario', '#NombreUs');
    } else if (EmailUs === null || EmailUs === '') {
        mensajeError1('Por favor complete el campo de correo electrónico', '#EmailUs');
    } else if (validarEmail(EmailUs) === false) {
        mensajeError1('Por favor ingrese un correo electrónico valido', '#EmailUs');
    } else {

        var arrayinputs = ["#NombreUs", "#EmailUs"];


        for (var i = 0; i < arrayinputs.length; i++) {
            $(arrayinputs[i]).removeClass('is-invalid').addClass('is-valid');
        }

        $.post("ConfiguracionUser?menu=ConfiguracionUser&accion=ActilizarUsConfig", {id: Usuario, txtNombreUs: NombreUs, txtEmailUs: EmailUs}, function (out) {
            if (out === 'true') {

                Swal.fire({
                    title: 'Usuario Actualizado!',
                    icon: 'success',
                    timer: 1500,
                    timerProgressBar: true,
                    showCancelButton: false,
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    padding: '2rem',
                    width: '25%',
                    onBeforeOpen: () => {
                        timerInterval = setInterval(() => {

                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {

                    if (result.dismiss === Swal.DismissReason.timer) {
                        console.log('I was closed by the timer');
                        window.location = `ConfiguracionUser?menu=ConfiguracionU&accion=Listar`;
                    }
                });
            } else if (out === 'false') {
                mensajeError1('El usuario o correo no se pueden actualizar por que ya existen!','#NombreUs','#EmailUs');
            } else {
                $('#alert').text('mierda error').addClass('alert alert-danger');
            }
        });
    }
}
function actualizarcontrasena() {
    Usuario = document.getElementById('btnGuardarUs').value;
    ContrasenaAnterior = document.getElementById('ContrasenaAnterior').value;
    NuevaContrasena = document.getElementById('NuevaContrasena').value;
    NuevaContrasena2 = document.getElementById('NuevaContrasena2').value;

    var arrayinputs = ["#ContrasenaAnterior", "#NuevaContrasena", "#NuevaContrasena2"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }


    if (ContrasenaAnterior === null || ContrasenaAnterior === '') {
        mensajeError1('Por favor complete el campo contraseña anterior', '#ContrasenaAnterior');
    } else if (NuevaContrasena === null || NuevaContrasena === '') {
        mensajeError1('Por favor Complete el campo nueva contraseña', '#NuevaContrasena');
    } else if (NuevaContrasena2 === null || NuevaContrasena2 === '') {
        mensajeError1('Por favor Complete el campo nueva contraseña', '#NuevaContrasena2');
    } else if (NuevaContrasena !== NuevaContrasena2) {
        mensajeError1('Las contraseñas nuevas no coinciden!', '#NuevaContrasena', '#NuevaContrasena2');
    } else {

        var arrayinputs = ["#ContrasenaAnterior", "#NuevaContrasena", "#NuevaContrasena2"];

        for (var i = 0; i < arrayinputs.length; i++) {
            $(arrayinputs[i]).removeClass('is-invalid').addClass('is-valid');
        }

        $.post("ConfiguracionUser?menu=ConfiguracionUser&accion=ActulizarContrasena", {id: Usuario, ContrasenaAnterior: ContrasenaAnterior, NuevaContrasena: NuevaContrasena, NuevaContrasena2: NuevaContrasena2}, function (out) {
            if (out === 'true') {
                Swal.fire({
                    title: 'Actualizando contraseña!',
                    icon: 'success',
                    timer: 1500,
                    timerProgressBar: true,
                    showCancelButton: false,
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    padding: '2rem',
                    width: '25%',
                    onBeforeOpen: () => {
                        timerInterval = setInterval(() => {

                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {

                    if (result.dismiss === Swal.DismissReason.timer) {
                        console.log('I was closed by the timer');
                        window.location = `ConfiguracionUser?menu=ConfiguracionU&accion=Listar`;
                    }
                });

            } else if (out === 'false') {
                mensajeError1('La contraseña no se puedo actualizar!', '#ContrasenaAnterior');
            } else {
                $('#alert').text('mierda error').addClass('alert alert-danger');
            }
        });
    }
}


function InsertarUsuario() {
    NumDocumento = document.getElementById('txtNumDoc').value;
    PrimerNombre = document.getElementById('txtPrimerNombre').value;
    PrimerApellido = document.getElementById('txtPrimerApellido').value;
    Celular = document.getElementById('txtCelular').value;
    NombreUsuario = document.getElementById('txtUsuario').value;
    Email = document.getElementById('txtEmail').value;
    Contrasena = document.getElementById('txtContrsena').value;
    Contrasena2 = document.getElementById('txtContrsena2').value;

    var arrayinputs = ["#txtNumDoc", "#txtPrimerNombre", "#txtPrimerApellido", "#txtCelular", "#txtEmail", "#txtContrsena", "#txtContrsena2"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }

    if (NumDocumento === null || NumDocumento === '') {
        mensajeErrorRegistro('Por favor complete el campo n&uacute;mero de documento', '#txtNumDoc');
    } else if (validarNumero(NumDocumento) === false) {
        mensajeErrorRegistro('Por favor ingrese solo n&uacute;meros, campo n&uacute;mero de documento', '#txtNumDoc');
    } else if (PrimerNombre === null || PrimerNombre === '') {
        mensajeErrorRegistro('Por favor comple el campo primer nombre', '#txtPrimerNombre');
    } else if (validarLetras(PrimerNombre) === false) {
        mensajeErrorRegistro('Por favor ingrese solo letras campo, primer nombre', '#txtPrimerNombre');
    } else if (PrimerApellido === null || PrimerApellido === '') {
        mensajeErrorRegistro('Por favor comple el campo primer apellido', '#txtPrimerApellido');
    } else if (validarLetras(PrimerApellido) === false) {
        mensajeErrorRegistro('Por favor ingrese solo letras campo, primer apellido', '#txtPrimerApellido');
    } else if (Celular === null || Celular === '') {
        mensajeErrorRegistro('Por favor complete el campo celular', '#txtCelular');
    } else if (validarNumero(Celular) === false) {
        mensajeErrorRegistro('Por favor ingrese solo n&uacute;meros, campo celular', '#txtCelular');
    } else if (Email === null || Email === '') {
        mensajeErrorRegistro('Por favor comple el campo Email', '#txtEmail');
    } else if (validarEmail(Email) === false) {
        mensajeErrorRegistro('Por favor ingrese un correo valido', '#txtEmail');
    } else if (Contrasena === null || Contrasena === '') {
        mensajeErrorRegistro('Por favor complete el campo contrase&ntilde;a ', '#txtContrsena');
    } else if (Contrasena2 === null || Contrasena2 === '') {
        mensajeErrorRegistro('Por favor complete el campo contrase&ntilde;a', '#txtContrsena2');
    } else if (Contrasena !== Contrasena2) {
        mensajeErrorRegistro('Las contrase&ntilde;as no coinciden!', '#txtContrsena', '#txtContrsena2');
    } else {

        var arrayinputs = ["#txtNumDoc", "#txtPrimerNombre", "#txtPrimerApellido", "#txtCelular", "#txtEmail", "#txtContrsena", "#txtContrsena2"];

        for (var i = 0; i < arrayinputs.length; i++) {
            $(arrayinputs[i]).removeClass('is-invalid').addClass('is-valid');
        }
//
        $.post("InsertarUsuario?accion=Insertar", {txtNumDoc: NumDocumento, txtPrimerNombre: PrimerNombre, txtPrimerApellido: PrimerApellido, txtCelular: Celular, txtUsuario: NombreUsuario, txtEmail: Email, txtContrsena: Contrasena, txtContrsena2: Contrasena2}, function (out) {
            if (out === 'true') {
                Swal.fire({
                    title: 'Registro exitoso!',
                    icon: 'success',
                    timer: 2000,
                    showCancelButton: false,
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    toast: true,
                    position: 'top-start',
                    onBeforeOpen: () => {
                        timerInterval = setInterval(() => {

                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {

                    if (result.dismiss === Swal.DismissReason.timer) {
                        
                        location.href = "login.jsp";
                    }
                });


            } else if (out === 'false') {
                mensajeErrorRegistro('No se pudo registrar compruebe que el documento o correo no existan');
            } else {
                $('#alert').text('mierda error').addClass('alert alert-danger');
            }
        });
    }
}
function mensajeError1(mensaje, caja, caja2) {
    Swal.fire({
        position: 'center',
        icon: 'error',
        title: 'Datos invalidos!',
        html: '<h5 style="color:#f27474;">' + mensaje + '</h5>',
        showCancelButton: false,
        showConfirmButton: false,
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        padding: '2rem',
        width: '25%',
        timer: 2000

    });
    $(caja).removeClass('border-success is-valid').addClass('is-invalid');
    $(caja2).removeClass('border-success is-valid').addClass('is-invalid');
}

function mensajeErrorRegistro(mensaje1, caja3, caja4) {
    Swal.fire({
        position: 'center',
        icon: 'error',
        title: 'Datos invalidos!',
        html: '<h5 style="color:#f27474;">' + mensaje1 + '</h5>',
        showCancelButton: false,
        showConfirmButton: false,
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        toast: true,
        position: 'top-start',
        timer: 2000
    });
    $(caja3).removeClass('border-success is-valid').addClass('is-invalid');
    $(caja4).removeClass('border-success is-valid').addClass('is-invalid');
}