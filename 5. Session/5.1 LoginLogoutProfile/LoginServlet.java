import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		     String userid= request.getParameter("userid");
		    
			String password = request.getParameter("password");
		     
		     HttpSession session = request.getSession();
		     if(password.equals("admin"))
		     {
		    	 session.setAttribute("userid", userid);
		    	 response.sendRedirect("./ProfileServlet");
		    	 
		     }
		     else
		     {
		    	 response.sendRedirect("Login.html");
		     
	}
	}

	}