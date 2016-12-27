<%@page import="org.hibernate.Query"%>
<%@ page import="java.util.*,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration" %>
<%@page import="com.cekhoax.bean.*"%>
<%!
 Session session1 = null;
 int idnama;
 int idpost;
%>
<%
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
        
        String SQL_QUERY2 ="from Post where id_nama ='"+idnama+"'";
        Query query2 = session1.createQuery(SQL_QUERY2);
        Iterator it2=query2.iterate();
        while(it2.hasNext()){
            
            Post e2=(Post)it2.next();
            idpost = e2.getIdPost();
        }
        
        
        String SQL_QUERY3 ="DELETE FROM Post where id_post ='"+idpost+"'";
        Query query3 = session1.createQuery(SQL_QUERY3);
        query3.executeUpdate();
        response.sendRedirect("laporanku.htm");
        
%>