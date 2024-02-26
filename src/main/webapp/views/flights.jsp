<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rimbestprice.rimbestprice.models.Flight"%>
<%@ page import="com.rimbestprice.rimbestprice.models.CompanyAerienne"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flights</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            padding: 20px;
        }
        .btn {
            margin-right: 5px;
        }
        .lobster-font {
            font-family: 'Lobster', cursive;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="lobster-font">Flights</h1>
    <form action="flight" method="post">
        <input type="hidden" name="action" id="action" value="<%= request.getAttribute("action") != null ? request.getAttribute("action") : "add" %>">
        <div class="mb-3">
            <label for="flightNumber" class="form-label">Flight Number</label>
            <input type="text" class="form-control" id="flightNumber" name="flightNumber">
        </div>
        <div class="mb-3">
            <label for="departureCity" class="form-label">Departure City</label>
            <input type="text" class="form-control" id="departureCity" name="departureCity">
        </div>
        <div class="mb-3">
            <label for="arrivalCity" class="form-label">Arrival City</label>
            <input type="text" class="form-control" id="arrivalCity" name="arrivalCity">
        </div>
        <div class="mb-3">
            <label for="departureDate" class="form-label">Departure Date</label>
            <input type="datetime-local" class="form-control" id="departureDate" name="departureDate">
        </div>
        <div class="mb-3">
            <label for="arrivalDate" class="form-label">Arrival Date</label>
            <input type="datetime-local" class="form-control" id="arrivalDate" name="arrivalDate">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="text" class="form-control" id="price" name="price">
        </div>
        <div class="mb-3">
            <label for="companyAerienneId" class="form-label">Company Aerienne</label>
            <select class="form-select" id="companyAerienneId" name="companyAerienneId">
                <% List<CompanyAerienne> companies = (List<CompanyAerienne>) request.getAttribute("companies");
                    for (CompanyAerienne company : companies) { %>
                <option value="<%= company.getId() %>"><%= company.getNom() %></option>
                <% } %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <h2 class="lobster-font">List of Flights</h2>
    <table class="table">
        <thead>
        <tr>
            <th>Flight Number</th>
            <th>Departure City</th>
            <th>Arrival City</th>
            <th>Departure Date</th>
            <th>Arrival Date</th>
            <th>Price</th>
            <th>Company Aerienne</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            List<Flight> flights = (List<Flight>) request.getAttribute("flights");
            for (Flight flight : flights) { %>
        <tr>
            <td><%= flight.getFlightNumber() %></td>
            <td><%= flight.getDepartureCity() %></td>
            <td><%= flight.getArrivalCity() %></td>
            <td><%= sdf.format(flight.getDepartureDate()) %></td>
            <td><%= sdf.format(flight.getArrivalDate()) %></td>
            <td><%= flight.getPrice() %></td>
            <td><%= flight.getCompanyAerienne().getNom() %></td>
            <td>
                <button type="button" class="btn btn-sm btn-primary" onclick="populateForm('<%= flight.getFlightNumber() %>', '<%= flight.getDepartureCity() %>', '<%= flight.getArrivalCity() %>', '<%= sdf.format(flight.getDepartureDate()) %>', '<%= sdf.format(flight.getArrivalDate()) %>', '<%= flight.getPrice() %>', '<%= flight.getCompanyAerienne().getId() %>')">Edit</button>
                <form action="flight" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="flightNumber" value="<%= flight.getFlightNumber() %>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
