/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Correo;

import Modelo.Agendamiento;
import Modelo.CCertificaciones;
import Modelo.Persona;
import Modelo.Uusuario;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Software X
 */
public class CCorreos {

    Date fechaactual = new Date(System.currentTimeMillis());
    SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
    Properties propiedad = new Properties();
    Agendamiento ang = new Agendamiento();

    // Envio de correo sobre certificaciones consultadas desde certificaciones.jsp de lo
    public int enviarCorreo(Persona person, CCertificaciones certificacion, Agendamiento angendamiento, int opcion) {

        int codigo = 0;
        Random rnd = new Random();
        codigo = rnd.nextInt(4874897) * 6;

        propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
        propiedad.setProperty("mail.smtp.starttls.enable", "true");
        propiedad.setProperty("mail.smtp.port", "587");
        propiedad.setProperty("mail.smtp.auth", "true");

        try {
            Session sesion = Session.getDefaultInstance(propiedad, null);

            String emailenvia = "mundotapav@gmail.com";
            String pass = "5485356M";
            String htmlCode;

            MimeMessage mail = new MimeMessage(sesion);
            // Email que envia el mensaje
            mail.setFrom(new InternetAddress(emailenvia));
            // Linea donde se indica a que correo electronico se envia el mensaje
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(person.getCorreo()));

            switch (opcion) {
                case 1: // OPcion para enbviar certificacion
                    mail.setSubject("CERTIFICACION.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                            + "    style=\"background-color: rgb(94 226 144); width: 80%; margin: auto;font-size: larger; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%); margin-top: auto; border-radius: 15px; max-height: 720px; min-height: 270px; text-align: center;\">\n"
                            + "    <img style=\"width: 13%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \"> (EL presente\n"
                            + "        certificado de agradecimiento se expide hoy " + dateformat.format(fechaactual) + " a nombre de " + person.getPrimerNombre() + " " + person.getPrimerApellido() + " identificado con cedula de ciudadania\n"
                            + "        " + person.getCedPersona() + " En la ciudad de Bogotá D.C. por motivo de la donación realizada el día " + certificacion.getFecharecoleccion() + " por un total\n"
                            + "        de " + certificacion.getCantidad() + "/Kg, de material reciclable, extendemos nuestra gratitud por medio de la presente, dandoles a\n"
                            + "        conocer nuestra felicidad y aprecio por el apoyo otorgado a estos niños en esta dificil situción. De nuevo\n"
                            + "        gracias y esperamos tener el gusto de hacerlos participes de esta labor. Cordialmente : Fundación SANAR ) </h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");
                    break;

                case 2:

                    mail.setSubject("REGISTRO EXITOSO.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                            + "    style=\"background-color: #299be2; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%);  margin-top: auto; width: auto; border-radius: 15px; max-height: 720px; min-height: 220px; text-align: center;\">\n"
                            + "    <img style=\"width: 10%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">Le damos la bienvenida a la Fundación sanar," + "<br>" + " Ingresa con el correo " + "<b style=\"color: #fff \" >" + person.getCorreo() + "</b>" + " tu clave es: " + "<b style=\"color: #fff \" >" + person.getClave() + "</b>" + "</br>" + " </h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");
                    break;

                case 3:

                    mail.setSubject("SOLICITUD AGENDADA.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                            + "    style=\"background-color: #fdaf4dbf; width: 80%; margin: auto; font-size: larger; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%);  margin-top: auto; border-radius: 15px; max-height: 720px; min-height: 220px; text-align: center;\">\n"
                            + "    <img style=\"width: 10%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">La solicitud con codigo: " + angendamiento.getIdSolicitud() + " fue agendada" + "<br>" + "Su solicitud fue agendad para el día " + angendamiento.getFechaAgendamiento() + " por favor estar pendiente de su celuar el trasportador se comunicara con usted por ese medio, un saludo y gracias por su donación " + "</h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");
                    break;

                case 4: // Envia correo para recuperar contraseña

                    mail.setSubject("CODIGO DE CONFIRMACION.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                            + "    style=\"background-color: #f3ace2; width: 80%; margin: auto; font-size: larger; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%);  margin-top: auto; border-radius: 15px; max-height: 720px; min-height: 195px; text-align: center;\">\n"
                            + "    <img style=\"width: 15%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">tu codigo de confirmacion es: " + "<b style=\"color: #fff \" >" + codigo + "</b>" + "</h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");
                    break;

                case 5: // envia correo de desaprobacion
                    mail.setSubject("SOLICITUD DESAPROBADA.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                            + "    style=\"background-color: #ea2f7dd6; width: 80%; margin: auto; font-size: larger; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%);  margin-top: auto; border-radius: 15px; max-height: 720px; min-height: 220px; text-align: center;\">\n"
                            + "    <img style=\"width: 10%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">La solicitud con codigo: " + angendamiento.getIdSolicitud() + " fue desaprobada, Por el siguiente motivo:" + "<br>" + " '' " + angendamiento.getRazon() + " '' " + "<br>" + "</h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");

                    break;
                case 6: // envia correo cuando se cambia
                    mail.setSubject("SU CORREO SE ACTULIZO CORRECTAMENTE.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                            + "    style=\"background-color: #ea702fd6; width: 80%; margin: auto; font-size: larger; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%);  margin-top: auto; border-radius: 15px; max-height: 720px; min-height: 220px; text-align: center;\">\n"
                            + "    <img style=\"width: 10%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">Su correo se actualizo correctamente A: " + person.getCorreoActilizado() + " si estos cambios no los hicistes tu" + "<br>" + " Comunicate con SANAR TEL: 2890930 - 2894094 - 3370052 - 310 2761355 " + "</h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");

                    break;
                case 7: // envia correo de bienvenida
                    mail.setSubject("BIENVENIDO A MUNDO TAPA.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                            + "    style=\"background-color: #f7f659d6; width: 80%; margin: auto; font-size: larger; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%);  margin-top: auto; border-radius: 15px; max-height: 720px; min-height: 220px; text-align: center;\">\n"
                            + "    <img style=\"width: 10%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">Bienvenido a la fundacion sanar " + "<b style=\"color: #358e10 \" >" + person.getPrimerNombre() + " " + person.getPrimerApellido() + ",<br>" + "</b>" + "de antemano muchas gracias por sus donaciones" + "</h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");

                    break;
                case 8: // envia correo de bienvenida
                    mail.setSubject("SOLICITUD COMPLETADA.");// Encabezado del mensaje
                    htmlCode = "<div\n"
                                + "    style=\"background-color: #f7f659d6; width: 80%; margin: auto; font-size: larger; background-image: linear-gradient(180deg,#0b7ec5 10%,#00adb1 100%);  margin-top: auto; border-radius: 15px; max-height: 720px; min-height: 220px; text-align: center;\">\n"
                            + "    <img style=\"width: 10%;\"\n"
                            + "        src=\"http://sanarcancer.org/wp-content/uploads/2016/03/favicon.png\">\n"
                            + "    <br>\n"
                            + "   \n"
                            + "    <h4 style=\"color:  rgb(15, 12, 12); font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">Bienvenido a la fundacion sanar " + person.getPrimerNombre() + " " + person.getPrimerApellido() + ",<br>" + "</b>" + "de antemano muchas gracias por sus donaciones" + "</h4>\n"
                            + "</div>";

                    mail.setContent(htmlCode, "text/html");

                    break;
                default:
                    throw new AssertionError();
            }

            try (Transport trs = sesion.getTransport("smtp")) {
                trs.connect(emailenvia, pass);

                trs.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
            }

        } catch (MessagingException e) {
            System.out.println("No se envio e correo ashh :(");
        }
        return codigo;
    }

}
