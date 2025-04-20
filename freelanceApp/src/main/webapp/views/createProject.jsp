<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Project</title>
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

        h2 {
            color: black;
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

        .myButton {
  --black: #000000; /* Changed to black */
  font-size: 15px;
  padding: 0.7em 2.7em;
  letter-spacing: 0.06em;
  position: relative;
  font-family: inherit;
  border-radius: 0.6em;
  overflow: hidden;
  transition: all 0.3s;
  line-height: 1.4em;
  border: 2px solid var(--black); /* Changed to black */
  background: linear-gradient(
    to right,
    rgba(0, 0, 0, 0.1) 1%, /* Changed to black */
    transparent 40%,
    transparent 60%,
    rgba(0, 0, 0, 0.1) 100% /* Changed to black */
  );
  color: var(--black); /* Changed to black */
  box-shadow:
    inset 0 0 10px rgba(0, 0, 0, 0.4), /* Changed to black */
    0 0 9px 3px rgba(0, 0, 0, 0.1); /* Changed to black */
}

.myButton:hover {
  color: #000000; /* Changed to black */
  box-shadow:
    inset 0 0 10px rgba(0, 0, 0, 0.6), /* Changed to black */
    0 0 9px 3px rgba(0, 0, 0, 0.2); /* Changed to black */
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
    rgba(0, 0, 0, 0.1) 40%, /* Changed to black */
    rgba(0, 0, 0, 0.1) 60%, /* Changed to black */
    transparent 100%
  );
}

.myButton:hover:before {
  transform: translateX(10em);
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

        <button type="submit" class="myButton">Create Project</button>
    </form>
</div>
</body>
</html>
