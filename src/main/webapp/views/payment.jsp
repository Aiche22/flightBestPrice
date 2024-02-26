<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rimbestprice.rimbestprice.models.User"%>
<%@ page import="java.util.Objects"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #b9c1cc;
            color: white;
            padding: 20px 20px;
            margin-bottom: 20px;
            display: flex;
            justify-content: flex-start;
        }
        .navbar a {
            color: black;
            text-decoration: none;
            margin-right: 20px;
            font-size: 18px;
            font-family: 'Lobster', cursive;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Fond blanc légèrement transparent */
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            font-family: 'Lobster', cursive;
        }
        form {
            padding: 30px;
        }
        input[type="text"] {
            width: calc(100% - 24px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #478ac9;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
        }
        label {
            font-family: 'Lobster', cursive;
            font-size: 22px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div>
        <a href="register">Register</a>
        <a href="login">Login</a>

    </div>
</div>

<%
    // Check if the user is logged in
    User user = (User) request.getSession().getAttribute("user");
    boolean isLoggedIn = Objects.nonNull(user);
    String ticket = (String) request.getAttribute("ticket");
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <% if (isLoggedIn) { %>
                    <h2 class="card-title">Payment Form</h2>
                    <p class="card-text">Welcome, <%= user.getUsername() %>!</p>
                    <form action="make_payment" method="post">
                        <div class="mb-3">
                            <label for="cardNumber" class="form-label">Card Number</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="owner" class="form-label">Owner</label>
                            <input type="text" class="form-control" id="owner" name="owner" required>
                        </div>
                        <div class="mb-3">
                            <label for="cvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" required>
                        </div>
                        <div class="mb-3">
                            <label for="expirationDate" class="form-label">Expiration Date</label>
                            <input type="text" class="form-control" id="expirationDate" name="expirationDate" required>
                        </div>
                        <div class="mb-3">
                            <label for="accountNumber" class="form-label">Account Number</label>
                            <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="amount" class="form-label">Amount</label>
                            <input type="text" class="form-control" id="amount" name="amount" required>
                        </div>
                        <input type="hidden" value="<%= ticket %>" name="ticket" >
                        <button type="submit" class="btn btn-primary">Make Payment</button>
                    </form>
                    <% } else { %>
                    <p class="card-text">You need to be logged in to make a payment. Please <a href="login">login</a>.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
