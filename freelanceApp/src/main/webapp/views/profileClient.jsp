<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Client Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000000; /* Black background */
            font-family: Arial, sans-serif;
            color: #e0e0e0; /* Light text color */
            padding-top: 50px;
        }

        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: #1e1e1e; /* Dark container background */
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.1); /* Light shadow for contrast */
        }

        h1 {
            color: #0d6efd; /* Bootstrap primary blue */
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        p {
            font-size: 16px;
            margin-bottom: 10px;
            color: #e0e0e0; /* Light text color */
        }

        .error-message {
            color: #ff4444; /* Red for error messages */
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        strong {
            color: #ffffff; /* White for strong text */
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