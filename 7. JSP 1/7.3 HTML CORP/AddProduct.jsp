<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h1>Add a New Product</h1>
    <form action="AddProduct.jsp" method="post">
        <!-- New field for Product ID -->
        <label for="id">Product ID:</label>
        <input type="text" name="id" required><br>
        
        <label for="name">Product Name:</label>
        <input type="text" name="name" required><br>
        
        <label for="price">Price:</label>
        <input type="text" name="price" required><br>
        
        <input type="submit" value="Add Product">
    </form>

    <%
        String id = request.getParameter("id");  // Get the Product ID from the form
        String name = request.getParameter("name");
        String price = request.getParameter("price");

        if (id != null && name != null && price != null) {
            try {
                // Database connection details
                String jdbcURL = "jdbc:mysql://localhost:3307/customer"; // Update with your database URL
                String dbUser = "root";  // Update with your DB username
                String dbPassword = "12345";  // Update with your DB password

                // Establish a database connection
                Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                // Prepare SQL query to insert the product with a specified ID
                String query = "INSERT INTO products (id, name, price) VALUES (?, ?, ?)";

                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(id));  // Set the Product ID
                pstmt.setString(2, name);  // Set the Product Name
                pstmt.setString(3, price);  // Set the Product Price
                pstmt.executeUpdate();

                // Display a success message
                out.println("<p>Product added successfully! Product ID: " + id + "</p>");

                // Close resources
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error adding product: " + e.getMessage() + "</p>");
            }
        }
    %>

    <a href="ListProduct.jsp">View Products</a>
</body>
</html>
