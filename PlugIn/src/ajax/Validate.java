package ajax;



import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plugIn.DBConnection;

@WebServlet("/Validate")
public class Validate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.html").forward(request, response);
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean status = false;
		String type = request.getParameter("type");
		if(type.equals("username"))
			status = checkField("userName", request.getParameter("username"));
		else status = checkField("emailAddress", request.getParameter("email"));
		
		response.setContentType("application/json");  
	    PrintWriter out = response.getWriter();  
	    out.print("{\"valid\": "+status+"}");
	         
	          
	
		out.close();
	}
	private boolean checkField(String field, String value) {
		boolean status=false;  
		try{  
			Connection con = DBConnection.getConnection();
			
			PreparedStatement ps=con.prepareStatement("select * from member where "+field+"=?");  
			ps.setString(1,value);  

			      
			ResultSet rs=ps.executeQuery();  
			status=!rs.next();  
			          
			}catch(Exception e){System.out.println(e);}  
			return status;
			}  

}
