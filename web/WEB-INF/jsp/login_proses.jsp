<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.cekhoax.bean.*,org.hibernate.*,org.hibernate.cfg.*" %>
<link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet" type="text/css" />

<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cekhoax","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.htm");
    } else {
        %>
        <div class="login-page">
            <div class="form">
                <form class="login-form">
                    <p class="message"> Invalid password <a href='login_proses.htm'>try again</a> </p>
                </form>
            </div
        <div> <%
    }
%>