<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Messages</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: black;
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
            color: black;
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

        .myButton {
  --green: #00FF00; /* Changed to green */
  font-size: 15px;
  padding: 0.7em 2.7em;
  letter-spacing: 0.06em;
  position: relative;
  font-family: inherit;
  border-radius: 0.6em;
  overflow: hidden;
  transition: all 0.3s;
  line-height: 1.4em;
  border: 2px solid var(--green); /* Changed to green */
  background: linear-gradient(
    to right,
    rgba(0, 255, 0, 0.1) 1%, /* Changed to green */
    transparent 40%,
    transparent 60%,
    rgba(0, 255, 0, 0.1) 100% /* Changed to green */
  );
  color: var(--green); /* Changed to green */
  box-shadow:
    inset 0 0 10px rgba(0, 255, 0, 0.4), /* Changed to green */
    0 0 9px 3px rgba(0, 255, 0, 0.1); /* Changed to green */
}

.myButton:hover {
  color: #00FF00; /* Changed to green */
  box-shadow:
    inset 0 0 10px rgba(0, 255, 0, 0.6), /* Changed to green */
    0 0 9px 3px rgba(0, 255, 0, 0.2); /* Changed to green */
}

.myButton:before {
  content: "";
  position: absolute;
  left: -1em;
  width: 2em;
  height: 100%;
  top: 0;
  transition: transform 0.4s ease-in-out;
  background: linear-gradient(
    to right,
    transparent 1%,
    rgba(0, 255, 0, 0.1) 40%, /* Changed to green */
    rgba(0, 255, 0, 0.1) 60%, /* Changed to green */
    transparent 100%
  );
}

.myButton:hover:before {
  transform: translateX(10em);
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
        <button type="submit" class="myButton">Send Message</button>
    </form>
</div>
</body>
</html>
