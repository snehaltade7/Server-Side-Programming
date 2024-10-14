<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Customer</title>
</head>
<body>

<h2>Delete Customer Record</h2>
<hr/>
<%
    // Get the customer ID from the request
    String idParam = request.getParameter("id");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");

            // Prepare the SQL query to fetch customer details
            String sql = "SELECT * FROM customer_db WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
    %>
                <!-- Display customer details and a form to delete the record -->
                <p>ID: <%= rs.getInt("id") %></p>
                <p>Name: <%= rs.getString("name") %></p>
                <p>Address: <%= rs.getString("address") %></p>
                <form method="post" action="DeleteCustomerProcess.jsp">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                    <input type="submit" value="Delete" />
                </form>
                <a href="CustomerList.jsp">Keep The Record</a>
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
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<p>No ID provided.</p>");
    }
%>

</body>
</html>
