<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.*" %>
     <%@ page import="java.time.LocalDateTime" %>
   
<%@ page import="com.gre.entity.ExamSchedule" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

body{
background-color: skyblue;
}
table {
  
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 20px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
.abc{
  text-align:center;
  margin: auto;
  width: 70%;
  height:90%; 
  border: 3px solid #73AD21;
  background-color: #FFFFE0;
  padding: 10px;
}
form{
justify-content: center;
display: flex;
margin: 40px 50px;
border: 3px solid skyblue;
padding: 100px;

}

button {
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
}
.b3{
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
  
}
button:active,
button:focus {
  outline: none;
}

button:hover {
  background-position: -20px -20px;
}

button:focus:not(:active) {
  box-shadow: rgba(40, 170, 255, 0.25) 0 0 0 .125em;
}

a{
text-decoration:none;
color:white
}
    </style>

<body>
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("email") == null) {
		response.sendRedirect("/sessionexpired");

	}
	//String name=(String)
	%>
<%
//List<Category> list=(List<Category>)request.getAttribute("list");
ExamSchedule ex=(ExamSchedule)request.getAttribute("ex");
/* DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  
out.println(dtf.format(now));
out.println(d.toString());  */
%>
<form action="/saveUpdate/<%=ex.getExamId() %>" method="post">

 <div  class="abc">
 <h1>Update Exam Schedule</h1>


<table>
  <tr>
    <td><label>Exam Name</label></td>
    <td><input type="text" name="examName"  value=<%=ex.getExamName() %> readonly></td>
    
  </tr>
  <tr>
    <td><label>Date of Exam</label></td>
    <td><input type="date" name="dateOfExam" min="2023-05-29"  max="2023-08-31" value=<%=ex.getDateOfExam() %> required></td>
   
  </tr>
  <tr>
   
    <td><label>Exam Location</label></td>
    <td><input type="text" name="examLocation" value=<%=ex.getExamLocation() %> required></td>
  </tr>
   <tr>
   
    <td><label>Exam Fee</label></td>
    <td><input type="number" name="fee" value=<%=ex.getFee() %> required></td>
  </tr>
</table><br>

<button>submit</button>
<button class="b3"><a href="/examView">Back</a></button>


</div>
</form>
</body>
</html>