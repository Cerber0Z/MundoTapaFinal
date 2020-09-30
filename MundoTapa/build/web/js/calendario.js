document.addEventListener('DOMContentLoaded', function () {


    var fa = new Date();
    fa.setHours(0, 0, 0, 0);


    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid', 'timeGrid'],

        header: {
            left: 'prev,next',
            center: 'title',
            locale: 'es',
            right: 'today'
        },
        

    });
    calendar.render();
});

// =========================

function agregaragendamiento() {
    var modalAgregarsolicitud = $('#modalAgregarsolicitud');
    modalAgregarsolicitud.modal('show');
}
