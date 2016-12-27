
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>


                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                        
                %>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="login-page">
            <div class="form">

                <form class="login-form">

                    <p class="message">Maaf Username Sudah Ada Yang Menggunakan <a href="signup.htm">Silakan Coba Lagi</a></p>
                </form>
            </div>
    </div>
    </body>
</html>

                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                        
                %>  
