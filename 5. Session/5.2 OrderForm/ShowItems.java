import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/ShowItems")
public class ShowItems extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ShowItems() {
        super();
    }
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String> previousItems = (List<String>) session.getAttribute("previousItems");
        if (previousItems == null) {
            previousItems = new ArrayList<>();
            session.setAttribute("previousItems", previousItems);
        }
        String newItem = request.getParameter("newItem");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "Items Purchased";
        String docType = "<!DOCTYPE HTML>\n";
        out.println(docType +
            "<HTML>\n" +
            "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n" +
            "<BODY BGCOLOR=\"#FDF5E6\">\n" +
            "<H1>" + title + "</H1>");
        synchronized (previousItems) {
            if (newItem != null && !newItem.trim().isEmpty()) {
                previousItems.add(newItem);
            }
            if (previousItems.isEmpty()) {
                out.println("<I>No items</I>");
            } else {
                out.println("<UL>");
                for (String item : previousItems) {
                    out.println("<LI>" + item + "</LI>");
                }
                out.println("</UL>");
            }
        }
        out.println("</BODY></HTML>");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  }
}
