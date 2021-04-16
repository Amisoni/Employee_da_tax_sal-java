package employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@SuppressWarnings("unused")
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		 String name=request.getParameter("name");
		 String password=request.getParameter("password");
		 try
		 {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amii", "root", "");
			 
			PreparedStatement pst = con.prepareStatement("select name,password from employee where name=? and password=?");
			pst.setString(1, name);
			pst.setString(2, password);
			ResultSet rs=pst.executeQuery();
			
			if(rs.next())
			{
				
				//response.sendRedirect("welcome.html");
				
				HttpSession session=request.getSession();
				session.setAttribute("name",name);
				session.setAttribute("password",password);
				//response.sendRedirect("welcome.jsp?name="+rs.getString(1));
				//response.sendRedirect("welcome.jsp");
				//out.print("login");
				System.out.print("login success");
				System.out.print(name);
				response.sendRedirect("welcom.jsp");
			}
			else
			{
				out.print("error");
				
			}
				
		 }
		 catch(Exception e){}
	       
	        
	}

}
