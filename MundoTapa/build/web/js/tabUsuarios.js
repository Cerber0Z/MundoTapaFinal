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

$(document).ready(function () {
    $('ul.tabs button a:first').addClass('active');
    $('.secciones article').hide();
    $('.secciones article:first').show();
    $('ul.tabs button a').click(function () {
        $('ul.tabs button a').removeClass('active');
        $(this).addClass('active');
        $('.secciones article').hide();
        var activeTab = $(this).attr('href');
        $(activeTab).show();
        return false;
    });
});
function editarpersona(id, usuario, email, bloqueado, rol) {
    $('#btnActlizar').val(id);
    $('#nombreus').val(usuario);
    $('#emailus').val(email);
    $('#opcion').text(bloqueado);
    if (bloqueado === 'si') {
        document.getElementById('opcion').checked = true;
    } else {
        document.getElementById('opcion').checked = false;
    }

    var $modaleditar = $('#modaleditar');
    $modaleditar.modal('show');
}

function actualizardatos() {
    usuario = document.getElementById('btnActlizar').value;
    nombre = document.getElementById('nombreus').value;
    emailus = document.getElementById('emailus').value;
    Bloqueado1 = document.getElementById('opcion').value;
    Rolus = document.getElementById('Rol').value;
//
    var arrayinputs = ["#nombreus", "#emailus", "#Rol"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }

    if (nombre === null || nombre === '') {
        mensajesdeErrors('Por favor complete el campo de nombre usuario', "#nombreus");
    } else if (emailus === null || emailus === '') {
        mensajesdeErrors('Por favor complete el campo de correo electrónico', "#emailus");
    } else if (validarEmail(emailus) === false) {
        mensajesdeErrors('Por favor ingrese un correo electrónico valido', "#emailus");
    } else if (Rolus === null || Rolus === '' || Rolus === '0') {
        mensajesdeErrors('Por favor ingrese un rol valido', '#Rol');
    } else {

        var arrayinputs = ["#nombreus", "#emailus", "#Rol"];
        for (var i = 0; i < arrayinputs.length; i++) {
            $(arrayinputs[i]).removeClass('is-invalid').addClass('is-valid');
        }
        if ($('#opcion').prop('checked')) {
            Bloqueado1 = 'si';
        } else {
            Bloqueado1 = 'no';
        }
        $.post("Usuarios?accion=Actualizar", {id: usuario, txtNombreus: nombre, txtEmailus: emailus, txtbloqueado: Bloqueado1, SltRol: Rolus}, function (out) {
            if (out === 'true') {
                Swal.fire({
                    title: 'Datos actulizados!',
                    icon: 'success',
                    timer: 1500,
                    timerProgressBar: true,
                    showCancelButton: false,
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    position: 'center',
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
                        window.location = `Usuarios?menu=Usuarios&accion=Listar`;
                    }
                });
            } else if (out === 'false') {
                mensajeErrorRegistros("El nombre de usuario o correo ya excite.","#nombreus","#emailus");
            } else {
                $('#alert').text('mierda error').addClass('alert alert-danger');
            }
        });
    }
}

function agregarusuario() {

    NumDocumento = document.getElementById('NumDocumento').value;
    console.log(NumDocumento);
    PrimerNombre = document.getElementById('txtPrimerNombre').value;
    PrimerApellido = document.getElementById('txtPrimerApellido').value;
    CelularPerosna = document.getElementById('txtCelularPerosna').value;
    NombreUsuario = document.getElementById('txtUsuario').value;
    Email = document.getElementById('txtEmail').value;
    Bloqueado = document.getElementById('opcion2').value;
    Rol = document.getElementById('Roluss').value;
    //
    var arrayinputs = ["#NumDocumento", "#txtPrimerNombre", "#txtPrimerApellido", '#txtCelularPerosna', "#txtUsuario", "#txtEmail", "#Roluss"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }
    if (NumDocumento === null || NumDocumento === '') {
        mensajeError('Por favor ingrese número de documento valido', '#NumDocumento');
    } else if (validarNumero(NumDocumento) === false) {
        mensajeError('Por favor ingrese solo números', '#NumDocumento');
    } else if (PrimerNombre === null || PrimerNombre === '') {
        mensajeError('Por favor ingrese su primer nombre', '#txtPrimerNombre');
    } else if (validarLetras(PrimerNombre) === false) {
        mensajeError('Por favor ingrese solo letras', '#txtPrimerNombre');
    } else if (PrimerApellido === null || PrimerApellido === '') {
        mensajeError('Por favor ingrese su primer apellido', '#txtPrimerApellido');
    } else if (CelularPerosna === null || CelularPerosna === '') {
        mensajeError('Por favor ingrese un celular', '#txtCelularPerosna');
    } else if (validarNumero(CelularPerosna) === false) {
        mensajeError('Por favor ingrese solo numeros', '#txtCelularPerosna');
    } else if (validarLetras(PrimerApellido) === false) {
        mensajeError('Por favor ingrese solo letras', '#txtPrimerApellido');
    } else if (Email === null || Email === '') {
        mensajeError('Por favor ingrese un correo electrónico', '#txtUsuario');
    } else if (validarEmail(Email) === false) {
        mensajeError('Por favor ingrese un correo electrónico valido', '#txtEmail');
    } else if (Rol === null || Rol === '' || Rol === '0') {
        mensajeError('Por favor ingrese un rol valido', '#Roluss');
    } else {

        var arrayinputs = ["#NumDocumento", "#txtPrimerNombre", "#txtPrimerApellido",'#txtCelularPerosna', "#txtUsuario", "#txtEmail", "#Roluss"];

        for (var i = 0; i < arrayinputs.length; i++) {
            $(arrayinputs[i]).removeClass('is-invalid').addClass('is-valid');
        }

        if ($('#opcion2').prop('checked')) {
            Bloqueado = 'si';
        } else {
            Bloqueado = 'no';
        }

        $.post("Usuarios?accion=Agregar", {NumDocumento: NumDocumento, txtPrimerNombre: PrimerNombre, txtPrimerApellido: PrimerApellido,txtCelularPerosna:CelularPerosna,txtUsuario: NombreUsuario, txtEmail: Email, txtbloqueado2: Bloqueado, SltRols: Rol}, function (out) {


            if (out === 'true') {
                Swal.fire({
                    title: 'Usuario Agregado!',
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
                        window.location = `Afiliado?menu=Afiliado&accion=ListarAfiliados`;
                    }
                });
            } else if (out === 'false') {
                mensajeErrorRegistros('Datos inválidos compruebe que el documento o correo no existan <b> ' + NumDocumento + ' </b> '+' <b> '+ Email +' </b> ','#NumDocumento','#txtEmail');
                $('#NumDocumento').removeClass('border-success is-valid').addClass('is-invalid');
            }
        });
    }
}

function mensajesdeErrors(mensaje, caja) {
    Swal.fire({
        position: 'center',
        icon: 'error',
        title: 'Datos invalidos',
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

}

function mensajeErrorRegistros(mensaje1, caja3, caja4) {
    Swal.fire({
        position: 'center',
        icon: 'error',
        title: 'Datos invalidos',
        html: '<h5 style="color:#f27474;">' + mensaje1 + '</h5>',
        showCancelButton: false,
        showConfirmButton: false,
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        padding: '2rem',
        width: '25%',
        timer: 2000
    });
    $(caja3).removeClass('border-success is-valid').addClass('is-invalid');
    $(caja4).removeClass('border-success is-valid').addClass('is-invalid');
}

