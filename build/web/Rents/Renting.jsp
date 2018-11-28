<%-- 
    Document   : Signup
    Created on : 14 Nov, 2018, 10:23:56 AM
    Author     : Abhiraj
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page</title>
    </head>
   
    <body>
        
        <%
           String loc=request.getParameter("loc");
           String pri=request.getParameter("pri");
           String des=request.getParameter("des");
           Connection conn=null;
           Statement st=null;
           ResultSet rs=null;
           try
             {
                String myUrl="jdbc:mysql://localhost/appsrent";
		Class.forName("com.mysql.jdbc.Driver");      		
		conn=DriverManager.getConnection(myUrl,"root","");
                st=conn.createStatement();
                st.executeUpdate("insert into rents values('"+loc+"','"+pri+"','"+des+"')");   
                String s = "../wtd.html";
                response.sendRedirect(s);
            }
            catch(Exception e)
            {                
                out.println(e);   
            }
        %>
    </body>
</html>
