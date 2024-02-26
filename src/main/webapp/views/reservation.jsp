<!DOCTYPE html>
<html>
<head>
    <title>Reservation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('static/images/PEVTJACBCUI6VG3Z2NTLW2NO4E.jpg');
            background-size: cover; /* Pour couvrir tout l'écran */
            background-position: center; /* Pour centrer l'image */
            background-repeat: no-repeat; /* Pour éviter la répétition de l'image */
            text-align: center;
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
        <a href="make_payment">Paiement</a>
    </div>
</div>
<div class="container">
    <h1>Welcome to RimBestPrice</h1>

    <form action="flightList" method="post">
        <h2>Flight Search</h2>
        <p>Entrez votre Departure City et votre Arrival City pour trouver les vols </p>
        <label for="departureCity">Departure City</label><br>
        <input type="text" name="departureCity" id="departureCity" required><br>
        <label for="arrivalCity">Arrival City</label><br>
        <input type="text" name="arrivalCity" id="arrivalCity" required><br>
        <input type="submit" value="Search Flights">
    </form>
</div>
</body>
</html>
