package plugIn;



import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private Map<Integer, QueueEntry> queueMap;
	private SortedSet<QueueEntry> queueSet;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null)
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		else request.getRequestDispatcher("index.jsp").forward(request, response);
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
	
	         
	    Member user = login(email, password);
	   
	    if(user.getMemberID() != 0 && loadQueue(user.getMemberID())){  
	    	
	    	request.getSession().setAttribute("id", user.getMemberID());
	    	request.getSession().setAttribute("user", user);
	    	request.getSession().setAttribute("queueMap", queueMap);
	    	request.getSession().setAttribute("queueSet", queueSet);
	    	
	        RequestDispatcher rd=request.getRequestDispatcher("browse.jsp");  
	        rd.include(request,response);  
	    }  
	    else{   
	        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
	        request.setAttribute("errorMsg", "Username or password incorrect");
	        rd.include(request,response);  
	    }   
	}
	private static Member login(String email,String password){  
		Member user = new Member();
		try{  
		Connection con = DBConnection.getConnection();
		String pass = Hash.generateHash(password);
		
		PreparedStatement ps=con.prepareStatement("select * from member where (userName=? OR emailAddress=?) AND memberPassword=? AND activeStatus = 1");  
		ps.setString(1,email);  
		ps.setString(2,email);  
		ps.setString(3,pass); 
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()) {
			
			user.setMemberID(rs.getInt(1));
			user.setLevelName(rs.getString(2));
			user.setUsername(rs.getString(3));
			user.setFirstName(rs.getString(4));
			user.setLastName(rs.getString(5));
			user.setBillingAddress1(rs.getString(6));
			user.setBillingAddress2(rs.getString(7));
			user.setBillingCity(rs.getString(8));
			user.setBillingState(rs.getString(9));
			user.setBillingZip(rs.getString(10));
			user.setShippingAddress1(rs.getString(11));
			user.setShippingAddress2(rs.getString(12));
			user.setShippingCity(rs.getString(13));
			user.setShippingState(rs.getString(14));
			user.setShippingZip(rs.getString(15));
			user.setPhone(rs.getString(16));
			user.setEmail(rs.getString(17));
			user.setMemberSince(rs.getDate(19));
			user.setActiveStatus(rs.getInt(20));
			user.setFavoriteGenre(rs.getString(21));
			user.setCcv(rs.getInt(22));
			user.setCcNumber(rs.getString(23));
			user.setCcFirstName(rs.getString(24));
			user.setCcLastName(rs.getString(25));
			user.setExpDate(rs.getInt(27)+"-"+rs.getInt(26));
			user.setExpMonth(rs.getInt(27));
			user.setExpYear(rs.getInt(26));
			user.setCcType(rs.getString(28));
		
		}
		          
		}catch(Exception e){System.out.println(e);}  
		return user;
	}  
	public boolean loadQueue(int memberID) {
		
		queueMap = new TreeMap<Integer, QueueEntry>();
		queueSet = new TreeSet<QueueEntry>((m1,m2)->m1.getQueueSequence()-m2.getQueueSequence());
	
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT movieID, queueSequence, movieTitle FROM queue WHERE memberID = ?;");
			stmt.setInt(1, memberID);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				QueueEntry m = new QueueEntry(rs.getInt(2), rs.getInt(1), rs.getString(3));
				queueMap.put(m.getMovieID(), m);
				queueSet.add(m);
			}
			return true;
			
		}
		catch(SQLException e) {
			System.out.println(e);
			return false;
		}
		
		
	}
	

}
