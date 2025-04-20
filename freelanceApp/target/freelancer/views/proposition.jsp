<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <spring:url value="src/bootstrap" var="bts"></spring:url>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/${bts}/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proposition Form</title>
    <style>
        body {
            color: #fff;
            background-color: black;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        h2, h3 {
            margin-bottom: 20px;
        }

        .form-container {
            border: 2px solid #fff;
            border-radius: 10px;
            width: 60%;
            margin: 30px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        table td {
            padding: 15px;
            color: #fff;
            text-align: left;
        }

        table td:first-child {
            font-weight: bold;
            text-align: right;
            width: 40%;
        }

        table td:last-child {
            text-align: left;
            width: 60%;
        }

        table tr:nth-child(odd) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        table tr:nth-child(even) {
            background-color: rgba(0, 0, 0, 0.1);
        }

        .myButton {
            background: linear-gradient(to bottom, #ffffff 5%, #e9e9e9 100%);
            border-radius: 6px;
            border: 1px solid #dcdcdc;
            color: #333;
            font-size: 16px;
            font-weight: bold;
            padding: 10px 30px;
            text-decoration: none;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .myButton:hover {
            background: linear-gradient(to bottom, #e9e9e9 5%, #ffffff 100%);
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }

        .myButton:active {
            position: relative;
            top: 1px;
        }
    </style>
</head>
<body>
    <h2>Proposition Form</h2>
    <h3>Titre du Projet: ${proj.titre}</h3>
    <div class="form-container">
        <form:form method="post" modelAttribute="proposition" action="${pageContext.request.contextPath}/addPropositionForm/${id}">
            <table>
                <tr>
                    <td><label for="freelancerId">Freelancer ID:</label></td>
                    <td><form:input path="freelancer.id" id="freelancerId" required="true" class="form-control" /></td>
                </tr>
                <tr>
                    <td><label for="montant">Montant:</label></td>
                    <td><form:input path="montant" type="number" step="0.01" id="montant" required="true" class="form-control" /></td>
                </tr>
                <tr>
                    <td><label for="duree">Duree (in days):</label></td>
                    <td><form:input path="duree" type="number" id="duree" required="true" class="form-control" /></td>
                </tr>
                <tr>
                    <td><label for="description">Description:</label></td>
                    <td><form:textarea path="description" id="description" rows="4" cols="50" required="true" class="form-control"></form:textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button type="submit" class="myButton"><b>Save Proposal</b></button>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>
</body>
</html>
