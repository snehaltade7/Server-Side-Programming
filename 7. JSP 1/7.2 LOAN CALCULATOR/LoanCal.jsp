<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Loan Calculation Result</title>
</head>
<body>
    <h2>Loan Calculation Result</h2>
    <%
        // Get loan details from the form
        double loanAmount = Double.parseDouble(request.getParameter("loanAmount"));
        double annualInterestRate = Double.parseDouble(request.getParameter("interestRate"));
        int numberOfYears = Integer.parseInt(request.getParameter("years"));
        // Calculate monthly interest rate
        double monthlyInterestRate = annualInterestRate / 100 / 12;
        // Calculate the number of months
        int numberOfMonths = numberOfYears * 12;
        // Calculate the monthly payment using the formula
        double monthlyPayment = (loanAmount * monthlyInterestRate) /
                (1 - Math.pow(1 + monthlyInterestRate, -numberOfMonths));
        // Calculate total payment
        double totalPayment = monthlyPayment * numberOfMonths;
        // Display results
        out.println("<p>Loan Amount: " + loanAmount + "</p>");
        out.println("<p>Annual Interest Rate: " + annualInterestRate + "%</p>");
        out.println("<p>Number of Years: " + numberOfYears + "</p>");
        out.println("<p>Monthly Payment: " + String.format("%.2f", monthlyPayment) + "</p>");
        out.println("<p>Total Payment: " + String.format("%.2f", totalPayment) + "</p>");
    %>
    <a href="index.html">Go Back</a>
</body>
</html>
    