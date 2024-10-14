package p1;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/InsertUser")
@MultipartConfig
public class InsertUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        // Retrieve file part
        Part filePart = request.getPart("imgfile");
        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().println("<h1>Error: No file uploaded!</h1>");
            return;
        }

        InputStream inputStream = filePart.getInputStream(); // Retrieve input stream of file

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3307/imgdb?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "root"; // Your MySQL username
        String dbPassword = "12345"; // Your MySQL password

        // Hash the password
        String hashedPassword = hashPassword(password);

        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
            String insertUserQuery = "INSERT INTO images (name, password, imgfile) VALUES (?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(insertUserQuery)) {
                ps.setString(1, name);
                ps.setString(2, hashedPassword);
                ps.setBlob(3, inputStream); // Insert the image as a BLOB
                ps.executeUpdate();
                response.sendRedirect("login.jsp"); // Redirect to login page after success
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }

    // Password hashing using SHA-256
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
