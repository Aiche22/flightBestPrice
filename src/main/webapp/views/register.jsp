<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to RimBestPrice </title>
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
        input[type="email"],
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
        input[type="email"]::placeholder,
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
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
</head>
<body>
<div class="footer-image"></div>
<h1>Welcome to RimBestPrice</h1>
<p>Rejoignez-nous aujourd'hui pour bénéficier des meilleures offres !</p>
<form action="register" method="post">
    Username <input type="text" name="username" required><br>
    Email <input type="email" name="email" required><br>
    Password <input type="password" name="password" required><br>
    <input type="submit" value="Register">
</form>
</body>
</html>
