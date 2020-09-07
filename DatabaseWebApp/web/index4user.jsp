<%-- 
    Document   : index4user.jsp
    Created on : May, 2017
    Author     : Kourias Triantafyllos Dimitris cs141092
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    
<head>
    <title>Home Page-Welcome User</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="Functions.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index4user.css">
</head> 

<body>

    <div id='viewcvs'>
        <a id='cvlink' href="viewCVs.jsp">View submitted CVs of other students</a>.
    </div> 
    
    <div id='subcv'>
        <a id='submitlink' href="submitform.html">Submit your own CV</a>.
    </div>
    
    <div >
            <h2>Welcome,you have successfully logged in.</h2>
            <h3>Enjoy your stay! </h3>
    </div><p>
        
    <button id='logout' onclick="window.location.href='index.html'">Log Out</button>
    
    <form class='quotes' action="index4user.jsp">
        <h1>Add new quotes to your profile<p></h1>
        <label>Surname</label><br>
        <input type="text" placeholder="Surname" name="surname"> <p>

        <label>First Name</label><br>
        <input type="text" placeholder="First Name" name="firstname"><p>
        
        <div id="quotefields">
                <label>Quote</label><br>
                <input type="text" name="quotes">            
        </div>
        
        <input type="button" value="Add another quote" onClick="addanotherquote('quotefields');"><br>
            
        <button type="submit" >Submit Quotes</button><p>
    </form>
           
                
</body>
</html>


<%
    String surname = request.getParameter("surname");    
    String firstname = request.getParameter("firstname");
    String[] quotes = request.getParameterValues("quotes");
    int studid = 0;
    
    Class.forName("com.mysql.jdbc.Driver");
    String myDatabase = "jdbc:mysql://localhost:3306/studresumes?user=root&password=12441244";
    Connection myConnection = DriverManager.getConnection(myDatabase);
    Statement myStatement = myConnection.createStatement();
    
    //Anazitaei ton student kai an uparxei tou kataxorei ta quotes
    ResultSet studnumber = myStatement.executeQuery("SELECT * FROM students WHERE surname='" + surname + "' AND firstname='" + firstname + "'");
    
    if (studnumber.next()){
        studnumber.first();
        studid = Integer.parseInt(studnumber.getString(1));
        
        for (int i = 0; i < quotes.length; i+=1)
            if (quotes[i] != (""))
                myStatement.executeUpdate("INSERT INTO Quotes(studid, quote) VALUES ('" + studid + "','" + quotes[i] + "')");
        
        %> <script> quotessuccess(); </script> <% 
    }
           
   
    
    myStatement.close();
    myConnection.close();  
%>


