<%@ page import="java.util.*,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration" %>
<%@page import="com.cekhoax.bean.*"%>
<html>
<body>
<%
String idpost= request.getParameter("id_post");
String judul = request.getParameter("judul");
String epost = request.getParameter("epost");
String link = request.getParameter("link");
String alasan = request.getParameter("alasan");

String sub=request.getParameter("s1");
int idpost2 = 0;

if(sub != null)
{
    idpost2 = Integer.parseInt(idpost);
try
{
Configuration cf=new Configuration();
cf.configure();
SessionFactory fact = cf.buildSessionFactory();
Session sess = fact.openSession();
Transaction tr = sess.beginTransaction();
Post e = (Post)sess.get(Post.class,idpost2);
e.setJudul(judul);
e.setPost(epost);
e.setLink(link);
e.setAlasan(alasan);


tr.commit();
sess.update(e);
sess.close();
response.sendRedirect("laporanku.htm");
}
catch(Exception e)
{
System.out.println("e="+e.getMessage());
}
}
%>


<link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<html>
         <div class="form">
        <form name="f1">
            <input type="hidden" name="id_post" value="<%=idpost%>">
            <h1>Buat Laporan</h1>
            <br><input type="text" name="judul" placeholder="Judul Berita" required="required" value="<%=judul%>" />
            <div class="mdl-textfield mdl-js-textfield">
                <textarea class="mdl-textfield__input" type="text" rows= "5" id="isi" name="epost" required="required"><%=epost%></textarea>
                <label class="mdl-textfield__label" for="sample5">Isi Berita</label>
            </div>
            <input type="text" name="link" placeholder="Link Sumber" required="required" value="<%=link%>"/>
            <div class="mdl-textfield mdl-js-textfield">
                <textarea class="mdl-textfield__input" type="text" rows= "5" id="alasan" name="alasan" required="required"><%=alasan%></textarea>
                <label class="mdl-textfield__label" for="sample5">Alasan</label>
            </div>
                <input type="submit" name="s1" value="Update"><br>
            <a href="laporanku.htm">Kembali</a>
        </form>
        </div>
    </body>
</html>


