<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	String no=request.getParameter("no");
	//Integer a=Integer.parseInt("no");
	Class.forName("com.mysql.jdbc.Driver");
	// loads mysql driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amii", "root", ""); // create new connection with test database
	
	String query="select * from employee where no='"+no+"'";
	
	PreparedStatement ps=(PreparedStatement) con.prepareStatement(query); 
	//ps.setInt(1, a);
	ResultSet rs=ps.executeQuery();
%>
<table border='1'>
		
<%
while (rs.next()) {
%>
<form action="Delete" method="post">
<TR>
<td hidden> No</td>
<td hidden><input type="text" name="no" value="<%=no%>"></td>
</TR>
<tr>
<td> Name</td>
<td><input type="text" name="nm" value="<%=rs.getString(2)%>"></td>
</tr>
<tr>
<td>Designation</td>
<td><input type="text" name="des" value="<%=rs.getString(3)%>"></td>
</tr>
<tr>
<td>Password</td>
<td><input type="text" name="sal" value="<%=rs.getString(4)%>"></td>
</tr>
<tr>
<td colspan='2'><input type="submit" value="Delete"></td>
</tr>
</form>

  
</TR>
<% } %>

<%
// close all the connections.
rs.close();
ps.close();
con.close();
} catch (Exception ex) {}
%>
</body>
</html>