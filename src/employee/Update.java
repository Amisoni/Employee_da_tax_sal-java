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
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String no = request.getParameter("no");
		String name = request.getParameter("nm");
		String designation = request.getParameter("des");
		String Password = request.getParameter("Password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		// loads mysql driver
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amii", "root", ""); // create new connection with test database
		
		String query="update employee set name=? ,designation=? ,Password=?  where no=?";
		
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);  // generates sql query
		
		ps.setString(1,name);
		ps.setString(2,designation);
		ps.setString(3,Password);
		ps.setInt(4, Integer.parseInt(no));
		
		ps.executeUpdate(); // execute it on test database
		System.out.println("successfuly Updated");
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
