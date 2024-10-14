<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
</head>
<body>

<h2>Update Product</h2>
<hr/>

<%
    // Get the product details from the form
    String idParam = request.getParameter("id");
    String name = request.getParameter("name");
    String priceParam = request.getParameter("price");

    if (idParam != null && name != null && priceParam != null) {
        int id = Integer.parseInt(idParam);
        double price = Double.parseDouble(priceParam); // Convert price to double
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");

            // Prepare the SQL update query
            String sql = "UPDATE products SET name = ?, price = ? WHERE id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, name);  // Set name
            stmt.setDouble(2, price); // Set price
            stmt.setInt(3, id);       // Set ID for WHERE clause

            // Execute the update
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<p>Product updated successfully!</p>");
            } else {
                out.println("<p>Failed to update product. No record found with ID " + id + "</p>");
            }
        } catch (ClassNotFoundException e) {
            out.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close resources
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<p>Missing ID, name, or price parameters.</p>");
    }
%>

<a href="ListProduct.jsp">Back to Product List</a>

</body>
</html>
