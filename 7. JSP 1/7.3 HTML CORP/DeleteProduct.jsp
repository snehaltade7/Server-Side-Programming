<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
</head>
<body>
    <h2>Delete Product</h2>
    <hr>
    <%
        // Get the id parameter from the request
        String idParam = request.getParameter("id");
        
        // Debug output to check if the id parameter is received
        out.println("Received ID parameter: " + (idParam == null ? "null" : idParam));

        if (idParam != null && !idParam.isEmpty()) {
            int id = 0;
            try {
                id = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                out.println("Invalid ID format.");
                e.printStackTrace();
                return; // Exit the JSP page early
            }

            Connection con = null;
            PreparedStatement stmt = null;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");

                // Prepare the SQL query
                String sql = "DELETE FROM products WHERE id = ?";
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, id);

                // Execute the delete
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Product deleted successfully!");
                } else {
                    out.println("Failed to delete product. No record found with ID: " + id);
                }
            } catch (ClassNotFoundException e) {
                out.println("JDBC Driver not found: " + e.getMessage());
                e.printStackTrace();
            } catch (SQLException e) {
                out.println("SQL Exception: " + e.getMessage());
                e.printStackTrace();
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("SQL Exception in finally block: " + e.getMessage());
                    e.printStackTrace();
                }
            }
        } else {
            out.println("No ID provided.");
        }
    %>
    <a href="index.jsp">Home</a>
</body>
</html>
