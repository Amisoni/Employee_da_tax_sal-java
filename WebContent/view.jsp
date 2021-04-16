<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	// loads mysql driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amii", "root", ""); // create new connection with test database
	
	String query="select * from employee";
	
	PreparedStatement ps=(PreparedStatement) con.prepareStatement(query); 
	ResultSet rs=ps.executeQuery();
%>
<table border='1'>
		<tr> <th>Name</th>	<th>Designation</th> <th>Salary</th> <th>Update</th> <th>Delete</th> </tr>
<%
while (rs.next()) {
%>
<TR>

<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>


<td><a href="update.jsp?no=<%=rs.getInt(1) %>">Update</a></td> 
 
<td><a href="delete.jsp?no=<%=rs.getInt(1) %>">Delete</a></td> 


</TR>
<% } %>

<%
// close all the connections.
rs.close();
ps.close();
con.close();
} catch (Exception ex) {}
%>


</TABLE>


</body>
</html>