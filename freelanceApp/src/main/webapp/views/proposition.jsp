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
            color: white;
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

.myButton {
  --white: #ffffff; /* Changed to white */
  font-size: 15px;
  padding: 0.7em 2.7em;
  letter-spacing: 0.06em;
  position: relative;
  font-family: inherit;
  border-radius: 0.6em;
  overflow: hidden;
  transition: all 0.3s;
  line-height: 1.4em;
  border: 2px solid var(--white); /* Changed to white */
  background: linear-gradient(
    to right,
    rgba(255, 255, 255, 0.1) 1%, /* Changed to white */
    transparent 40%,
    transparent 60%,
    rgba(255, 255, 255, 0.1) 100% /* Changed to white */
  );
  color: var(--white); /* Changed to white */
  box-shadow:
    inset 0 0 10px rgba(255, 255, 255, 0.4), /* Changed to white */
    0 0 9px 3px rgba(255, 255, 255, 0.1); /* Changed to white */
}

.myButton:hover {
  color: #ffffff; /* Changed to white */
  box-shadow:
    inset 0 0 10px rgba(255, 255, 255, 0.6), /* Changed to white */
    0 0 9px 3px rgba(255, 255, 255, 0.2); /* Changed to white */
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
    rgba(255, 255, 255, 0.1) 40%, /* Changed to white */
    rgba(255, 255, 255, 0.1) 60%, /* Changed to white */
    transparent 100%
  );
}

.myButton:hover:before {
  transform: translateX(10em);
}
    </style>
</head>
<body>
    <h2>Proposition Form</h2>
    <h3>Titre of  Project: ${proj.titre}</h3>
    <div class="form-container">
        <form:form method="post" modelAttribute="proposition" action="${pageContext.request.contextPath}/addPropositionForm/${id}">
            <table>
                <tr>
                    <td><label for="freelancerId">Freelancer ID:</label></td>
                    <td><form:input path="freelancer.id" id="freelancerId" required="true" class="form-control" /></td>
                </tr>
                <tr>
                    <td><label for="montant">Amount:</label></td>
                    <td><form:input path="montant" type="number" step="0.01" id="montant" required="true" class="form-control" /></td>
                </tr>
                <tr>
                    <td><label for="duree">Duration (in days):</label></td>
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
