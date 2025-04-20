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
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
                <!-- Show the user role dynamically based on the request parameter -->
                <div class="container mt-5">
                <br>
			    <h2 class="text-center">Sign Up <br><b><u>${newUser}</u></b></h2>
			    
				<form:form action="signup" method="POST" modelAttribute="user">
				    <div class="form-group">
				        <label for="nom">Full Name:</label>
				        <input type="text" class="form-control" id="nom" name="nom" value="${user.nom}" placeholder="Enter your full name" required>
				    </div>
				    <div class="form-group">
				        <label for="username">Username:</label>
				        <input type="text" class="form-control" id="username" name="username" value="${user.username}" placeholder="Username" required>
				    </div>
				    <div class="form-group">
				        <label for="email">Email:</label>
				        <input type="email" class="form-control" id="email" name="email" value="${user.email}" placeholder="something@example.com" required>
				    </div>
				    <div class="form-group">
				        <label for="password">Password:</label>
				        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
				    </div>
				    <!-- Hidden field to capture the role dynamically -->
				    <input type="hidden" name="newUser" value="${param.newUser}">
				    <button type="submit" class="btn btn-primary">Sign Up</button>
				</form:form>

        
			</div>

                <div class="text-center mt-4">
                    <p>Already have an account? <a href="login">Login here</a></p>
                </div>
            </div>
        </div>
        <h2 class="text-center text-danger"><br><b><u>${error}</u></b></h2>
    </div>

    <footer class="bg-light py-4 text-center">
        <div class="container">
            <p class="text-muted mb-0">&copy; 2024 FreelanceESSAT. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
