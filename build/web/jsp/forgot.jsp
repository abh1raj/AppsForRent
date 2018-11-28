<%-- 
    Document   : Login
    Created on : 14 Nov, 2018, 9:30:43 AM
    Author     : Abhiraj
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
        <head>
	<title>Forgot Password</title>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" type="text/css" href="../css/login.css">

        <style>
            body 
            {
              background-image: url(../images/login.jpg);  
              background-attachment: fixed;
              background-size: cover;
            }
            
        </style>
</head>
    
    <body>
        <%
            String email=request.getParameter("email");
           String ques=request.getParameter("ques");
           try
           {
	
               String myUrl="jdbc:mysql://localhost/appsrent";
		//step 1:
		Class.forName("com.mysql.jdbc.Driver");
      		//step 2:
		Connection conn=DriverManager.getConnection(myUrl,"root","");
                String query="Select Email,ques,password from LoginInfo where Email= '"+email+"' and ques='"+ques+"'";
                
		//step 3:
		Statement st=conn.createStatement();
		//step 4:
		ResultSet rs =st.executeQuery(query);
		if(rs.next())
                {
                    %>
                  <div class="loginbox">
			<img src="../images/loginlogo.png" class=avatar>
			<h1>Forgot Password</h1>
                        <form action="jsp/Login.jsp">
				
				<p>Your Password is: <%out.println(rs.getString("password")); %></p>
				
                                <a href="../index.html">Login</a><br>
                                <a href="../Home.html">HOME</a>
			</form>
		</div>
                                         
                    <%
		}  
                
                else
                {   
                    %>
                            <div class="loginbox">
			<img src="../images/loginlogo.png" class=avatar>
			<h1>Forgot Password</h1>
                        <form action="jsp/Login.jsp">
				
				<p>Wrong Childhood Name..!</p>
				<a href="../Forgot.html">Try Again?</a>
                                <a href="../index.html">Login</a><br>
                                <a href="../Home.html">HOME</a>
			</form>
		</div>
                    <%
                        }
                                                                            

		//step 5
		st.close();
}
		catch(Exception e)
                {
			System.out.println("Got an exception! ");
			System.out.println(e.getMessage());
		}
           

        %>
  
    </body>
</html>
