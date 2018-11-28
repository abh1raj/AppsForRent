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
           String uname=request.getParameter("uname");
           String pwd=request.getParameter("pass");
           String email=request.getParameter("email");
           String tel=request.getParameter("phone");
           String add=request.getParameter("add");
           String ques=request.getParameter("ques");
           Connection conn=null;
           Statement st=null;
           ResultSet rs=null;
           try
             {
                String myUrl="jdbc:mysql://localhost/appsrent";
		Class.forName("com.mysql.jdbc.Driver");      		
		conn=DriverManager.getConnection(myUrl,"root","");
                st=conn.createStatement();
                st.executeUpdate("insert into logininfo values('"+uname+"','"+pwd+"','"+email+"','"+tel+"','"+add+"','"+ques+"')");              
                String rd = "../index.html";
                response.sendRedirect(rd);
            }
            catch(Exception e)
            {                
                out.println(e);   
            }
        %>
    </body>
</html>
