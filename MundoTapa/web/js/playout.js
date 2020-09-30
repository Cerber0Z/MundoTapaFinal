/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function verSolicitud(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion, material) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");
    $('#hdsoliciutd').val(solicitud);
    $('#hdnombre').val(localidad);
    $('#hdcec').val(cedula);

    $('#img').empty();

    $('#material').text(material);
    $('#codigo').text(solicitud);
    $('#nombre').text(prinombre);
    $('#apellido').text(priapellido);
    $('#cedula').text(cedula);
    $('#correo').text(correo);
    $('#localidad').text(localidad);
    $('#nombrelugar').text(nombrelugar);
    $('#direccion').text(direccion);
    $('#telefono').text(telefono);
    $('#celular').text(celular);
    $('#descrip').text(descrip);
    para.innerHTML = `<img src='Fotosdonativos/${imagen}' style='width:444px;height: 30vh;margin-top:-6%' >`;
    document.getElementById("img").appendChild(para);
    $('#modalinfo').modal()
    var modalinformacion = $('#modalinfo');
    modalinformacion.modal('show');
}


function verSolicitudCompletadaAdmin(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion, material, idReolceccion, FechaRecolecion, Recolector, CantidadKG, NombreTrasportadora) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");

    $('#img2').empty();

    $('#codigo2').text(solicitud);
    $('#nombre2').text(prinombre);
    $('#apellido2').text(priapellido);
    $('#cedula2').text(cedula);
    $('#correo2').text(correo);
    $('#localidad2').text(localidad);
    $('#nombrelugar2').text(nombrelugar);
    $('#direccion2').text(direccion);
    $('#telefono2').text(telefono);
    $('#celular2').text(celular);
    $('#descrip2').text(descrip);
    $('#material2').text(material);
    $('#idrecolecion2').text(idReolceccion);
    $('#FechaRecolecion2').text(FechaRecolecion);
    $('#NombreRecoletor2').text(Recolector);
    $('#cantidadkg2').text(CantidadKG);
    $('#nombretrasportadora2').text(NombreTrasportadora);



    para.innerHTML = `<img id='imgsolicitud' src='Fotosdonativos/${imagen}' style='width:48vh; height: 28vh;' >`;
    document.getElementById("img2").appendChild(para);
    $('#modalcompletado').modal()
    var modalinformacion = $('#modalcompletado');
    modalinformacion.modal('show');
}

function verSolicitudCompletada2(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion, material, FechaRecolecion) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");

    $('#img22').empty();

    $('#codigo22').text(solicitud);
    $('#nombre22').text(prinombre);
    $('#apellido22').text(priapellido);
    $('#cedula22').text(cedula);
    $('#correo22').text(correo);
    $('#localidad22').text(localidad);
    $('#nombrelugar22').text(nombrelugar);
    $('#direccion22').text(direccion);
    $('#telefono22').text(telefono);
    $('#celular22').text(celular);
    $('#descrip22').text(descrip);
    $('#material22').text(material);
    $('#FechaRecolecion22').text(FechaRecolecion);



    para.innerHTML = `<img id='imgsolicitud' src='Fotosdonativos/${imagen}' style='width:444px' >`;
    document.getElementById("img22").appendChild(para);
    $('#modalcompletado2').modal()
    var modalinformacion = $('#modalcompletado2');
    modalinformacion.modal('show');
}

function DesaprobarSolicitudRazon() {
    solicitud = document.getElementById('hdsoliciutd').value;
    $('#codigoC').text(solicitud);
    $('#modalrazon').modal({backdrop: 'static', keyboard: false})
    var modalinformacion = $('#modalrazon');
    modalinformacion.modal('show');
}
function verSolicitudCancelada(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion, razon, material) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");

    $('#img3').empty();


    $('#codigo3').text(solicitud);
    $('#nombre3').text(prinombre);
    $('#apellido3').text(priapellido);
    $('#cedula3').text(cedula);
    $('#correo3').text(correo);
    $('#localidad3').text(localidad);
    $('#nombrelugar3').text(nombrelugar);
    $('#direccion3').text(direccion);
    $('#telefono3').text(telefono);
    $('#celular3').text(celular);
    $('#descrip3').text(descrip);
    $('#razoncancelacion').text(razon);
    $('#material3').text(material);



    para.innerHTML = `<img id='imgsolicitud' src='Fotosdonativos/${imagen}' style='width:444px;height: 35vh;' >`;
    document.getElementById("img3").appendChild(para);
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


function DesaprobarSolicitudRazon2() {

    solicitud = document.getElementById('hdsoliciutd').value;
    console.log(solicitud);
    razontext = document.getElementById('razontext').value;

    console.log(idUsuario);
    var arrayinputs = ["#razontext"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }
    if (razontext === null || razontext === '') {
        mensajeError('Por favor escriba la razón por la cual desapruebas la solicitud', '#razontext');
    } else {
        $.post("totalsolicitudes?accion=desaprobarsolicitud", {id: solicitud, razontext: razontext, array2: array_solicitudes}, function (out) {
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
                        window.location = `totalsolicitudes?accion=totalsolicitudes`;
                    }
                });
            } else if (out === 'false') {
                mensajeError('No se puedo desaprobar esta solicitud.');
            } else {
                $('#alert').text('mierda error').addClass('alert alert-danger');
            }
        });
    }
}

function agregarFila() {

    var modalinformacion = $('#modalinfo');
    modalinformacion.modal('hide');

    soli = document.getElementById('btnaprobar').value;
    document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td>gfdg</td> gfgd <td>gfdg</td> <td>dsd</td> <td> <input id=idsol type=hidden value=' + soli + ' > </td> ';
}

function enviar() {
    s = document.getElementById('idsol').value;
    console.log(s)
    console.log('___________________');


    for (var i = 0; i < 10; i++) {
        console.log(s[i]);
    }
}

function mensajeError(mensaje, caja) {
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


var array_solicitudes = [];

contador = 0;
function crearSolicitudes() {
    contador++;
    solicitud = document.getElementById('hdsoliciutd').value;
    array_solicitudes.push(solicitud);
    localidad = document.getElementById('hdnombre').value;
    cedula = document.getElementById('hdcec').value;
    var modalinfo = $('#modalinfo');
    modalinfo.modal('hide');
    $('#tr' + solicitud + 'tr').addClass('invisible');

    document.getElementById('listsolicitudes').innerHTML += "<div  id='list" + contador + "' > <div  class='btn list-group-itemobjetos list-group-item-action text-gray-600  mb-1'" +
            "data-toggle='list' style='background-color: white; border-color: #e3e6f0;'><div>" + "<b>#</b>" + solicitud + "<b style='color:white'>......</b>" + localidad +
            "<button type='button' class='btn  text-danger btn-circle float-right ml-1' title='Eliminar de la lista' onclick='eliminarSolicitud(" + solicitud + ")' style='height: 1.5rem !important;'><i class='fa fa-times'></i></button>" +
            "</div> </div></div> ";

    openLista();

}


function eliminarSolicitud(solicitud) {
    $('#tr' + solicitud + 'tr').removeClass('invisible');
    $('#list' + contador).empty();

    var indice = array_solicitudes.indexOf(solicitud);
    array_solicitudes.splice(indice, 1);
}

function agregarSolicitud() {

    fechaagendada = document.getElementById('fechaagendada').value;

    var fechahoy = new Date();
    var fechaingresada = new Date(fechaagendada);
    
    var arrayinputs = ["#fechaagendada"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }
    if (fechaagendada === null || fechaagendada === '') {
        mensajeError('Por favor ingrese una fecha para poder agendar las solicitudes', '#fechaagendada');
    } else if (fechaingresada < fechahoy) {
        mensajeError('Por favor ingrese una fecha valida para poder agendar las solicitudes', '#fechaagendada');
    } else {
        $.post("totalsolicitudes?accion=aprobarsolicitud", {array: array_solicitudes, fechaagendada: fechaagendada}, function (out) {
            if (out === 'true') {
                Swal.fire({
                    title: 'Solicitudes actulizadas!',
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
                        window.location = `totalsolicitudes?accion=totalsolicitudes`;
                    }
                });

            } else {
                console.log('Error');
            }
        });

    }



}

!function (t) {
    "use strict";
    t("#sidebarToggle, #sidebarToggleTop").on("click", function (o) {
        t("body").toggleClass("sidebar-toggled"), t(".sidebar").toggleClass("toggled"), t(".sidebar").hasClass("toggled") && t(".sidebar .collapse").collapse("hide")
    }), t(window).resize(function () {
        t(window).width() < 768 && t(".sidebar .collapse").collapse("hide")
    }), t("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel", function (o) {
        if (768 < t(window).width()) {
            var e = o.originalEvent, l = e.wheelDelta || -e.detail;
            this.scrollTop += 30 * (l < 0 ? 1 : -1), o.preventDefault()
        }
    }), t(document).on("scroll", function () {
        100 < t(this).scrollTop() ? t(".scroll-to-top").fadeIn() : t(".scroll-to-top").fadeOut()
    }), t(document).on("click", "a.scroll-to-top", function (o) {
        var e = t(this);
        t("html, body").stop().animate({scrollTop: t(e.attr("href")).offset().top}, 1e3, "easeInOutExpo"), o.preventDefault()
    })
};//(jQuery)

function openLista() {
    document.getElementById("mySidenav").style.width = "16.3333%";


}

function closeLista() {
    document.getElementById("mySidenav").style.width = "0";

}

function  Solicitudagendada() {

    $('#modalagendamiento').modal()
    var modalinformacion = $('#modalagendamiento');
    modalinformacion.modal('show');
}




