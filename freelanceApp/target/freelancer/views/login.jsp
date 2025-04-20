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
    <title>Login</title>
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
                <h2 class="text-center mb-4">Login</h2>
                <form method="POST" action="login">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" placeholder="Enter your username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>

                <div class="text-center mt-4">
                        <p>Don't have an account? <br> Sign up here<br>
					        <a href="signup?newUser=FREELANCER" class="btn btn-info mt-2">Sign up as Freelancer</a>
					        <a href="signup?newUser=CLIENT" class="btn btn-warning mt-2">Sign up as Client</a>
					    </p>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-light py-4 text-center">
        <div class="container">
            <p class="text-muted mb-0">&copy; 2024 FreelanceESSAT. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
