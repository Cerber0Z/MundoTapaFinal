/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

function verSolicitud(usuario, prinombre, priapellido, solicitud, correo, localidad, descrip, imagen, telefono, celular, nombrelugar, cedula, estado, direccion,materialR,fecharecogida) {
    var myobj = document.getElementById("img");
    var para = document.createElement("P");
    $('#hdsoliciutd').val(solicitud);
    
    $('#img').empty();
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
    $('#material').text(materialR);
    $('#fecharecogida').text(fecharecogida);
    
    para.innerHTML = `<img src='Fotosdonativos/${imagen}' style='width:444px' >`;
    document.getElementById("img").appendChild(para);
    $('#modalinfo').modal()
    var modalinformacion = $('#modalinfo');
    modalinformacion.modal('show');
}

function cancelarsolicitudAgendad(solicitud){
    $('#hdsoliciutd').val(solicitud);
    $('#codigoC').text(solicitud);
    $('#modalrazon').modal({backdrop: 'static', keyboard: false})
    var modalinformacion = $('#modalrazon');
    modalinformacion.modal('show');
}

function DesaprobarSolicitudRazon2(){
    
    solicitud = document.getElementById('hdsoliciutd').value;
    console.log(solicitud);
    razontext = document.getElementById('razontext').value;

    var arrayinputs = ["#razontext"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }
    if (razontext === null || razontext === '') {
        mensajeError('Por favor escriba la razón por la cual desapruebas la solicitud', '#razontext');
    } else {
        $.post("totalsolicitudes?accion=desaprobarsolicitud", {id: solicitud, razontext: razontext}, function (out) {
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
                        window.location = `calendarioAdmin?accion=Listar`;
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