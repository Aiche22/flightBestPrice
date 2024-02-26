<%@ page import="com.rimbestprice.rimbestprice.models.Flight" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Flights</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: blue;
        }
        a:hover {
            text-decoration: underline;
        }
        .lobster-font {
            font-family: 'Lobster', cursive;
        }
    </style>
</head>
<body>
<h2 class="lobster-font">List of Flights</h2>
<table>
    <tr>
        <th class="lobster-font">Departure City</th>
        <th class="lobster-font">Arrival City</th>
        <th class="lobster-font">Departure Date</th>
        <th class="lobster-font">Arrival Date</th>
        <th class="lobster-font">Price</th>
        <th class="lobster-font">Company Aerienne</th>
        <th class="lobster-font">Details</th>
    </tr>
    <%
        List<Flight> flights = (List<Flight>) request.getAttribute("flights");
        Collections.sort(flights, Comparator.comparingDouble(Flight::getPrice));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        for (Flight flight : flights) {
    %>
    <tr>
        <td><%= flight.getDepartureCity() %></td>
        <td><%= flight.getArrivalCity() %></td>
        <td><%= sdf.format(flight.getDepartureDate()) %></td>
        <td><%= sdf.format(flight.getArrivalDate()) %></td>
        <td><%= flight.getPrice() %></td>
        <td><%= flight.getCompanyAerienne().getNom() %></td>
        <td><a href="<%= request.getContextPath() %>/flightDetails?flightNumber=<%= flight.getFlightNumber() %>">Details</a></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
