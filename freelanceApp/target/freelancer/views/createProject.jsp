<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Project</title>
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

        h2 {
            color: #0d6efd;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
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
    </style>
</head>
<body>
<div class="container">
    <h2>Create a New Project</h2>
    <form action="${pageContext.request.contextPath}/projects/new" method="post">
        <!-- Hidden input for username -->
        <input type="hidden" name="username" value="${username}" />

        <div class="mb-3">
            <label for="titre" class="form-label">Title:</label>
            <input type="text" id="titre" name="titre" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <textarea id="description" name="description" class="form-control" rows="4" required></textarea>
        </div>

        <div class="mb-3">
            <label for="budget" class="form-label">Budget:</label>
            <input type="number" id="budget" name="budget" class="form-control" step="0.01" required />
        </div>

        <div class="mb-3">
            <label for="dateLimite" class="form-label">Deadline:</label>
            <input type="date" id="dateLimite" name="dateLimite" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="nbreHeures" class="form-label">Number of Hours:</label>
            <input type="number" id="nbreHeures" name="nbreHeures" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="technologies" class="form-label">Technologies:</label>
            <input type="text" id="technologies" name="technologies" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="statut" class="form-label">Status:</label>
            <input type="text" id="statut" name="statut" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-primary w-100">Create Project</button>
    </form>
</div>
</body>
</html>
