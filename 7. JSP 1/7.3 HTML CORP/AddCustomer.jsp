<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
</head>
 
<body>
    <h2>Add Customer</h2>
    <hr>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        out.println("The id is : " + id + " Name : " + name + " Address : " + address);

        Connection con = null;
        PreparedStatement stmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");
            
            // Prepare the SQL query
            String sql = "INSERT INTO customer_db (id, name, address) VALUES (?, ?, ?)";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setString(2, name);
            stmt.setString(3, address);
            
            // Execute the query
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("Customer added successfully!");
            } else {
                out.println("Failed to add customer.");
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
    %>
    <a href="index.jsp">Home</a>
</body>
</html>
