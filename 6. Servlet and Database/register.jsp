<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
    <h1>Registration Page</h1>
    <form method="post" action="InsertUser" enctype="multipart/form-data">
        Name: <input type="text" name="name" required><br>
        Password: <input type="password" name="password" required><br>
        Image: <input type="file" name="imgfile" accept="image/*" required><br>
        <input type="submit" value="Register">
    </form>
    <a href="index.jsp">Back</a>
</body>
</html>
