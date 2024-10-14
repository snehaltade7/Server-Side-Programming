<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.*" %>

<%
    // Decimal formatter for currency formatting
    DecimalFormat df = new DecimalFormat("#.##");

    // Retrieve the List of products with tax from the session
    HttpSession Session = request.getSession(false); // Do not create a new session
    List<Map<String, String>> productsWithTax = (List<Map<String, String>>) session.getAttribute("productsWithTax");

    // Initialize total bill amount
    double totalBill = 0.0;

    if (productsWithTax != null) {
%>

<h2>Invoice</h2>
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
            double finalPrice = Double.parseDouble(product.get("finalPrice"));
            totalBill += finalPrice; // Add to total bill
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

<!-- Display the total bill amount -->
<h2>Total Bill Amount: <%= df.format(totalBill) %></h2>

<%
    } else {
%>
    <p>No product data available. Please calculate tax first.</p>
<%
    }
%>
