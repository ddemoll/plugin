package plugIn;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {    
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String loginURI = request.getContextPath() + "/Login";
        String logoutURI = request.getContextPath() + "/Logout";
        String regURI = request.getContextPath() + "/registration.jsp";
        String reg2URI = request.getContextPath() + "/register.jsp";
        String searchURI = request.getContextPath() + "/search.jsp";
        String resultsURI = request.getContextPath() + "/result.jsp";
        String detailsURI = request.getContextPath() + "/details.jsp";
        String validateURI = request.getContextPath() + "/Validate";
        String profileURI = request.getContextPath() + "/profile.jsp";
        String editProfileURI = request.getContextPath() + "/edit.jsp";

        boolean loggedIn = session != null && session.getAttribute("id") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean logoutRequest = request.getRequestURI().equals(logoutURI);
        boolean regRequest = request.getRequestURI().equals(regURI);
        boolean reg2Request = request.getRequestURI().equals(reg2URI);
        boolean searchRequest = request.getRequestURI().equals(searchURI);
        boolean resultsRequest = request.getRequestURI().equals(resultsURI);
        boolean detailsRequest = request.getRequestURI().equals(detailsURI);
        boolean validateRequest = request.getRequestURI().equals(validateURI);
        boolean profileRequest = request.getRequestURI().equals(profileURI);
        boolean editProfileRequest = request.getRequestURI().equals(editProfileURI);
        
        if(!loggedIn && (detailsRequest ||  logoutRequest || editProfileRequest || profileRequest)) {
        	response.sendRedirect(loginURI);
        	
        } else {
        	chain.doFilter(request, response);
        }
    }


}