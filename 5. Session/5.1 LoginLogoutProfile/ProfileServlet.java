import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response ) 
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session= request.getSession(false);
		if(session!=null)
		{
			String userid = (String) session.getAttribute("userid");
			out.println("<h2>Welcome to ProfileServlet</h2>" +userid);
		}
		else
		{  response.sendRedirect("Login.html");  }
		response.setContentType("text/html");
		out.println("<a href =\"index.html\">Index</a>");
	}
}
