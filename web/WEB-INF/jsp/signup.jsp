<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                        
                %>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet" type="text/css" />
        
    </head>
    <body>

        
            <div class="login-page">
            <div class="form">

                <form action="signup_proses.htm" method="post" class="login-form">
                    <input type="text" placeholder="username" name="username" required/>
                    <input type="email" placeholder="email" name="email" required/>
                    <input type="phone" placeholder="notlp" name="notlp" required/>
                    <input type="password" placeholder="password" name="password" required/>
                    <button name="submit">Daftar</button>
                    <p class="message">Sudah Punya Akun? <a href="login.htm">Login Sekarang</a></p>
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