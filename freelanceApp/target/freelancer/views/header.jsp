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
        <a href="profile?username=${user.username}" class="myButton">Edit</a>
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
background-color:rgb(13,110,253);
margin:0;
padding:0;}
.navbar2{
background-color:rgb(13,110,253) ;
text-color:gold;}
.hello{
color:white;
margin-left:35%;}

.myButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color:#ededed;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color:#dfdfdf;
}
.myButton:active {
	position:relative;
	top:1px;
}
.myButton2 {
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
	background-color:#fe1a00;
	border-radius:6px;
	border:1px solid #d83526;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.myButton2:hover {
	background:linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
	background-color:#ce0100;
}
.myButton2:active {
	position:relative;
	top:1px;
}

</style>