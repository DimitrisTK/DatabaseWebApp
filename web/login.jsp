<%-- 
    Document   : login.jsp
    Created on : May, 2017
    Author     : Kourias Triantafyllos Dimitris cs141092
--%>

<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="Functions.js"></script>

<%
    String uname = request.getParameter("uname");    
    String pass = request.getParameter("passphrase");
    Class.forName("com.mysql.jdbc.Driver");
    String myDatabase = "jdbc:mysql://localhost:3306/studresumes?user=root&password=12441244";
    Connection myConnection = DriverManager.getConnection(myDatabase);
    Statement myStatement = myConnection.createStatement();
    ResultSet rs;
    rs = myStatement.executeQuery("select * from credentials where username='" + uname + "' and password='" + pass + "'");
    
    if (rs.next()) 
        response.sendRedirect("index4user.jsp");
    else {
        %> <script> loginfailed(); </script> <% }
                
    
    myStatement.close();
    myConnection.close();
%>
