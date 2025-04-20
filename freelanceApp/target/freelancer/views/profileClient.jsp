<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Client Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: rgb(240, 248, 255);
            font-family: Arial, sans-serif;
            color: #333;
            padding-top: 50px;
        }

        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #0d6efd;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        p {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Client Profile</h1>

    <!-- Display Error Message -->
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <!-- Display Client Information -->
    <c:if test="${not empty client}">
        <p><strong>Name:</strong> ${client.nom}</p>
        <p><strong>Email:</strong> ${client.email}</p>
        <p><strong>Role:</strong> ${client.role.role}</p>
    </c:if>
</div>
</body>
</html>
