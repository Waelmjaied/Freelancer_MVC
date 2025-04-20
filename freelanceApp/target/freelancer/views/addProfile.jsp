<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
            background-color: #000000; /* Black background */
            color: #e0e0e0; /* Light text color */
        }
        .navbar-dark.bg-primary {
            background-color: #1e1e1e !important; /* Dark navbar */
        }
        .card {
            background-color: #1e1e1e; /* Dark card background */
            border: 1px solid #333; /* Dark border */
        }
        .form-control {
            background-color: #333; /* Dark input background */
            border: 1px solid #444; /* Dark border */
            color: #e0e0e0; /* Light text color */
        }
        .form-control:focus {
            background-color: #444; /* Darker input background on focus */
            border-color: #555; /* Darker border on focus */
            color: #e0e0e0; /* Light text color */
        }
        .btn-primary {
            background-color: #0d6efd; /* Bootstrap primary blue */
            border-color: #0d6efd;
        }
        .btn-primary:hover {
            background-color: #0b5ed7; /* Darker blue on hover */
            border-color: #0a58ca;
        }
        .alert-danger {
            background-color: #dc3545; /* Bootstrap danger red */
            border-color: #dc3545;
            color: #ffffff; /* White text */
        }
        .alert-success {
            background-color: #28a745; /* Bootstrap success green */
            border-color: #28a745;
            color: #ffffff; /* White text */
        }
        footer {
            background-color: #1e1e1e !important; /* Dark footer */
            color: #e0e0e0 !important; /* Light text color */
        }
        .text-muted {
            color: #a0a0a0 !important; /* Muted text color */
        }
        a {
            color: #0d6efd; /* Link color */
        }
        a:hover {
            color: #0b5ed7; /* Darker link color on hover */
        }
        h2, b, u {
            color: #e0e0e0; /* Light text color */
        }
        .text-danger {
            color: #dc3545 !important; /* Danger red for error messages */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">FreelanceESSAT</a>
        </div>
    </nav>

    <div class="container my-5">
        <div class="card shadow-lg mx-auto" style="max-width: 400px;">
            <div class="card-body">
                <h2 class="text-center">Profile: <br><b><u>${user.nom}</u></b></h2>

                <!-- Error and success messages -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                <c:if test="${not empty message}">
                    <div class="alert alert-success">${message}</div>
                </c:if>

                <!-- Profile creation form -->
                <form:form action="${pageContext.request.contextPath}/profile" 
                           method="POST" 
                           modelAttribute="profile"
                           accept-charset="UTF-8">
                    <input type="hidden" name="username" value="${user.username}" />
                
                    <div class="form-group">
                        <label for="biblio">Bio:</label>
                        <form:input path="biblio" class="form-control " placeholder="Enter biblio" />
                    </div>
                
                    <div class="form-group">
                        <label for="skills">Skills:</label>
                        <form:input path="skills" class="form-control" placeholder="Enter skills" />
                    </div>
                
                    <div class="form-group">
                        <label for="anneeExperience">Years of Experience:</label>
                        <form:input path="anneeExperience" class="form-control" type="number" placeholder="Enter years of experience" />
                    </div>
                
                    <div class="form-group">
                        <label for="disponibilite">Disponibility:</label>
                        <form:input path="disponibilite" class="form-control" placeholder="Enter your availability" />
                    </div>
                
                    <div class="form-group">
                        <label for="rating">Rating:</label>
                        <form:input path="rating" class="form-control" type="number" step="0.1" placeholder="Enter rating" />
                    </div>
                
                    <button type="submit" class="btn btn-primary">Save Profile</button>
                </form:form>

            </div>

            <!-- Back to Projects link -->
            <div class="text-center mt-4">
                <p>Back To Projects <a href="ShowAllProjects">HOME</a></p>
            </div>
        </div>
        <!-- Error message at the bottom -->
        <h2 class="text-center text-danger"><br><b><u>${error}</u></b></h2>
    </div>

    <footer class="bg-light py-4 text-center">
        <div class="container">
            <p class="text-muted mb-0">&copy; 2024 Freelance ESSAT. All rights reserved By SALMEN.</p>
        </div>
    </footer>
</body>
</html>