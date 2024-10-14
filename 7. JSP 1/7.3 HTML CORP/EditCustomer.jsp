<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
</head>
<body>

<h2>Edit Customer</h2>
<hr/>
<form method="post" action="UpdateCustomer.jsp">
    <%
        // Get the customer ID from the request
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");

                // Prepare the SQL query to fetch customer details
                String sql = "SELECT * FROM customer_db WHERE id = ?";
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, id);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    String name = rs.getString("name");
                    String address = rs.getString("address");
    %>
                    <!-- Display the customer details in a form -->
                    ID: <input type="text" name="id" value="<%= id %>" readonly /><br>
                    Name: <input type="text" name="name" value="<%= name %>" required /><br>
                    Address: <input type="text" name="address" value="<%= address %>" required /><br>
                    <input type="submit" value="Update" />
    <%
                } else {
                    out.println("<p>No customer found with ID " + id + "</p>");
                }
            } catch (ClassNotFoundException e) {
                out.println("JDBC Driver not found: " + e.getMessage());
                e.printStackTrace();
            } catch (SQLException e) {
                out.println("SQL Exception: " + e.getMessage());
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        } else {
            out.println("<p>No ID provided.</p>");
        }
    %>
</form>

<a href="CustomerList.jsp">Back to Customer List</a>

</body>
</html>
