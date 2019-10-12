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
        <title>View CVs</title>
        <link rel="stylesheet" type="text/css" href="css/subform.css">
    </head>
    <body>
        
        
    <form action="viewCVs.jsp">
        Sort By:
            <select name="sortby"> 
                <option value="default">Default</option>
                <option value="surnames">Surname</option>
                <option value="institutes">Institutes</option>
                <option value="interests">Interests</option>
            </select>
        <input type="submit" value="Sort"> <br>
        <a href="index.html">Return Back</a><br>
    </form>
           
    <h2>You can click on a student to view his CV</h2>
   <%
   
    Class.forName("com.mysql.jdbc.Driver");
    String myDatabase = "jdbc:mysql://localhost:3306/studresumes?user=root&password=12441244";
    Connection myConnection = DriverManager.getConnection(myDatabase);
    Statement myStatement1 = myConnection.createStatement();
    Statement myStatement2 = myConnection.createStatement();
    Statement myStatement3 = myConnection.createStatement();
    Statement myStatement4 = myConnection.createStatement();
    Statement myStatement5 = myConnection.createStatement();
    Statement myStatement6 = myConnection.createStatement();
    
    ResultSet rsdef=myStatement1.executeQuery("SELECT  students.*, institutes.institute, faculties.faculty, university.department FROM students INNER JOIN university ON university.studID = students.studID INNER JOIN institutes ON institutes.institID = university.institID INNER JOIN faculties ON faculties.facultID = university.facultID");    
    ResultSet rssurname=myStatement2.executeQuery("SELECT  students.*, institutes.institute, faculties.faculty, university.department FROM students INNER JOIN university ON university.studID = students.studID INNER JOIN institutes ON institutes.institID = university.institID INNER JOIN faculties ON faculties.facultID = university.facultID ORDER BY surname");    
    ResultSet rsinstit=myStatement3.executeQuery("SELECT  students.*, institutes.institute, faculties.faculty, university.department FROM students INNER JOIN university ON university.studID = students.studID INNER JOIN institutes ON institutes.institID = university.institID INNER JOIN faculties ON faculties.facultID = university.facultID ORDER BY institute");    
    ResultSet rsinter=myStatement4.executeQuery("SELECT  Interests.interest, students.surname, students.firstname, institutes.institute, students.studid FROM students INNER JOIN studint ON studint.studID = students.studID INNER JOIN interests ON interests.interID = studint.interID INNER JOIN university ON university.studID = students.studID INNER JOIN institutes ON institutes.institID = university.institID ORDER BY interest");    
    ResultSet tableinstitutes=myStatement5.executeQuery("SELECT institute, institstudcounter FROM institutes ORDER BY institute");    
    ResultSet tableinterests=myStatement6.executeQuery("SELECT interest, IntStudCounter FROM interests ORDER BY interest");    
    
    
    if (((request.getParameter("sortby")) == null) || ((request.getParameter("sortby")).equals("default")))
    {   
        %><table>
            <tr>
                <th>Surname</th><th>FirstName</th><th>Birthdate</th><th>Institute</th><th>Faculty </th><th>Department</th><th>Date & Time of submit</th>
            </tr>
        
            <%
            while(rsdef.next())
            { %>
   
            <tr>
                <td><a href="viewStudentCV.jsp?viewperson=<%out.println(rsdef.getString("studid")); %>"><%out.println(rsdef.getString("surname")); %></a></td>
                <td><%out.println(rsdef.getString("firstName")); %></td>
                <td><%out.println(rsdef.getDate("birthdate")); %></td>
                <td><%out.println(rsdef.getString("institute")); %></td>
                <td><%out.println(rsdef.getString("faculty")); %></td>
                <td><%out.println(rsdef.getString("department")); %></td>
                <td><%out.println(rsdef.getString("DateofSubmit")); %></td>
            </tr>
        
            <% } %>
        </table><%
    }
    


    else if ((request.getParameter("sortby")).equals("surnames"))
    {   
        %><table>
            <tr>
                <th>Surname</th><th>FirstName</th><th>Birthdate</th><th>Institute</th><th>Faculty </th><th>Department</th><th>Date & Time of submit</th>
            </tr>
        
            <%
            while(rssurname.next())
            { %>
   
                <tr>
                    <td><a href="viewStudentCV.jsp?viewperson=<%out.println(rssurname.getString("studid")); %>"><%out.println(rssurname.getString("surname")); %></a></td>
                    <td><%out.println(rssurname.getString("firstName")); %></td>
                    <td><%out.println(rssurname.getDate("birthdate")); %></td>
                    <td><%out.println(rssurname.getString("institute")); %></td>
                    <td><%out.println(rssurname.getString("faculty")); %></td>
                    <td><%out.println(rssurname.getString("department")); %></td>
                    <td><%out.println(rssurname.getString("DateofSubmit")); %></td>
                </tr>
            
            <% } %>
        </table><%
     }
    


    else if ((request.getParameter("sortby")).equals("institutes"))
    {   
        %><table>
            <tr>
                <th>Surname</th><th>FirstName</th><th>Birthdate</th><th>Institute</th><th>Faculty </th><th>Department</th><th>Date & Time of submit</th>
            </tr>
        
            <% 
            while(rsinstit.next())
            { %>

               <tr>
                    <td><a href="viewStudentCV.jsp?viewperson=<%out.println(rsinstit.getString("studid")); %>"><%out.println(rsinstit.getString("surname")); %></a></td>
                    <td><%out.println(rsinstit.getString("firstName")); %></td>
                    <td><%out.println(rsinstit.getDate("birthdate")); %></td>
                    <td><%out.println(rsinstit.getString("institute")); %></td>
                    <td><%out.println(rsinstit.getString("faculty")); %></td>
                    <td><%out.println(rsinstit.getString("department")); %></td>
                    <td><%out.println(rsinstit.getString("DateofSubmit")); %></td>
                </tr>
            
            <% } %>
        </table><%
    }
    


    else if ((request.getParameter("sortby")).equals("interests"))
    {  
        %><table>
            <tr>
                <th>Interest</th><th>Surname</th><th>FirstName</th><th>Institute</th>
            </tr>
        
            <% 
            while(rsinter.next()){    
            %>

            <tr>
                <td><%out.println(rsinter.getString("interest")); %></td>
                <td><a href="viewStudentCV.jsp?viewperson=<%out.println(rsinter.getString("studid")); %>"><%out.println(rsinter.getString("surname")); %></a></td>
                <td><%out.println(rsinter.getString("firstName")); %></td>
                <td><%out.println(rsinter.getString("institute")); %></td>
                
            </tr>
            
            <% } %>
        </table><p><%
    }

    

    %><table  style="float: left">
        <tr>
            <th>Institutes</th><th>Number of Students</th>
        </tr><%
       
        while(tableinstitutes.next())
        { %>
            <tr>
                <td><%out.println(tableinstitutes.getString("institute")); %></td>
                <td><%out.println(tableinstitutes.getInt("institstudcounter")); %></td>           
            </tr>
        <% } %>
        
    </table><p><%



    %><table  style="float: left">
        <tr>
            <th>Interests</th><th>Number of Students</th>
        </tr><%
            
        while(tableinterests.next())
        { %>
            <tr>
                <td><%out.println(tableinterests.getString("interest")); %></td>
                <td><%out.println(tableinterests.getInt("IntStudCounter")); %></td>           
             </tr>
        <% } %>
        
    </table><%



    myStatement1.close();
    myStatement2.close();
    myStatement3.close();
    myStatement4.close();
    myStatement5.close();
    myStatement6.close();
    myConnection.close(); 
   %>
   
    </body>
</html>
