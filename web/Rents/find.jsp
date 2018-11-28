<%-- 
    Document   : find
    Created on : 26 Nov, 2018, 2:53:19 AM
    Author     : Abhiraj
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" type="text/css" href="css/display.css"
        <title>Find</title>
    </head>
    <style>
        body
        {
           background-image: url(../images/result.jpg);
           background-position: center;
           background-attachment: fixed;
           background-size: cover;
        }
        
    </style>
    <body>
        <%
            String loc = request.getParameter("loc");
            try
            {
                String myUrl="jdbc:mysql://localhost/appsrent";
		
		Class.forName("com.mysql.jdbc.Driver");
      		
		Connection conn=DriverManager.getConnection(myUrl,"root","");
                String q = "Select * from rents where location = '"+loc+"'";
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(q);
                while(rs.next())
                {
        %>
      <br><br><br><br>
        <div class="display">
        <p>Location: <%out.println(rs.getString("location"));%></p>
        <br>
        <p>Description: <%out.println(rs.getString("description"));%></p>
        <br>
        <p>Price: <%out.println(rs.getString("price"));%></p>
        <br>
    </div>
        <br><br><br><br><br><br><br><br>
       
  
        <%
                }
               
}
		catch(Exception e)
                {
			System.out.println("Got an exception! ");
			System.out.println(e.getMessage());
		}
        %>
        
        <a class="w3-jumbo" href="../Home.html" style="color: white;">HOME</a>
       
    </body>
</html>
