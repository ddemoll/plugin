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
import plugIn.QueueEntry;

@WebServlet("/Queue")
public class Queue extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		int memberID = Integer.parseInt(request.getParameter("memberID"));
		int movieID = Integer.parseInt(request.getParameter("movieID"));
		String movieTitle = request.getParameter("movieTitle");
		
		Map<Integer, QueueEntry> queueMap = ((Map<Integer, QueueEntry>)request.getSession().getAttribute("queueMap"));
		SortedSet<QueueEntry> queueSet = ((SortedSet<QueueEntry>)request.getSession().getAttribute("queueSet"));
		
		DbBean sql = new DbBean();
		
		if(action.equals("add")) {
		
		    int sequenceNum = sql.addToQueue(memberID, movieID, movieTitle);
			if(sequenceNum != -1) {
				QueueEntry movie = new QueueEntry(sequenceNum, movieID, movieTitle);
				queueMap.put(movieID, movie);
				queueSet.add(movie);
			}
		} else if(action.equals("delete")) {
			
			sql.deleteFromQueue(memberID, movieID);
			
			queueSet.remove(queueMap.get(movieID));
			queueMap.remove(movieID);
		}
			
	
			
	}
	
	

}
