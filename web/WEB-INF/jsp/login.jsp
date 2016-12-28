

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

                <form action="login_proses.htm" method="post" class="login-form">
                    <input type="text" placeholder="Username" name="username"/>
                    <input type="password" placeholder="Password" name="password"/>
                    <button name="submit">login</button>
                    <p class="message">Belum Mendaftar? <a href="signup.htm">Buat Sekarang</a></p>
                </form>
            </div>
    </div>
    </body>
</html>

                <%  }
                    else{
                        response.sendRedirect("index.htm");
                    }
                %>