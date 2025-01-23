<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>home</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
crossorigin="anonymous">
<style>
  .bg{
 width: 100%;
   background-color:#000080;
 
  padding-left:13%;
  
 } 
 .header{
  background-color:#C0C0C0;
 
 }
 img{
 background-repeat:no-repeat;
 height:100%;
 width:100%;
 margin-top:0px;
 margin-left:0px;
 margin-right:0px;
 margin-bottom:0px;
 }
 
 
 
 
 
 /*This is modifying the btn-primary colors but you could create your own .btn-something class as well*/
.btn-primary {
    color: #fff;
    background-color: #0495c9;
    border-color: #357ebd; /*set the color you want here*/
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open>.dropdown-toggle.btn-primary {
    color: #fff;
    background-color: success;
    border-color: #285e8e; /*set the color you want here*/
}
</style>


 <script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<body>
<div class="header ">
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("email") == null) {
		response.sendRedirect("/sessionexpired");

	}
	//String name=(String)
	%>
		

	<nav class="navbar navbar-expand-lg navbar-light bg-secondary">
  <div class="container-fluid">
    <a class="navbar-brand text-white "  href="#">GRE ONLINE TEST</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/examView">View Scheduled Exams</a></button>
        </li>
         <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/addE">Make exam schedule</a></button>
        </li>
         <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/addQ">Add Question</a></button>
        </li>
         <li class="nav-item">
          <button class="btn btn-primary mx-1"><a class="nav-link active text-white" aria-current="page" href="/viewQuestions">View Questions</a></button>
        </li>

        <li class="nav-item">
          <button class="btn btn-primary mx-1 "> <li class="dropdown"><a class=" nav-link active dropdown-toggle text-white" data-toggle="dropdown" href="#">Menu<span class="caret"></span></a>
        <ul class="dropdown-menu">
        
        
          <li><a href="/logout">Logout</a></li>
          <li><a href="/profile">Profile</a></li>
        </ul>
      </li></button>
        </li>

       
       
      
      
      </ul>
    <span class="nav-item text-white mx-3"><h3 >Welcome, ${sessionScope.name}</h3></span>
    </div>
  </div>
</nav>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 
	<ul class="nav justify-content-end" style="font-size:20px">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="/examView">View Scheduled Exams</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/addE" style="text-size:450">Make exam schedule</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/addQ" style="text-size:450">Add Question</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/viewQuestions">View Questions</a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link " href="/logout" tabindex="-1" aria-disabled="true">Logout</a>
  </li>
 
  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu<span class="caret"></span></a>
        <ul class="dropdown-menu" style="font-size:15px">
          <li><a href="/logout">Logout</a></li>
          <li><a href="/profile">Profile</a></li>
        </ul>
      </li>
</ul>


	</div> -->
	<img alt="Home Page" src="g.png">
	
	
	
	
	
	

	<!-- <a href="/logout">Logout</a> -->

	<!-- <div>

		<h3>
		<a href="/cat"><button>Add-questions</button></a>
		</h3>
		<h3>
			<a href="/update">update-questions</a>
		</h3>
		<h3>
			<a href="/delete">delete-questions</a>
		</h3>
		<h3>
			<a href="/viewcat">Select Category</a>
		</h3>
		<h3>
			<a href="/viewalpar">View Participant List</a>
		</h3>
		<h3>
			<a href="/shcedule">Make Exam Schedule</a>
		</h3>
		<h3>
			<a href="/results">View Participant result</a>
		</h3>




	</div> -->
	
	
</body>
</html>