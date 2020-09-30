/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function consultar() {
    fechainicio = document.getElementById('fechainicio').value;
    fechafinal = document.getElementById('fechafinal').value;

    fi = new Date(fechainicio);
    ff = new Date(fechafinal);

    fi.setDate(fi.getDate() + 1);
    ff.setDate(ff.getDate() + 1);
    fi.setHours(0, 0, 0, 0);
    ff.setHours(0, 0, 0, 0);

    location.href = "Certificacion?accion=Consultar&fechainicio=" + fechainicio + "&fechafinal=" + fechafinal;
}


function reporteRecolecciones() {
    fechainicio = document.getElementById('fechainicio').value;
    fechafinal = document.getElementById('fechafinal').value;

    //if (fechainicio === '' && fechafinal === '') {
    //  $('#mensaje').text('Debe seleccionar las fechas para generar el reporte').addClass('alert alert-danger');
    // } else {
    location.href = "Certificacion?accion=Excel";
    //}

}

function fechaExcels() {

    $('#modalafechaexcel').modal()
    var modalinformacion = $('#modalafechaexcel');
    modalinformacion.modal('show');
}


function excelRecolecciones() {
    fechaexcel = document.getElementById('fechaexcel').value
     

    var fechahoy = new Date();
    var fechaingresada = new Date(fechaexcel);
    fechaingresada.setDate(fechaingresada.getDate() + 6);
    
    console.log(fechahoy);
    console.log(fechaingresada);
    var arrayinputs = ["#fechaexcel"];

    for (var i = 0; i < arrayinputs.length; i++) {
        $(arrayinputs[i]).removeClass('is-invalid');
    }
    if (fechaexcel === '' || fechaexcel === null) {
            mensajesFechaimcpleta('Por favor seleccione una fecha','#fechaexcel');
    }else if(fechaingresada < fechahoy || fechaingresada === fechahoy){
            mensajesFechaimcpleta('Por favor ingrese una fecha valida para poder agendar las solicitudes','#fechaexcel');
    }else {
        location.href = "recolecciones?accion=Excelrecolecciones&fechaexcel=" + fechaexcel;
    }
}

function cargarRecolecciones() {

    var fileInput = document.getElementById('file');
    var filePath = fileInput.value;
    var allowedExtensions = /(.xlsx)$/i;

    if (!allowedExtensions.exec(filePath)) {
        $('#labelcarga').text('El documento debe tener extension .xlsx').addClass('alert alert-danger');
    } else {

        nombrefile = document.getElementById('file').value;

        var data = new FormData();
        jQuery.each(jQuery('#file')[0].files, function (i, file) {
            data.append('file-' + i, file);
        });

        jQuery.ajax({
            url: 'recolecciones?accion=Subirexcel',
            data: data,
            //cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST', // For jQuery < 1.9
            success: function (rs) {
                if (rs === 'true') {
                    console.log('se fue al post');
                    $.post("recolecciones?accion=Cargamasiva", {nombredoc: nombrefile}, function (rs) {
                        if (rs === 'true') {
                            location.reload();
                        } else if (rs === 'false') {
                            console.log('false');
                        } else if (rs === 'refresh') {
                            location.reload();
                        } else {

                            var re = /,/ig;
                            var newstr = rs.replace(re, "  ");

                            $('#lblnoagregados').text(newstr);
                            var mdnoagregados = $('#mdnoagregados');
                            mdnoagregados.modal('show');
                        }
                    });
                }
            }
        });
    }

}

function mensajesFechaimcpleta(mensaje, caja) {
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
        toast: true,
        position: 'bottom',
        timer: 2000

    });
    $(caja).removeClass('border-success is-valid').addClass('is-invalid');
}
