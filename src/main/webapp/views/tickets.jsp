<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rimbestprice.rimbestprice.models.Ticket"%>
<%@ page import="com.rimbestprice.rimbestprice.models.Flight"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tickets</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            padding: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-edit {
            background-color: #ffc107;
            border-color: #ffc107;
        }
        .btn-delete {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-disabled {
            cursor: not-allowed;
            opacity: 0.5;
        }
        .lobster-font {
            font-family: 'Lobster', cursive;
        }
    </style>
    <script>
        function populateForm(ticketNumber, price, ticketClass, numberOfTicketsAvailable, flightNumber) {
            document.getElementById('action').value = 'update';
            document.getElementById('ticketNumber').value = ticketNumber;
            document.getElementById('price').value = price;
            document.getElementById('ticketClass').value = ticketClass;
            document.getElementById('numberOfTicketsAvailable').value = numberOfTicketsAvailable;
            document.getElementById('flightNumber').value = flightNumber;
        }
    </script>
</head>
<body>
<div class="container">
    <h1 class="lobster-font" > Tickets  </h1>
    <form action="ticket" method="post">
        <input type="hidden" name="action" id="action" value="<%= request.getAttribute("action") != null ? request.getAttribute("action") : "add" %>">
        <div class="mb-3">
            <label for="ticketNumber" class="form-label">Ticket Number</label>
            <input type="text" class="form-control" id="ticketNumber" name="ticketNumber">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="text" class="form-control" id="price" name="price">
        </div>
        <div class="mb-3">
            <label for="ticketClass" class="form-label">Ticket Class</label>
            <select class="form-select" id="ticketClass" name="ticketClass">
                <option value="FIRST_CLASS">First Class</option>
                <option value="BUSINESS_CLASS">Business Class</option>
                <option value="ECONOMY_CLASS">Economy Class</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="numberOfTicketsAvailable" class="form-label">Number of Tickets Available</label>
            <input type="text" class="form-control" id="numberOfTicketsAvailable" name="numberOfTicketsAvailable">
        </div>
        <div class="mb-3">
            <label for="flightNumber" class="form-label">Flight</label>
            <select class="form-select" id="flightNumber" name="flightNumber">
                <% List<Flight> flights = (List<Flight>) request.getAttribute("flights");
                    for (Flight flight : flights) { %>
                <option value="<%= flight.getFlightNumber() %>"><%= flight.getFlightNumber() %></option>
                <% } %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <h2 class="lobster-font" >List of Tickets</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Ticket Number</th>
            <th>Price</th>
            <th>Ticket Class</th>
            <th>Number of Tickets Available</th>
            <th>Date</th>
            <th>Flight</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
            for (Ticket ticket : tickets) { %>
        <tr>
            <td><%= ticket.getTicketNumber() %></td>
            <td><%= ticket.getPrice() %></td>
            <td><%= ticket.getTicketClass() %></td>
            <td><%= ticket.getNumberOfTicketsAvailable() %></td>
            <td><%= sdf.format(ticket.getCreationTime()) %></td>
            <td><%= ticket.getFlight().getFlightNumber() %></td>
            <td>
                <% if (ticket.canModifyTicket()) { %>
                <button type="button" class="btn btn-sm btn-edit" onclick="populateForm('<%= ticket.getTicketNumber() %>', '<%= ticket.getPrice() %>', '<%= ticket.getTicketClass() %>', '<%= ticket.getNumberOfTicketsAvailable() %>', '<%= ticket.getFlight().getFlightNumber() %>')">Edit</button>
                <form action="ticket" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="ticketNumber" value="<%= ticket.getTicketNumber() %>">
                    <button type="submit" class="btn btn-sm btn-delete">Delete</button>
                </form>
                <% } else { %>
                <span class="btn btn-sm btn-disabled">Cannot modify this ticket.</span>
                <% } %>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
