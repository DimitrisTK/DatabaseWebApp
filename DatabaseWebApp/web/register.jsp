<%-- 
    Document   : register.jsp
    Created on : May, 2017
    Author     : Kourias Triantafyllos Dimitris cs141092
--%>

<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="Functions.js"></script>

<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String sex = request.getParameter("sex");
    
    Class.forName("com.mysql.jdbc.Driver");
    String myDatabase = "jdbc:mysql://localhost:3306/studresumes?user=root&password=12441244";
    Connection myConnection = DriverManager.getConnection(myDatabase);
    
    Statement myStatement = myConnection.createStatement();
    ResultSet rs=myStatement.executeQuery("SELECT * FROM credentials WHERE Username= '"+username+"'");
    
    
    if (rs.first()){
        %> <script> usernameexists(); </script> <% }
    else
        myStatement.executeUpdate("insert into credentials(username, password, email, sex) values ('" + username + "','" + password + "','" + email + "','" + sex + "')"); 
   

    myStatement.close();
    myConnection.close();  
%>




<!DOCTYPE html>
<html>
    <head>
        <title>Register Complete</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
    </head>
    
    <body>
        <div>
            <h2>Your registration is complete</h2>
            <h2>you can return to home page and log in.</h2>
            <button class='button3' onclick="window.location.href='index.html'">Return to Home Page</button>
        </div>
    </body>
</html>