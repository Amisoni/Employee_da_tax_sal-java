<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
</head>
<body>
<%
try {
	
	//Integer a=Integer.parseInt("no");
	Class.forName("com.mysql.cj.jdbc.Driver");
	// loads mysql driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amii", "root", ""); // create new connection with test database
	
	Statement st=con.createStatement();
//	ResultSet rs=st.executeQuery("select name from employee where name='"+name+"'");
	
	
%>
<%
request.getSession(false);
	if(session==null)
	{
%>	
	<a href="login.jsp">Login</a>

<%
	}
	else 
	{
%>
	<a href="logout.jsp">Logout</a>
	
	<% } %>

<%
String name=(String)session.getAttribute("name");

%>


Welcome <%=name %>


<%
//rs.close();
con.close();
} catch (Exception ex) {}
%>
</body>
</html>