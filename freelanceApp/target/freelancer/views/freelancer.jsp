<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <spring:url value="src/bootstrap" var="bts"></spring:url>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile FREELANCER</title>
    <style>
        body {
            background-color: black;
            font-family: Arial, sans-serif;
            color: #333;
        }

        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: lightgray;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1, h3 {
            color: green;
            font-weight: bold;
        }

        .card {
            border: none;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
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

            <button type="submit" class="btn btn-primary">Save Profile</button>
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
