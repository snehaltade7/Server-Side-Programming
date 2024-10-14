<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
</head>
<body>
<h4>Customer List</h4>
<a href="NewCustomer.jsp">Add New</a>
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
    String sql = "SELECT * FROM customer_db";
    rs = stmt.executeQuery(sql);
    int cnt = 1;
%>
<table border="1">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th colspan="2" align="center">Action</th>
        </tr>
    </thead>
    <tbody>
    <%
    while (rs.next()) {
        int cid = rs.getInt("id");
        String cname = rs.getString("name");
        String caddress = rs.getString("address");
    %>
        <tr>
            <td><%= cnt %></td>
            <td><%= cid %></td>
            <td><%= cname %></td>
            <td><%= caddress %></td>
            <td><a href="EditCustomer.jsp?id=<%= cid %>">Edit</a></td>
            <td><a href="DeleteCustomer.jsp?id=<%= cid %>">Delete</a></td>
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
