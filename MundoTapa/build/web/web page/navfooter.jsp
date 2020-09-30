<%-- 
    Document   : navfooter
    Created on : 18/03/2020, 10:43:44 PM
    Author     : sergi
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
    </head>
    <body>
        <!--Footer -->
        <% if ((int)session.getAttribute("Rol") == 1) {%>
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © 2020</span>
                </div>
            </div>
        </footer>
        <% } else if ((int)session.getAttribute("Rol") == 2 ) { %>
        <footer id="footerUser" class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © 2020</span>
                </div>
            </div>
        </footer>
        <% } %>
    </body>
</html>
