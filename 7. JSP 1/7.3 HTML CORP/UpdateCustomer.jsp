<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
</head>
<body>

<h2>Update Customer</h2>
<hr/>

<%
    // Get the customer details from the form
    String idParam = request.getParameter("id");
    String name = request.getParameter("name");
    String address = request.getParameter("address");

    if (idParam != null && name != null && address != null) {
        int id = Integer.parseInt(idParam);
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");

            // Prepare the SQL update query
            String sql = "UPDATE customer_db SET name = ?, address = ? WHERE id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, address);
            stmt.setInt(3, id);

            // Execute the update
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<p>Customer updated successfully!</p>");
            } else {
                out.println("<p>Failed to update customer. No record found with ID " + id + "</p>");
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
        out.println("<p>Missing ID or other parameters.</p>");
    }
%>

<a href="CustomerList.jsp">Back to Customer List</a>

</body>
</html>
