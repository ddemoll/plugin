package ajax;



import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plugIn.DbBean;
import plugIn.Member;
import plugIn.QueueEntry;

@WebServlet("/Like")
public class Like extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		Member user = (Member)request.getSession().getAttribute("user");
		int movieID = Integer.parseInt(request.getParameter("movieID"));
		DbBean sql = new DbBean();
		if(action.equals("Like")) sql.likeMovie(movieID, user.getMemberID());
		else sql.unlikeMovie(movieID, user.getMemberID());
			
	}
	
	

}
