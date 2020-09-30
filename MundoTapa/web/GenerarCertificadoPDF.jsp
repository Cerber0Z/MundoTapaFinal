<%-- 
    Document   : GenerarCertificadoPDF
    Created on : 16/06/2020, 04:32:40 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            File reporte = new File(application.getRealPath("CertificadoReporte.jsaper"));
            Map<String,Object> parametro = new HashMap<String , Object>();
            Connection conexion = null;
            Conexion ConDB = new Conexion();
        %>
    </body>
</html>
