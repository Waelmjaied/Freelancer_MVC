<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <spring:url value="src/bootstrap" var="bts"></spring:url>
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Details</title>
    <style>
        body {
            padding-top: 56px;
            bg-color:black;
        }
        .card {
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            font-size: 1.5em;
            text-align: center;
            font-weight: bold;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            padding: 20px;
            font-size: 1em;
            background-color: #f9f9f9;
        }
        .card-footer {
            text-align: right;
            background-color: #f1f1f1;
            padding: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<header class="bg-primary text-white text-center py-5">
    <div class="container">
        <h1>Project Details</h1>
    </div>
</header>

<section id="project-details" class="py-5">
    <div class="container">
        <div class="card">
            <div class="card-header">
                ${project.titre}
            </div>
            <div class="card-body">
                <p><strong>Description:</strong> ${project.description}</p>
                <p><strong>Budget:</strong> ${project.budget} €</p>
                <p><strong>Deadline:</strong> ${project.dateLimite}</p>
                <p><strong>Number of Hours:</strong> ${project.nbreHeures}</p>
                <p><strong>Technologies:</strong> ${project.technologies}</p>
                <p><strong>Status:</strong> ${project.statut}</p>
                <p><strong>Client:</strong> ${project.client.nom}</p>
            </div>
            <div class="card-footer">
                <a href="/projects" class="btn btn-secondary">Back to Projects</a>
            </div>
        </div>
    </div>
</section>
</body>
</html>
