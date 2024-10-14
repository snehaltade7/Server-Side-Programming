package p1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class MyServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
    public MyServlet() {
        super();
    }
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.getWriter().append("Served at: ").append(request.getContextPath());
response.setContentType("text/html");
PrintWriter out =response.getWriter();
System.out.println("<html><body><h1>");
System.out.println("This is my servlet</h1>");
System.out.println("<h2>Hello Snehal</h2>");
System.out.println("This is my SSP program");
System.out.println("</body></html>");
	}
}
