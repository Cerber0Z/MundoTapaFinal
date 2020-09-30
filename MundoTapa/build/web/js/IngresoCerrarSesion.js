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
function IniciarSesionUsuario() {

    CorreoOnombreus = document.getElementById('txtcorreo').value;
    Contrasena = document.getElementById('txtpass').value;
//
    $.post("IngresaUsuario?accion=Ingresar", {txtcorreo: CorreoOnombreus, txtpass: Contrasena}, function (out) {

        if (out === 'one') {
            inicioCorrecto(out);
        } else if (out === 'two') {
            inicioCorrecto(out);
        } else if ('false') {
            invalido();
        } else {
            $('#alert').text('mierda error').addClass('alert alert-danger');
        }
    });
}


function inicioCorrecto(prm) {
    $('#alert').text('Usuario Correcto').addClass('alert alert-success"');
    Swal.fire({
        title: 'Inicio de sesion correcto!',
        icon: 'success',
        timer: 1400,
        showCancelButton: false,
        showConfirmButton: false,
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        toast: true,
        position: 'bottom',
        onBeforeOpen: () => {
            timerInterval = setInterval(() => {

            }, 100)
        },
        onClose: () => {
            clearInterval(timerInterval)
        }
    }).then((result) => {

        if (result.dismiss === Swal.DismissReason.timer) {
            switch (prm) {
                case "one":

                    window.location = `calendarioAdmin?accion=Listar`;
                    break;
                case "two":

                    window.location = `Usuarios?menu=SolicitudAU&accion=SolicitudAU`;
                    break;
            }
        }
    });
}

function invalido() {
    $('#alert').text('Usuario Incorrecto').addClass('alert alert-danger');
    Swal.fire({
        position: 'center',
        icon: 'error',
        title: 'Usuario o contraseña incorrecto!',
        showCancelButton: false,
        showConfirmButton: false,
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        toast: true,
        position: 'bottom',
        timer: 1400
    });
}

function CerrarSessionUsuario() {

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
    })

    swalWithBootstrapButtons.fire({
        title: 'Estas seguro de cerrar sesion?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Si, Cerrar sesion',
        cancelButtonText: 'No, Cancelar!',
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        reverseButtons: true,
        position: 'center'
    }).then((result) => {
        if (result.value) {
            swalWithBootstrapButtons.fire(
                    $.post("IngresaUsuario?accion=CerrarSesion", function (out) {
                        window.location = `http://localhost:8080/MundoTapa/`;
                    }),
                    )
        } else if (
                /* Read more about handling dismissals below */
                result.dismiss === Swal.DismissReason.cancel
                ) {

        }
    });
}



function recoveryPass()
{
    txtcorreo = document.getElementById('txtcorreo').value;
    if (txtcorreo === null || txtcorreo === '') {
        mensajeError('Por favor ingrese su correo', '#txtcorreo');
    } else if (validarEmail(txtcorreo) === false) {
        mensajeError('Por favor ingrese un correo valido', '#txtcorreo');
    } else {
        $.post("IngresaUsuario?accion=confirmar", {correo: txtcorreo}, function (out) {
            console.log(out);
            if (out === 'true') {
                Swal.fire({
                    title: 'Se envio un codigo a su correo!',
                    icon: 'success',
                    timer: 1800,
                    showCancelButton: false,
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    toast: true,
                    position: 'bottom',
                    onBeforeOpen: () => {
                        timerInterval = setInterval(() => {

                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {

                    setTimeout("location.href='codigoderecuperacion.jsp'", 500);

                });


            } else {
                mensajeError('El correo ingresado no existe', '#txtcorreo');
            }
        });
    }

}


function confirmaCodigo() {
    codigo = document.getElementById('txtcodigo').value;
    if (codigo < 1) {
        mensajeError('Por favor ingrese el codigo de seguridad', '#txtcodigo');
    } else if (validarNumero(codigo) === false) {
        mensajeError('Ingresa un codigo valido', '#txtcodigo');
    } else {
        $.post("IngresaUsuario?accion=confirmarcodigo", {codigo: codigo}, function (out) {
            console.log(out);
            if (out === 'true') {
                setTimeout("location.href='actualizarclave.jsp'", 500);
            } else if (out === 'false') {
                mensajeError('Ingresa un codigo valido', '#txtcodigo');
            }
        });
    }
}

function updatepassword() {
    clave = document.getElementById('txtNcontraseña').value;
    pass = document.getElementById('txtNcontraseña2').value;
    if (clave != pass) {
        mensajeError('Las contraseñas no coinciden', '#txtNcontraseña');
    } else if (clave === null || clave === '') {
        mensajeError('Por favor ingrese una contraseña', '#txtNcontraseña');
    } else if (pass === null || pass === '') {
        mensajeError('Por favor ingrese una contraseña', '#txtNcontraseña2');
    } else {
        $.post("IngresaUsuario?accion=actualizarpass", {contraseña: pass}, function (out) {
            console.log(out);
            if (out === 'true') {
                Swal.fire({
                    title: 'La contraseña se actulizo correctamente!',
                    icon: 'success',
                    timer: 1800,
                    showCancelButton: false,
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    toast: true,
                    position: 'bottom',
                    onBeforeOpen: () => {
                        timerInterval = setInterval(() => {

                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {

                    setTimeout("location.href='index.jsp'");

                });
            } else if (out === 'false') {
                mensajeError('Las contraseñas no coinciden', '#txtcodigo');
            } else if (out === 'campos') {
                mensajeError('Las contraseñas no coinciden', '#txtcodigo');
            }
        });
    }

}

function mensajeError(mensaje, caja) {
    Swal.fire({

        position: 'center',
        icon: 'error',
        title: '<h4 style="color:#f27474;">' + mensaje + '</h4>',
        showCancelButton: false,
        showConfirmButton: false,
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        toast: true,
        position: 'bottom',
        timer: 1800

    });
    $(caja).removeClass('border-success is-valid').addClass('is-invalid');
}

