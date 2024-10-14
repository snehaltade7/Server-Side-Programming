<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    HttpSession sesh = request.getSession(false);
    if (sesh != null) {
        sesh.invalidate();
    }
    response.sendRedirect("login.jsp");
%>


