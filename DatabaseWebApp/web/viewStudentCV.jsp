<%-- 
    Document   : viewCVs.jsp
    Created on : May, 2017
    Author     : Kourias Triantafyllos Dimitris cs141092
--%>

<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="Functions.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student CV</title>
        <link rel="stylesheet" type="text/css" href="css/subform.css">
    </head>
    <body>
        <a href="viewCVs.jsp">Return Back</a>
    <%  
    String personID = request.getParameter("viewperson");
    Class.forName("com.mysql.jdbc.Driver");
    String myDatabase = "jdbc:mysql://localhost:3306/studresumes?user=root&password=12441244";
    Connection myConnection = DriverManager.getConnection(myDatabase);
    Statement myStatement1 = myConnection.createStatement();
    Statement myStatement2 = myConnection.createStatement();
    Statement myStatement3 = myConnection.createStatement();
    Statement myStatement4 = myConnection.createStatement();
    Statement myStatement5 = myConnection.createStatement();
    Statement myStatement6 = myConnection.createStatement();
    Statement myStatement7 = myConnection.createStatement();
    Statement myStatement8 = myConnection.createStatement();
    ResultSet rsperson=myStatement1.executeQuery("SELECT  students.*, institutes.institute, faculties.faculty, university.department FROM students INNER JOIN university ON university.studID = students.studID INNER JOIN institutes ON institutes.institID = university.institID INNER JOIN faculties ON faculties.facultID = university.facultID WHERE students.studID ='" + personID + "'");    
    rsperson.first();
    ResultSet rscv=myStatement2.executeQuery("SELECT  CVs.curriculum FROM students INNER JOIN CVs ON CVs.studID = Students.studID WHERE students.studID ='" + personID + "'");    
    rscv.first();
    ResultSet rshobbies=myStatement3.executeQuery("SELECT  hobbies.hobby FROM students INNER JOIN studhob ON studhob.studID = students.studID INNER JOIN hobbies ON hobbies.hobID = studhob.hobID WHERE students.studID ='" + personID + "'");    
    ResultSet rsinterests=myStatement4.executeQuery("SELECT  Interests.interest FROM students INNER JOIN studint ON studint.studID = students.studID INNER JOIN interests ON interests.interID = studint.interID WHERE students.studID ='" + personID + "'"); 
    ResultSet rslanguages=myStatement5.executeQuery("SELECT  Languages.language, languagelevels.level FROM students INNER JOIN studlang ON studlang.studID = students.studID INNER JOIN languages ON languages.langID = studlang.langID INNER JOIN languagelevels ON languagelevels.lvlID = studlang.lvlID WHERE students.studID ='" + personID + "'"); 
    ResultSet rsquotes=myStatement6.executeQuery("SELECT  Quotes.Quote, Quotes.qdate FROM students INNER JOIN Quotes ON Quotes.studID = Students.studID WHERE students.studID ='" + personID + "'");  
    ResultSet rsphotos=myStatement7.executeQuery("SELECT  Media.Link, Media.UserNumeration FROM  students INNER JOIN Media ON Media.studID = Students.studID WHERE Media.MediaType='Photo' AND students.studID ='" + personID + "'");
    ResultSet rsvideos=myStatement8.executeQuery("SELECT  Media.Link, Media.UserNumeration FROM  students INNER JOIN Media ON Media.studID = Students.studID WHERE Media.MediaType='Video' AND students.studID ='" + personID + "'");
    
    %>
    
    
    <table>
        <tr>
            <th>Surname</th><th>FirstName</th><th>Birthdate</th><th>Institute</th><th>Faculty </th><th>Department</th><th>Date & Time of submit</th>
        </tr>
        <tr>
            <td><%out.println(rsperson.getString("surname")); %></a></td>
            <td><%out.println(rsperson.getString("firstName")); %></td>
            <td><%out.println(rsperson.getDate("birthdate")); %></td>
            <td><%out.println(rsperson.getString("institute")); %></td>
            <td><%out.println(rsperson.getString("faculty")); %></td>
            <td><%out.println(rsperson.getString("department")); %></td>
            <td><%out.println(rsperson.getString("DateofSubmit")); %></td>
        </tr>
    </table>
      
      
        
        <table>
            <tr>
                <th>Curriculum Vitae:</th>
            </tr>
            <tr>   
                <td><%out.println(rscv.getString("curriculum")); %></td>
            </tr>
        </table>
            
            
        <table>
            <tr>
                <th>Quotes</th><th>Date of submission</th>
            </tr><%
            while(rsquotes.next())    
            { %>
                <tr>   
                    <td><%out.println(rsquotes.getString("quote")); %></td>
                    <td><%out.println(rsquotes.getString("qdate")); %></td>
                </tr>
             <%  } %>
        </table> 
            
        <table  style="float: left">
            <tr>
                <th>Hobbies</th>
            </tr><%
            while(rshobbies.next())
            { %>
                <tr>   
                    <td><%out.println(rshobbies.getString("hobby")); %></td>
                </tr>
            <% } %>
        </table> 
        
        
        <table  style="float: left">
            <tr>
                <th>Interests</th>
            </tr><%
            while(rsinterests.next())
            { %>
                <tr>   
                    <td><%out.println(rsinterests.getString("interest")); %></td>
                </tr>
            <% } %>
        </table> 
        
        
        <table  style="float: left">
            <tr>
                <th>Languages</th><th>Levels</th>
            </tr><%
            while(rslanguages.next())
            { %>
                <tr>   
                    <td><%out.println(rslanguages.getString("language")); %></td>
                    <td><%out.println(rslanguages.getString("level")); %></td>
                </tr>
            <% } %>
        </table> 
        
        
        
        
        
        <table  style="float: left">
            <tr>
                <th>User's Photos</th>
            </tr><%
            while(rsphotos.next())    
            { %>
                <tr>   
                    <td><a href="<%out.println(rsphotos.getString("link")); %>" target="_blank">Photo <%out.println(rsphotos.getString("usernumeration")); %></a></td>
                </tr>
            <%  } %>
        </table> 
      
        
        <table  style="float: left">
            <tr>
                <th>User's Videos</th>
            </tr><%
            while(rsvideos.next())   
                { %>
                <tr>   
                    <td><a href="<%out.println(rsvideos.getString("link")); %>" target="_blank">Video <%out.println(rsvideos.getString("usernumeration")); %></a></td>
                </tr>
            <% } %>
        </table>        
        
        
        
    </body>
</html>
 
<%
    myStatement1.close();
    myStatement2.close();
    myStatement3.close();
    myStatement4.close();
    myStatement5.close();
    myStatement6.close();
    myStatement7.close();
    myStatement8.close();
    myConnection.close(); 
   %>