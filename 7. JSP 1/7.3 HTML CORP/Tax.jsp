<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.*" %>

<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3307/customer"; // Update with your database URL
    String user = "root"; // Update with your DB username
    String password = "12345"; // Update with your DB password
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    // Decimal formatter for currency formatting
    DecimalFormat df = new DecimalFormat("#.##");

    // Use a List to store product details with tax
    List<Map<String, String>> productsWithTax = new ArrayList<>();
    
    try {
        // Load JDBC driver (e.g., MySQL)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        conn = DriverManager.getConnection(url, user, password);

        // Create a statement
        stmt = conn.createStatement();

        // SQL query to fetch product details
        String query = "SELECT id, name, price FROM products"; // Update with your table and column names
        rs = stmt.executeQuery(query);

        // Process result set and calculate tax
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            double tax = price * 0.05; // Calculate 5% tax
            double finalPrice = price + tax; // Calculate final price

            // Store product details in a Map
            Map<String, String> productMap = new HashMap<>();
            productMap.put("id", String.valueOf(id));
            productMap.put("name", name);
            productMap.put("price", df.format(price));
            productMap.put("tax", df.format(tax));
            productMap.put("finalPrice", df.format(finalPrice));

            // Add to the List
            productsWithTax.add(productMap);
        }

        // Store the List in the session
        HttpSession Session = request.getSession();
        session.setAttribute("productsWithTax", productsWithTax);

%>

<!-- Display the products and tax in a table -->
<h2>Product Tax Calculation</h2>
<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Original Price</th>
        <th>Tax (5%)</th>
        <th>Final Price</th>
    </tr>
<%
        // Loop through the list and display product details with the final price
        for (Map<String, String> product : productsWithTax) {
%>
    <tr>
        <td><%= product.get("id") %></td>
        <td><%= product.get("name") %></td>
        <td><%= product.get("price") %></td>
        <td><%= product.get("tax") %></td>
        <td><%= product.get("finalPrice") %></td>
    </tr>
<%
        }
%>
</table>

<!-- Link to the invoice generation page -->
<a href="Invoice.jsp">Generate Invoice</a>

<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        // Close resources
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
