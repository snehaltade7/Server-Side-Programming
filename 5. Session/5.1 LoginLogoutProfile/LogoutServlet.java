import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException 
				{
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession(false);
			session.invalidate();
			out.println("<h2>You are succefully logged out</h2>");
			response.setContentType("text/html");
			out.println("<a href ='index.html'>Index</a>");
			
			
				}
	
	}