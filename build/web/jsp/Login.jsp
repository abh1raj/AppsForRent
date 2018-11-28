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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            String uname=request.getParameter("email");
           String pwd=request.getParameter("pass");
           try
           {
	
               String myUrl="jdbc:mysql://localhost/appsrent";
		//step 1:
		Class.forName("com.mysql.jdbc.Driver");
      		//step 2:
		Connection conn=DriverManager.getConnection(myUrl,"root","");
                String query="Select Email,Password from LoginInfo where Email= '"+uname+"' and Password='"+pwd+"'";
		//step 3:
		Statement st=conn.createStatement();
		//step 4:
		ResultSet rs =st.executeQuery(query);
		if(rs.next()){
			String redirectURL = "../wtd.html";
                        response.sendRedirect(redirectURL);

		}  
                else
                {
                    String a = "../Invalid.html";
                    response.sendRedirect(a);
                }
		//step 5
		st.close();
		}
		catch(Exception e){
			System.out.println("Got an exception! ");
			System.out.println(e.getMessage());
		}
           
        %>
    </body>
</html>
