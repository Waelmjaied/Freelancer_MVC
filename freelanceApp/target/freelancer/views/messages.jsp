<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Messages</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: rgb(13,110,253);
            font-family: Arial, sans-serif;
            color: #333;
        }

        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        h2, h3 {
            color: #0d6efd;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .table {
            border: 1px solid #ddd;
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 30px;
        }

        .table th, .table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .table tr:nth-child(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .table tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.9);
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 6px;
        }

        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #b52d3a;
        }

        .alert {
            margin-bottom: 20px;
        }

        .mb-3 {
            margin-bottom: 20px;
        }

        .mb-4 {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">

    <!-- Back to Dashboard Button -->
    <div class="mb-4">
        <a href="ShowAllProjects" class="btn btn-secondary">Back to Dashboard</a>
    </div>

    <!-- Display Success or Error Messages -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success" role="alert">
            ${successMessage}
        </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
            ${errorMessage}
        </div>
    </c:if>

    <!-- Section: Your Messages -->
    <h2>Your Messages</h2>
    <table class="table">
        <thead>
        <tr>
            <th>Sender</th>
            <th>Receiver</th>
            <th>Message</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="message" items="${messages}">
            <tr>
                <td>${message.expediteur.nom}</td>
                <td>${message.destinataire.nom}</td>
                <td>${message.contenu}</td>
                <td>${message.date}</td>
                <td>
                    <form action="deleteMessage" method="post" style="display: inline;">
                        <input type="hidden" name="messageId" value="${message.id}" />
                        <input type="hidden" name="userId" value="${userId}" />
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Section: Send a New Message -->
    <h3>Send a New Message</h3>
    <form action="sendMessage" method="post">
        <input type="hidden" name="expediteurId" value="${userId}" />
        <div class="mb-3">
            <label for="destinataireId" class="form-label">Recipient:</label>
            <select id="destinataireId" name="destinataireId" class="form-control" required>
                <c:forEach var="user" items="${users}">
                    <option value="${user.id}">${user.nom} (${user.username})</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="contenu" class="form-label">Message:</label>
            <textarea class="form-control" id="contenu" name="contenu" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Send Message</button>
    </form>
</div>
</body>
</html>
