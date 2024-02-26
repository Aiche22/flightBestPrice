<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rimbestprice.rimbestprice.models.CompanyAerienne"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <title>Companies</title>
    <style>
        body {
            font-family: 'Lobster', cursive; /* Police Lobster */
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            text-align: center; /* Centrage du texte */
        }
        h1 {
            margin-top: 20px;
        }
        form {
            margin: 20px auto;
            padding: 20px;
            width: 300px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            padding: 10px;
            border: 1px solid #dddddd;
            text-align: left;
        }
        th {
            background-color: #b9c1cc;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .actions {
            display: flex;
            justify-content: space-around;
        }
    </style>
</head>
<body>
<h1>Companies</h1>
<form action="company" method="post">
    <input type="hidden" name="action" value="add">
    <label for="nom">Name:</label>
    <input type="text" id="nom" name="nom">
    <input type="submit" value="Add Company">
</form>
<h2>List of Companies</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    <% List<CompanyAerienne> companies = (List<CompanyAerienne>) request.getAttribute("companies");
        for (CompanyAerienne company : companies) {
    %>
    <tr>
        <td><%= company.getId() %></td>
        <td><%= company.getNom() %></td>
        <td class="actions">
            <form action="company" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= company.getId() %>">
                <input type="text" name="nom" value="<%= company.getNom() %>">
                <input type="submit" value="Update">
            </form>
            <form action="company" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= company.getId() %>">
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
