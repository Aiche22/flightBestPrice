<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to RimBestPrice - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }
        h1 {
            font-family: 'Lobster', cursive;
        }
        form {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-family: 'Lobster', cursive; /* Police */
            font-size: 22px; /* Taille du texte */
        }
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 24px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 20px;
            font-size: 22px; /* Taille du texte */
            font-family: 'Lobster', cursive; /* Police */
        }
        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            font-family: 'Lobster', cursive; /* Police pour le placeholder */
        }
        input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #478ac9; /* Couleur bleue */
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 18px;
        }
        input[type="submit"]:hover {
            background-color: #858e99; /* Couleur bleue plus foncée au survol */
        }
        .footer-image {
            background-image: url("static/images/Avion.jpg");
            background-size: cover; /* Ajuste la taille de l'image pour remplir complètement le conteneur */
            background-position: center; /* Centre l'image dans le conteneur */
            height: 200px; /* Hauteur de votre élément div */
            margin-top: 20px; /* Ajout de marge en haut */
        }
        .register-link {
            font-size: 18px;
            margin-top: 20px;
            font-family: 'Lobster', cursive;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
</head>
<body>
<div class="footer-image"></div>
<h1>Welcome to RimBestPrice</h1>
<h2>Login</h2>
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
<p style="color:red;"><%= errorMessage %></p>
<% } %>
<div>
    <form action="login" method="post">
        <label for="username" style="font-family: 'Lobster', cursive; font-size: 22px;">Username</label><br>
        <input type="text" id="username" name="username" required><br>
        <label for="password" style="font-family: 'Lobster', cursive;">Password</label><br>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <a href="register" class="register-link">Don't have an account? Register here</a>
</div>

</body>
</html>
