<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <spring:url value="src/bootstrap" var="bts"></spring:url>
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile FREELANCER</title>
    <style>
        body {
            background-color: black;
            font-family: Arial, sans-serif;
            color: #333;
        }
        label{
        color:white;}

        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: black;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1, h3 {
            color: Orange;
            font-weight: bold;
        }

        .card {
            border: none;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
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

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        footer {
            margin-top: 20px;
            background-color: #f8f9fa;
            padding: 15px 0;
        }

        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Freelancer Profile</h1>

        <!-- Display Success or Error Messages -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <!-- Profile form -->
        <h3>Edit Profile</h3>
        <form:form action="${pageContext.request.contextPath}/profile" 
                   method="POST" 
                   modelAttribute="profile" 
                   accept-charset="UTF-8">
            <input type="hidden" name="username" value="${profile.user.username}" />
            <form:hidden path="id" />
            <form:hidden path="user.id" />

            <div class="card mb-4">
                <div class="card-body text-center">
                    <h3>User Information</h3>
                    <p><strong>Name:</strong> ${profile.user.nom}</p>
                    <p><strong>Email:</strong> ${profile.user.email}</p>
                </div>
            </div>

            <div class="mb-3">
                <label for="biblio" class="form-label">Bibliography</label>
                <form:textarea path="biblio" id="biblio" class="form-control" rows="3"></form:textarea>
            </div>

            <div class="mb-3">
                <label for="skills" class="form-label">Skills</label>
                <form:input path="skills" id="skills" class="form-control" />
            </div>

            <div class="mb-3">
                <label for="anneeExperience" class="form-label">Years of Experience</label>
                <form:input path="anneeExperience" id="anneeExperience" class="form-control" type="number" />
            </div>

            <div class="mb-3">
                <label for="disponibilite" class="form-label">Availability</label>
                <form:input path="disponibilite" id="disponibilite" class="form-control" />
            </div>

            <div class="mb-3">
                <label for="rating" class="form-label">Rating</label>
                <form:input path="rating" id="rating" class="form-control" type="number" step="0.1" />
            </div>

            <button type="submit" class="myButton">Save Profile</button>
        </form:form>

        <!-- Back to Projects link -->
        <div class="text-center mt-4">
            <a href="ShowAllProjects" class="btn btn-secondary">Back to Projects</a>
        </div>
    </div>

    <footer class="text-center">
        <p class="text-muted mb-0">&copy; 2024 FreelanceESSAT. All rights reserved.</p>
    </footer>
</body>
</html>
