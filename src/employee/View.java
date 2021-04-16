package employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class View
 */
@WebServlet("/View")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		String name = request.getParameter("nm");
		String designation = request.getParameter("des");
		String salary = request.getParameter("sal");
try {
			
			Class.forName("com.mysql.jdbc.Driver");
		// loads mysql driver
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amii", "root", ""); // create new connection with test database
	
		Integer a=4;
		String query="select * from employee where no=?";
		
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(query); // generates sql query
		ps.setInt(1, a);
		ResultSet rs=ps.executeQuery();
		
		out.print("<table border='1'>");
		out.print("<tr> <th>Name</th> <th>Designation</th>	<th>Salary</th> <th>Edit</th> <th>Delete</th> </tr>");

		while(rs.next())
		{
			out.print("<tr><td>"+rs.getString(1)+"</td>");
			out.print("<td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td><a href=update.jsp>Update</a></td>");
			out.print("<td><a href=delete.jsp>Delete</a></td></tr>");
		}
		ps.executeUpdate(); // execute it on test database
		out.print("</table>");
		System.out.println("successfuly view");
		ps.close();
		con.close();
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
