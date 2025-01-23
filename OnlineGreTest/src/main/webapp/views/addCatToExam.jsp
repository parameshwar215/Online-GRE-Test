<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.Set" %>
<%@ page import="com.gre.entity.Category" %>
<%@ page import="com.gre.entity.ExamSchedule" %>

<%--<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* List<Category> clist=(List<Category>)request.getAttribute("clist");
List<ExamSchedule> elist=(List<ExamSchedule>)request.getAttribute("elist");
ExamSchedule ex=(ExamSchedule)request.getAttribute("ex"); */
Set<Category> c1list=(Set<Category>)session.getAttribute("c1list");
ExamSchedule ex=(ExamSchedule)session.getAttribute("ex");
List<Category> clist=(List<Category>)session.getAttribute("clist");


%>
<form action="/saveCategories" method="post">
<label>Exam Name</label>
select name="examName">
   <%for(int i=0;i<elist.size();i++){%>
    <option><%=elist.get(i).getExamName()%></option>
           <%}%>
             
</select>

<input type="text" name="examName" value="<%=ex.getExamName()%>" readonly>
<label>Add Topics for Exam</label>
<select name="cat">
   <%for(int i=0;i<clist.size();i++){%>
    <option><%=clist.get(i).getCat()%></option>
           <%}%>
             
</select>
<button>Add Category</button>
</form>
<%
for(Category c:c1list){%>
	<button><a href="getQuestion/<%=c.getCategoryId()%>"><%=c.getCat() %></a></button>
<% }
%>
<div>              
<%
for(Category c:clist){%>
	
  <button><a href="getQuestion/<%=c.getCategoryId()%>"><%=c.getCat() %></a></button>	
<%}%>
<!-- <a href="/viewQuestions" ><button>View All Questions</button></a> -->
       
               <hr>
 </div> 

</body>
</html> --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    h1 {
      text-align: center;
    }

    form {
      margin-bottom: 20px;
    }

    label {
      font-weight: bold;
    }

    select, input[type="text"] {
      margin-bottom: 10px;
      margin-right: 10px;
      padding: 5px;
      width: 300px;
    }

    .b1 {
      padding: 10px 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
      margin: 20px;
      border-radius: 100px;
    }

    .b1 a {
      text-decoration: none;
      color: white;
    }

    .category-button {
      margin-right: 10px;
    }

    .category-list {
      margin-top: 20px;
    }
    .b2 {
    
      padding: 10px 10px;
      background-color: skyblue;
      color: white;
      border: none;
      cursor: pointer;
      margin: 20px;
      border-radius: 100px;
    }
    a{
    
    text-decoration:none;
    }
    
  </style>
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
ExamSchedule ex=(ExamSchedule)session.getAttribute("ex");
List<Category> c1list=(List<Category>)session.getAttribute("c1list");
Set<Category> clist=(Set<Category>)session.getAttribute("clist");
%>

  <h1>Adding Categories To <%=ex.getExamName() %></h1>
  <hr>
  <form action="/saveCategories" method="post">
    <label>Exam Name:</label>
    <input type="text" name="examName" value="${ex.getExamName()}" readonly>
    <label>Add Topics for Exam:</label>
     <select name="cat">
   <%for(int i=0;i<c1list.size();i++){%>
  
    <option><%=c1list.get(i).getCat()%></option>
   <%}%>
             
    </select>
    <button class="b1">Add Category</button>
  </form>

   <div class="category-list">
    <h3>Categories Added:</h3>
    <%
for(Category c:clist){%>
	
  <button class="b1"><a href="getQuestion/<%=c.getCategoryId()%>"><%=c.getCat() %></a></button>
<%}%>
  </div>
  <button class="b2"><a style="color:white" href="/examView">Back</a></button>
</body>
</html>
