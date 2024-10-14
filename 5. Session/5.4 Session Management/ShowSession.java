import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ShowSession")
public class ShowSession extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ShowSession() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String heading;
        Integer accessCount = (Integer) session.getAttribute("accessCount");
        if (accessCount == null) {
            accessCount = 0;
            heading = "Welcome, Newcomer";
        } else {
            heading = "Welcome Back";
            accessCount += 1;
        }
        session.setAttribute("accessCount", accessCount);
        PrintWriter out = response.getWriter();
        String title = "Session Tracking Example";
        String docType = "<!DOCTYPE HTML>\n";    
        out.println(docType +
            "<HTML>\n" +
            "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n" +
            "<BODY BGCOLOR=\"#FDF5E6\">\n" +
            "<CENTER>\n" +
            "<H1>" + heading + "</H1>\n" +
            "<H2>Information on Your Session:</H2>\n" +
            "<TABLE BORDER=1>\n" +
            "<TR BGCOLOR=\"#FFAD00\">\n" +
            " <TH>Info Type</TH><TH>Value</TH>\n" +
            "<TR>\n" +
            " <TD>ID</TD>\n" +
            " <TD>" + session.getId() + "</TD>\n" +
            "<TR>\n" +
            " <TD>Creation Time</TD>\n" +
            " <TD>" + new Date(session.getCreationTime()) + "</TD>\n" +
            "<TR>\n" +
            " <TD>Time of Last Access</TD>\n" +
            " <TD>" + new Date(session.getLastAccessedTime()) + "</TD>\n" +
            "<TR>\n" +
            " <TD>Number of Previous Accesses</TD>\n" +
            " <TD>" + accessCount + "</TD>\n" +
            "</TABLE>\n" +
            "</CENTER></BODY></HTML>");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // This method can be left empty if not used
    }
}
