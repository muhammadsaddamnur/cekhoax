<%-- 
    Document   : input_proses
    Created on : Dec 28, 2016, 2:25:03 AM
    Author     : Muhammad Saddam Nur
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.cekhoax.bean.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%!
 Session session1 = null;
 int idnama;
%>
<%
    String judul = request.getParameter("judul");
    String link = request.getParameter("link");
    String post = request.getParameter("isi");
    String alasan = request.getParameter("alasan");
    
    Date tanggal = new Date();

    
    
    
    
        Configuration cf=new Configuration();
        cf.configure();
        SessionFactory sessionFactory = cf.buildSessionFactory();
        session1 =sessionFactory.openSession();
        
        String SQL_QUERY ="from User where username ='"+session.getAttribute("userid")+"'";
        Query query = session1.createQuery(SQL_QUERY);
        Iterator it=query.iterate();
        while(it.hasNext()){
            
            User e1=(User)it.next();
            idnama = e1.getIdNama();
        }
        
       
        
        
        Post e=new Post(idnama,judul,link,post,alasan,tanggal);
        session1.save(e);
        session1.flush();
        session1.close();
        response.sendRedirect("index.htm");

%>
    



