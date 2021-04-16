<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="Insert_tax" method="post">
<table>

<tr> <td>DA</td> <td> <input type="text" name="da"> </td> </tr>

<tr> <td>HRA</td> <td> <input type="text" name="hra"> </td> </tr>

<tr> <td>TAX</td> <td> <input type="text" name="tax"> </td> </tr>

<tr> <td>TOTAL</td> <td> <input type="text" name="tot"> </td> </tr>

<tr> <td> <input type="submit" value="submit"> </td> </tr>
</table>

<a href="view.jsp"> View </a>

</form>
</body>
</html>