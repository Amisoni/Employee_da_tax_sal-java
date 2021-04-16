<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert</title>
</head>
<body>
<form action="Insert" method="post">
<table>

<tr> <td>Name</td> <td> <input type="text" name="nm"> </td> </tr>
<tr> <td>Designation</td> <td> <select name="des"> 
								<option> 101 </option>
								<option> 102 </option> 
								<option> 103 </option>
								</select>
						 </td> </tr>

<tr> <td>Password</td> <td> <input type="password" name="pw"> </td> </tr>
<tr> <td> <input type="submit" value="submit"> </td> </tr>
</table>

<a href="view.jsp"> View </a>

</form>
</body>
</html>