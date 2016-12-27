
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<!DOCTYPE html>
                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                        response.sendRedirect("login.htm");
                    }else{
                %>  
                
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

<body>
    <div class="login-page">
         <div class="form">
	<h1>Input Berita</h1>
        <form action="input_proses.htm" method="post">
            <br><input type="text" name="judul" placeholder="Judul Berita" required="required" />
            <div class="mdl-textfield mdl-js-textfield">
                <textarea class="mdl-textfield__input" type="text" rows= "5" id="isi" name="isi" required="required"></textarea>
                <label class="mdl-textfield__label" for="sample5">Isi Berita</label>
            </div>
            <input type="text" name="link" placeholder="Link Sumber" required="required" />
            <div class="mdl-textfield mdl-js-textfield">
                <textarea class="mdl-textfield__input" type="text" rows= "5" id="alasan" name="alasan" required="required"></textarea>
                <label class="mdl-textfield__label" for="sample5">Alasan</label>
            </div>
            <button type="submit" class="btn btn-primary btn-block btn-large">Post</button><br>
            <a href="index.htm"><button type="reset" class="btn btn-primary btn-block btn-large">Cancel</button></a>
        </form>
        </div>
    </div>
    </body>
</html>

                <%      
                    }
                %>
