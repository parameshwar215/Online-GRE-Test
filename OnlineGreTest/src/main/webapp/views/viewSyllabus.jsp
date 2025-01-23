<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
   import="java.sql.*"
   import="javax.sql.*"%>
   <%@ page import="com.gre.entity.Category" %>
<%@ page import="com.gre.entity.ExamSchedule" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<style>/* button {
      padding: 5px 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
      margin: 20px;
    }

    button a {
      text-decoration: none;
      color: white;
    } */
 .b2 {
  align-items: center;
  appearance: none;
  background-color: #3EB2FD;
  background-image: linear-gradient(1deg, #4F58FD, #149BF3 99%);
  background-size: calc(100% + 20px) calc(100% + 20px);
  border-radius: 100px;
  border-width: 0;
  box-shadow: none;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  display: inline-flex;
  font-family: CircularStd,sans-serif;
  font-size: 1rem;
  height: auto;
  justify-content: center;
  line-height: 1.5;
  padding: 6px 20px;
  position: relative;
  text-align: center;
  text-decoration: none;
  transition: background-color .2s,background-position .2s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: top;
  white-space: nowrap;
  margin-right:20px;

} 
table{
			border-collapse: collapse;
			width: 40%;   
		}
	th,td{
		border: 2px solid green; 
		padding: 15px;
	}

 .b2:active,
.b2:focus {
  outline: none;
}

.b2:hover {
  background-position: -20px -20px;
}

.b2:focus:not(:active) {
  box-shadow: rgba(40, 170, 255, 0.25) 0 0 0 .125em;
}  
.btn {
 /*  background-color: DodgerBlue; */
 background-color:red;
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 100px;
}


.c1{
color:blue;
text-decoration: none;
}
.c2{
color:white;
text-decoration: none;
}
a{
color:white;
text-decoration:none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("email") == null) {
		response.sendRedirect("/sessionexpired");

	}
	//String name=(String)
	%>
  <%
  ExamSchedule ex=(ExamSchedule)request.getAttribute("ex");
  %>
  
  <h1 style="text-align:center"><%=ex.getExamName()%>  Syllabus</h1>
  <button class="b2"><a href="/examView" >Back</a></button>
 <hr>
 <center>
 <table>
  
  <% for(Category c:ex.getCatSet()){ %>
      <tr>
	  <td><a href="/viewSyllabus/getQuestion/<%=c.getCategoryId()%>" class="c1"><%=c.getCat() %></a> </td>
	  <td><button class="btn"><a href="/removeCatFromSyllabs/<%=c.getCategoryId()%>/<%=ex.getExamId()%>" class="c2">Remove </a></button></td>
	  </tr>
	  
  <% }%>

 </table>
  </center>

 
</body>
</html>