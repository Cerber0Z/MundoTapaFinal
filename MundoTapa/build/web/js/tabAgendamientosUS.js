

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

function InsertAgendamietoUS() {

    var fileInput = document.getElementById('validatedCustomFile');
    var filePath = fileInput.value;

    var allowedExtensions = /(.jpg|.png)$/i;

    Nombredellugar = document.getElementById('Nombredellugar').value;
    Direccion = document.getElementById('Direccion').value;
    Telefono = document.getElementById('Telefono').value;
    Celular = document.getElementById('Celular').value;
    localidad = document.getElementById('localidad').value;
    Descripcion = document.getElementById('Descripcion').value;
    validatedCustomFile = document.getElementById('validatedCustomFile').value;
    material = document.getElementById('material').value;

    var fa = new Date();
    fa.setHours(0, 0, 0, 0);


    var arrayinputs = ["#Nombredellugar", "#Direccion", "#Telefono", "#Celular", "#localidad", "#validatedCustomFile", "#material"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }

//    var arrayinputss = ["#FechaSolicitud", "#HoraSolicitud"];

//    for (var i = 0; i < arrayinputss.length; i++) {
//        $(arrayinputss[i]).removeClass('is-invalid');
//    }

//    dtsolicitud = new Date(FechaSolicitud);
//    dtsolicitud.setDate(dtsolicitud.getDate() + 1);
//    dtsolicitud.setHours(0, 0, 0, 0);

    if (Nombredellugar === null || Nombredellugar === '') {
        mensaje('Por favor complete el campo edificio/apartamento/conjunto', '#Nombredellugar');
        $('#Nombredellugar').removeClass('is-valid').addClass('is-invalid');
    } else if (Direccion === '' || Direccion === null) {
        mensaje('Por favor complete el campo dirección', '#Direccion');
    } else if (validarNumero(Telefono) === false) {
        mensaje('Por favor ingrese solo números', '#Telefono');
    } else if (Telefono === null || Telefono === '') {
        mensajeError('Por favor complete el campo teléfono', '#Telefono');
    } else if (Celular === '' || Celular === null) {
        mensaje('Por favor complete el campo celular', '#Celular');
    } else if (validarNumero(Celular) === false) {
        mensaje('Por favor ingrese solo números', '#Celular');
    } else if (Celular === '0') {
        mensaje('Ingrese un número valido', '#Celular');
//    } else if (FechaSolicitud === '') {
//        mensaje('Ingrese la fecha de la solicitud', '#FechaSolicitud');
    } else if (localidad === '0') {
        mensaje('Selecione una localidad', '#localidad');

//    } else if (dtsolicitud < fa) {
//        mensaje('Fecha de solicitud invalida', '#FechaSolicitud');
//    } else if (HoraSolicitud === '') {
//        mensaje('Ingrese la hora de la solicitud', '#HoraSolicitud');
//    } else if (HoraSolicitud < '08:00:00' || HoraSolicitud > '18:00:00') {
//        mensaje('Hora no disponible', '#HoraSolicitud');
    } else if (!allowedExtensions.exec(filePath)) {
        mensaje('El formato de la extension debe ser jpg o png', '#validatedCustomFile');
    } else if (material === '0') {
        mensaje('Por favor selecione el material correspondiente', '#material');
    } else {

        var arrayinputs = ["#Nombredellugar", "#Direccion", "#Telefono", "#Celular", "#localidad", "#Descripcion", "#validatedCustomFile", "#material"];

        for (var i = 0; i < arrayinputs.length; i++) {
            $(arrayinputs[i]).removeClass('is-invalid').addClass('is-valid');
        }

//        var arrayinputss = ["#FechaSolicitud", "#HoraSolicitud"];

//        for (var i = 0; i < arrayinputss.length; i++) {
//            $(arrayinputss[i]).removeClass('is-invalid').addClass('border-success');
//        }

        $('#lblcarga').text('').removeClass('alert alert-danger');

        nombrefile = document.getElementById('validatedCustomFile').value;

        var data = new FormData();
        jQuery.each(jQuery('#validatedCustomFile')[0].files, function (i, file) {
            data.append('validatedCustomFile-' + i, file);
        });

        jQuery.ajax({
            url: 'SolicitudDeAgendamiento?accion=Subirfoto',
            data: data,
            //cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST', // For jQuery < 1.9
            success: function (rs) {
                if (rs === 'true') {
                    $.post("SolicitudDeAgendamiento?accion=InsertAgendamientoUS", {Nombredellugar: Nombredellugar, Direccion: Direccion, Telefono: Telefono, Celular: Celular, localidad: localidad, Descripcion: Descripcion, validatedCustomFile: validatedCustomFile, material: material}, function (out) {
                        console.log(out);
                        if (out === 'true') {
                            Swal.fire({
                                title: 'Se agendo su solicitud!',
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
                                    window.location = `Usuarios?menu=SolicitudAU&accion=SolicitudAU`;
                                }
                            });
                        } else if (out === 'false') {

                            mensaje('No se pudo agendar su solicitud!');

                        } else if (out === 'campos') {
                            mensaje('Ingrese los campos completos');
                        }
                    });
                }
            }
        });

    }
}

function mensaje(mensaje, caja) {
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
        timer: 1800

    });
    $(caja).removeClass('border-success is-valid').addClass('is-invalid');

}

function verSolicitud(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion, materialR) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");
    $('#hdsoliciutd').val(solicitud);

    $('#img').empty();

    $('#codigo').text(solicitud);
    $('#nombre').text(prinombre);
    $('#apellido').text(priapellido);
    $('#cedula').text(cedula);
    $('#correo').text(correo);
    $('#localidads').text(localidad);
    $('#nombrelugar').text(nombrelugar);
    $('#direccion').text(direccion);
    $('#telefono').text(telefono);
    $('#celular').text(celular);
    $('#descrip').text(descrip);
    $('#materialesR').text(materialR);
    para.innerHTML = `<img src='Fotosdonativos/${imagen}' style='width:444px' >`;
    document.getElementById("img").appendChild(para);
    $('#modalinfo').modal()
    var modalinformacion = $('#modalinfo');
    modalinformacion.modal('show');
}
function verSolicitudCancelada2(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion, razon, materialR) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");
    $('#hdsoliciutd').val(solicitud);

    $('#img2').empty();

    $('#codigo2').text(solicitud);
    $('#nombre2').text(prinombre);
    $('#apellido2').text(priapellido);
    $('#cedula2').text(cedula);
    $('#correo2').text(correo);
    $('#localidads2').text(localidad);
    $('#nombrelugar2').text(nombrelugar);
    $('#direccion2').text(direccion);
    $('#telefono2').text(telefono);
    $('#celular2').text(celular);
    $('#descrip2').text(descrip);
    $('#razoncancelacion2').text(razon);
    $('#materialesR2').text(materialR);
    para.innerHTML = `<img src='Fotosdonativos/${imagen}' style='width:444px' >`;
    document.getElementById("img2").appendChild(para);
    $('#modalcancelado').modal()
    var modalinformacion = $('#modalcancelado');
    modalinformacion.modal('show');
}


function verSolicitudAgendad(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion, materialR, fecharecogida) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");
    $('#hdsoliciutd').val(solicitud);

    $('#img4').empty();
    $('#codigo4').text(solicitud);
    $('#nombre4').text(prinombre);
    $('#apellido4').text(priapellido);
    $('#cedula4').text(cedula);
    $('#correo4').text(correo);
    $('#localidad4').text(localidad);
    $('#nombrelugar4').text(nombrelugar);
    $('#direccion4').text(direccion);
    $('#telefono4').text(telefono);
    $('#celular4').text(celular);
    $('#descrip4').text(descrip);
    $('#material4').text(materialR);
    $('#fecharecogida4').text(fecharecogida);

    para.innerHTML = `<img src='Fotosdonativos/${imagen}' style='width:444px' >`;
    document.getElementById("img4").appendChild(para);
    $('#modalagendamitoUS').modal()
    var modalinformacion = $('#modalagendamitoUS');
    modalinformacion.modal('show');
}

function agregaragendamiento() {
    var modalAgregarsolicitud = $('#modalAgregarsolicitud');
    modalAgregarsolicitud.modal('show');
}


function EliminarSolicitud(solicitud,idestado) {
    $('#hdsoliciutd').val(solicitud);
    $('#idEstado').val(idestado);
  
    
    Swal.fire({
        title: 'Estas seguro de eliminar esta solicitud?',
        text: "¡No podrás revertir esto!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, Eliminar!'
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                title: '¡Eliminado!',
                text: "Su solicitud ha sido eliminado",
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
                    $.post("SolicitudDeAgendamiento?accion=EliminarSolicitudUs", {solicitud: solicitud , idestado: idestado}, function (out) {

                        window.location = `Usuarios?menu=SolicitudAU&accion=SolicitudAU`;

                    });
                }
            });
        }
    })
}


