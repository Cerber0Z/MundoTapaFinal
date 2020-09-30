/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function enviarCorreo(recoleccion) {


    mensaje('Enviando Correo','info',2500,true);
    $.post("Certificacion?accion=EnviarCorreo", {recoleccion: recoleccion}, function (out) {
        if (out === 'true') {
            mensaje('Correo enviado correctamente','success',1600,false);
        } else if (out === 'false') {
            $('#mensaje').text('Su correo no se logro enviar').addClass('alert alert-danger');
        } else {
            $('#mensaje').text('No se envio el correo electronico').addClass('alert alert-danger');
        }
    });
}

function mensaje(mensaje , estado,time,bar) {
    Swal.fire({
        title: mensaje,
        icon: estado,
        timer: time,
        timerProgressBar: bar,
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
    });
}

