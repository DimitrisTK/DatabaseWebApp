<%-- 
    Document   : submit.jsp
    Created on : May, 2017
    Author     : Kourias Triantafyllos Dimitris cs141092
--%>

<script src="Functions.js"></script>

<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Variables
    String surname = request.getParameter("surname");    
    String firstname = request.getParameter("firstname");
    
    int daybirth =Integer.parseInt(request.getParameter("daybirth"));
    int monthbirth =Integer.parseInt(request.getParameter("monthbirth"));
    int yearbirth =Integer.parseInt(request.getParameter("yearbirth"));
   
    String cvresume = request.getParameter("cvresume");
    int institute = Integer.parseInt(request.getParameter("institute"));
    int faculty = Integer.parseInt(request.getParameter("faculty"));
    String department = request.getParameter("department");
 
    String[] languages = request.getParameterValues("languages");
    String[] langlevels = request.getParameterValues("langlevels");
    String[] newlanguages = request.getParameterValues("newlanguages");
    String[] newlvls = request.getParameterValues("newlvls");
    
    String[] interests = request.getParameterValues("interests");
    String[] hobbies = request.getParameterValues("hobbies");
    String[] newhobbies = request.getParameterValues("newhobbies");
    String[] photos = request.getParameterValues("photos");
    String[] videos = request.getParameterValues("videos");
    String[] quotes = request.getParameterValues("quotes");
    
    Class.forName("com.mysql.jdbc.Driver");
    String myDatabase = "jdbc:mysql://localhost:3306/studresumes?user=root&password=12441244";
    Connection myConnection = DriverManager.getConnection(myDatabase);
    Statement myStatement = myConnection.createStatement();
    
    //Anazita an auto to onomateponumo uparxei idi
    ResultSet exists=myStatement.executeQuery("SELECT * FROM students WHERE surname='" + surname + "' AND firstname='" + firstname + "'");    
    if (exists.first()){
        %> <script> studentexists(); </script> <%
    }
    else{
        
        //Insert Student
        myStatement.executeUpdate("INSERT INTO Students(surname, firstname, birthdate) VALUES ('" + surname + "','" + firstname + "','" + yearbirth + "-" + monthbirth + "-" + daybirth + "')");
    
        //Mathainei poio id exei dothei ston student
        ResultSet studnumber = myStatement.executeQuery("SELECT * FROM students WHERE surname='" + surname + "' AND firstname='" + firstname + "'");
        studnumber.first();
        int studid =Integer.parseInt(studnumber.getString(1));
    
   
        //Filling Tables
        myStatement.executeUpdate("INSERT INTO CVs VALUES ('" + studid + "','" + cvresume + "')");
    
        if (institute != 0)
            myStatement.executeUpdate("INSERT INTO university VALUES ('" + studid + "','" + institute + "','" + faculty + "','" + department + "')");
    
    
        for (int i = 0; i < languages.length; i+=1)
            if (languages[i] != (""))
                myStatement.executeUpdate("INSERT INTO studlang VALUES ('" + studid + "','" + languages[i] + "','" + langlevels[i] + "')");
                
        for (int i = 0; i < newlanguages.length; i+=1)
            if (newlanguages[i] != ("")){
                myStatement.executeUpdate("INSERT INTO Languages(language) VALUES ('" + newlanguages[i] + "')");
                ResultSet langnum = myStatement.executeQuery("SELECT * FROM languages WHERE language='" + newlanguages[i] + "'");
                langnum.first();
                int langid =Integer.parseInt(langnum.getString(1));
                myStatement.executeUpdate("INSERT INTO studlang VALUES ('" + studid + "','" + langid + "','" + newlvls[i] + "')");
             }


        for (int i = 0; i < interests.length; i+=1)
            if (interests[i] != (""))
                myStatement.executeUpdate("INSERT INTO studint VALUES ('" + studid + "','" + interests[i] + "')");
    
    
        for (int i = 0; i < hobbies.length; i+=1)
            if (hobbies[i] != (""))
                myStatement.executeUpdate("INSERT INTO studhob VALUES ('" + studid + "','" + hobbies[i] + "')");
        
        for (int i = 0; i < newhobbies.length; i+=1)
            if (newhobbies[i] != ("")){
                myStatement.executeUpdate("INSERT INTO Hobbies(hobby) VALUES ('" + newhobbies[i] + "')");
                ResultSet hobbynum = myStatement.executeQuery("SELECT * FROM hobbies WHERE hobby='" + newhobbies[i] + "'");
                hobbynum.first();
                int hobbyid =Integer.parseInt(hobbynum.getString(1));
                myStatement.executeUpdate("INSERT INTO studhob VALUES ('" + studid + "','" + hobbyid + "')");
             }

        for (int i = 0; i < quotes.length; i+=1)
            if (quotes[i] != (""))
                myStatement.executeUpdate("INSERT INTO Quotes(studid, quote) VALUES ('" + studid + "','" + quotes[i] + "')");
    
        for (int i = 0; i < photos.length; i+=1)
            if (photos[i] != (""))
                myStatement.executeUpdate("INSERT INTO Media VALUES ('" + studid + "','" + photos[i] + "','Photo','" + (i+1) +"')");
    
        for (int i = 0; i < videos.length; i+=1)
            if (videos[i] != (""))
                myStatement.executeUpdate("INSERT INTO Media VALUES ('" + studid + "','" + videos[i] + "','Video','" + (i+1) +"')");
    
    
        myStatement.close();
        myConnection.close(); 
    }
    %>
    
      
    
<!DOCTYPE html>
<html>
    <head>
        <title>Submitting Complete</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
    </head>
    
    <body>
        <div>
            <h2>Your info submit is complete</h2>
            <button class='button3' onclick="window.location.href='index4user.jsp'">Return to Home Page</button>
        </div>
        
    </body>
</html>
