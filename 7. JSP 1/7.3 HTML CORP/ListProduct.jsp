<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
<h4>Customer List</h4>
<a href="AddProduct.jsp">Add New</a>
<hr>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    // Load the JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    // Establish the connection
    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/customer", "root", "12345");

    // Execute SQL query
    stmt = con.createStatement();
    String sql = "SELECT * FROM products";
    rs = stmt.executeQuery(sql);
    int cnt = 1;
%>
<table border="1">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th colspan="2" align="center">Action</th>
        </tr>
    </thead>
    <tbody>
    <%
    while (rs.next()) {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String address = rs.getString("price");
    %>
        <tr>
            <td><%= cnt %></td>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= address %></td>
            <td><a href="EditProduct.jsp?id=<%= id %>">Edit</a></td>
            <td><a href="DeleteProduct.jsp?id=<%= id %>">Delete</a></td>
        </tr>
        <%
        cnt++;
    }
    %>
    </tbody>
</table>
<%
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
%>
</body>
</html>
