<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="user" />

<c:if test="${user.role.role=='ROLE_CLIENT'}">
<nav class="navbar2">
    <h1 class="hello">Welcome Client: ${user.nom}</h1>
    <div class="text-center mt-4">
    <form action="<c:url value='/logout' />" method="post">
      
        <a href="projects/new?username=${user.username}" class="myButton">Add Projects</a>
        <a href="listProposition" class="myButton" style="bg-color:rgb(90, 90, 90)">List of Proposals</a>
        <!-- New Messages Button -->
        <a href="messages?userId=${user.id}" class="myButton">Messages</a>
        <button type="submit" class="myButton2">Logout</button>
    </form>  
    </div>
</nav>
</c:if>

<c:if test="${user.role.role=='ROLE_FREELANCER'}">
<nav class="navbar2">
    <h1 class="hello">Welcome Freelancer: ${user.nom}</h1><br>
    <div class="text-center mt-4">
    <form action="<c:url value='/logout' />" method="post">
        <a href="profileFreelancer?username=${user.username}" class="myButton">My Profile</a>
        <a href="profile?username=${user.username}" class="myButton" >&nbsp &nbsp Edit &nbsp &nbsp</a>
        <!-- New Messages Button -->
<sec:authentication property="principal.id" var="userId" />
<a href="messages?userId=${userId}" class="myButton">Messages</a>
        <button type="submit" class="myButton2">Logout</button>
    </form>  
    </div>
</nav>
</c:if>



<style>
body{
background-color:black;
margin:0;
padding:0;}
.navbar2{
background-color:black ;
text-color:gold;}
.hello{
color:white;
margin-left:35%;}

/* From Uiverse.io by idesignedthat */ 
.myButton {
  --gold: #FFD700; /* Changed to gold */
  font-size: 15px;
  padding: 0.7em 2.7em;
  letter-spacing: 0.06em;
  position: relative;
  font-family: inherit;
  border-radius: 0.6em;
  overflow: hidden;
  transition: all 0.3s;
  line-height: 1.4em;
  border: 2px solid var(--gold); /* Changed to gold */
  background: linear-gradient(
    to right,
    rgba(255, 215, 0, 0.1) 1%, /* Changed to gold */
    transparent 40%,
    transparent 60%,
    rgba(255, 215, 0, 0.1) 100% /* Changed to gold */
  );
  color: var(--gold); /* Changed to gold */
  box-shadow:
    inset 0 0 10px rgba(255, 215, 0, 0.4), /* Changed to gold */
    0 0 9px 3px rgba(255, 215, 0, 0.1); /* Changed to gold */
}

.myButton:hover {
  color: #FFD700; /* Changed to gold */
  box-shadow:
    inset 0 0 10px rgba(255, 215, 0, 0.6), /* Changed to gold */
    0 0 9px 3px rgba(255, 215, 0, 0.2); /* Changed to gold */
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
    rgba(255, 215, 0, 0.1) 40%, /* Changed to gold */
    rgba(255, 215, 0, 0.1) 60%, /* Changed to gold */
    transparent 100%
  );
}

.myButton:hover:before {
  transform: translateX(10em);
}

.myButton2 {
  --red: #FF0000; /* Changed to red */
  font-size: 15px;
  padding: 0.7em 2.7em;
  letter-spacing: 0.06em;
  position: relative;
  font-family: inherit;
  border-radius: 0.6em;
  overflow: hidden;
  transition: all 0.3s;
  line-height: 1.4em;
  border: 2px solid var(--red); /* Changed to red */
  background: linear-gradient(
    to right,
    rgba(255, 0, 0, 0.1) 1%, /* Changed to red */
    transparent 40%,
    transparent 60%,
    rgba(255, 0, 0, 0.1) 100% /* Changed to red */
  );
  color: var(--red); /* Changed to red */
  box-shadow:
    inset 0 0 10px rgba(255, 0, 0, 0.4), /* Changed to red */
    0 0 9px 3px rgba(255, 0, 0, 0.1); /* Changed to red */
}

.myButton2:hover {
  color: #FF0000; /* Changed to red */
  box-shadow:
    inset 0 0 10px rgba(255, 0, 0, 0.6), /* Changed to red */
    0 0 9px 3px rgba(255, 0, 0, 0.2); /* Changed to red */
}

.myButton2:before {
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
    rgba(255, 0, 0, 0.1) 40%, /* Changed to red */
    rgba(255, 0, 0, 0.1) 60%, /* Changed to red */
    transparent 100%
  );
}

.myButton2:hover:before {
  transform: translateX(10em);
}
a{ text-decoration : none;
}
</style>