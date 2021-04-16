package employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String no = request.getParameter("no");
		String name = request.getParameter("nm");
		String designation = request.getParameter("des");
		String salary = request.getParameter("sal");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		// loads mysql driver
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ami", "root", ""); // create new connection with test database
		
		String query="delete from  employee  where no=?";
		
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);  // generates sql query
		ps.setInt(1, Integer.parseInt(no));

		
		
		ps.executeUpdate(); // execute it on test database
		System.out.println("successfuly Delete");
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
