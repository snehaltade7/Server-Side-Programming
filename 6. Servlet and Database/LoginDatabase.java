package p1;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginDatabase")
public class LoginDatabase extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        String dbURL = "jdbc:mysql://localhost:3307/imgdb?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "root"; // Your MySQL username
        String dbPassword = "12345"; // Your MySQL password

        String hashedPassword = hashPassword(password);

        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
            String sqlQuery = "SELECT password FROM images WHERE name = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlQuery)) {
                ps.setString(1, name);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        String storedPassword = rs.getString("password");
                        if (storedPassword.equals(hashedPassword)) {
                            HttpSession session = request.getSession();
                            session.setAttribute("username", name);
                            response.sendRedirect("welcome.jsp");
                        } else {
                            request.setAttribute("loginError", "Invalid username or password.");
                            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                            rd.include(request, response);
                        }
                    } else {
                        request.setAttribute("loginError", "Invalid username or password.");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.include(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
