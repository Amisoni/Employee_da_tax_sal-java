package employee;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Insert
 */
@WebServlet("/Insert")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("nm");
		String designation = request.getParameter("des");
	
		String password = request.getParameter("pw");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		// loads mysql driver
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amii", "root", ""); // create new connection with test database
		
		String query="insert into employee values(NULL,?,?,?)";
		
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);  // generates sql query
		
		ps.setString(1,name);
		ps.setString(2,designation);
		ps.setString(3,password);
		
	
		
		ps.executeUpdate(); // execute it on test database
		System.out.println("successfuly inserted");
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
