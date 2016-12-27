<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.cekhoax.bean.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%!
 Session session1 = null;
%>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String notlp = request.getParameter("notlp");
    String password = request.getParameter("password");
    
    

    try
    {
        Configuration cf=new Configuration();
        cf.configure();
        SessionFactory sessionFactory = cf.buildSessionFactory();
        session1 =sessionFactory.openSession();
        Cekuser e1 = new Cekuser(email);
        session1.save(e1);
        User e=new User(username,email,notlp,password);
        session1.save(e);
        session1.flush();
        session1.close();
        response.sendRedirect("thank.htm");
    } catch(Exception e)
    {
        response.sendRedirect("duplicateuser.htm");
    }
%>
    



