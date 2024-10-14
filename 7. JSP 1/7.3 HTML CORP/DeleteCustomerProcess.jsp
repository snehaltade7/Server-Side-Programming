<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Customer</title>
</head>
<body>

<h2>Delete Customer</h2>
<hr/>

<%
    // Get the customer ID from the form
    String idParam = request.getParameter("id");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");

            // Prepare the SQL delete query
            String sql = "DELETE FROM customer_db WHERE id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            // Execute the delete
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<p>Customer deleted successfully!</p>");
            } else {
                out.println("<p>Failed to delete customer. No record found with ID " + id + "</p>");
            }
        } catch (ClassNotFoundException e) {
            out.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<p>No ID provided.</p>");
    }
%>

<a href="CustomerList.jsp">Back to Customer List</a>

</body>
</html>
