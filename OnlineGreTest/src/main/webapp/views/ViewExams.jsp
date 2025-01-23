<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="javax.sql.*"%>
<%@ page import="com.gre.entity.Category"%>
<%@ page import="com.gre.entity.ExamSchedule"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<style>
<
meta name ="viewport " content ="width =device-width, initial-scale =1,
	shrink-to-fit =no "> <link rel ="stylesheet " href ="https: //cdn.jsdelivr.net
	/npm /bootstrap @4.3.1 /dist /css /bootstrap.min.css " integrity ="sha384-ggOyR0iXCbMQv3Xipma34MD+dH
	/1fQ784 /j6cY /iJTQUOhcWr7x9JvoRxT2MZw1T " 
    crossorigin ="anonymous "> /* input{
border:0px;
border-bottom:2px;
 outline: none;
}  */ #no_outline:focus {
	outline: none;
}

#viewallp {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#viewallp td, #viewallp th {
	border: 1px solid #ddd;
	padding: 8px;
}

#viewallp tr:nth-child(even) {
	background-color: #f2f2f2;
}

#viewallp tr:hover {
	background-color: #ddd;
}

#viewallp th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}

.b1 {
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
	font-family: CircularStd, sans-serif;
	font-size: 1rem;
	height: auto;
	justify-content: center;
	line-height: 1.5;
	padding: 6px 20px;
	position: relative;
	text-align: center;
	text-decoration: none;
	transition: background-color .2s, background-position .2s;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	vertical-align: top;
	white-space: nowrap;
}

.b1:active, .b1:focus {
	outline: none;
}

.b1:hover {
	background-position: -20px -20px;
}

.b1:focus:not(:active) {
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
.b2 {
 /*  background-color: DodgerBlue; */
 background-color:green;
  border: none;
  color: black;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 100px;
}
.b3{
 /*  background-color: DodgerBlue; */
 background-color:green;
  border: none;
  color: black;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 100px;
}
a{
color:white;
text-decoration: none
}
</style>
<meta charset="UTF-8">
<title>allAq</title>
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
List<Category> clist=(List<Category>)request.getAttribute("clist");
List<ExamSchedule> elist=(List<ExamSchedule>)request.getAttribute("elist");
%>
	<div style="text-align:center;">
		<h1 >All Exam Schedules</h1>
		<!-- <form action="/addQ" method="POST"> -->
	</div>
<button class="b2" type="submit"><a href="/addE" style="color:white;">Schedule New Exam</a></button>
	<hr>
	<div>
		<table class="table table-success table-striped" id="viewallp">
			<thead>
				<tr>
					<th>Sl.No</th>
					<th>Exam Id</th>
					<th>Exam Name</th>
					<th>Exam Fee</th>
					<th>Date of Exam</th>
					<th>Exam Location</th>
					<th>syllabus</th>
					<th>Add Category</th>
					<th>Update</th>
					<th>Cancel The Exam</th>

				</tr>
			</thead>

			<%
          try{
        	  Class.forName("com.mysql.cj.jdbc.Driver");
        	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/OnlineTest","root","parmesh@215");
        	  Statement st=con.createStatement();
        	  String str="select *from exam_schedule";
        	  ResultSet re=st.executeQuery(str);
        	  int i=1;
        	  while(re.next()){
        		  int id=re.getInt("exam_id");
        		  %>
			<tbody>
				<tr>
					<td><%=i%></td>

					<td><%=re.getInt("exam_id")%></td>

					<td><%=re.getString("exam_name")%></td>
					<td><%=re.getInt("fee")%></td>
					<!-- <label>Question : </label> -->
					<%-- <td><<%=re.getString("question")%>></td> --%>
					<!-- <label>Option A</label> -->
					<%-- <td><%=re.getString("syllabus")%>></td> --%>
					<!-- <label>Option B</label> -->
					<td><%=re.getString("date_of_exam")%></td>
					<!-- <label>Option C</label> -->
					<td><%=re.getString("exam_location")%></td>
					<td><button class="b1">
							<a href="viewSyllabus/<%=id%>">View Syllabus</a>
						</button> <!-- <label>Option D</label> --> <%-- <td><%=re.getString("d")%></td> --%>
						<!-- <label>Answer</label> --> <%--  <td> <%=re.getString("answer")%>s</td> --%>


						<!-- <form action="/saveCategories" method="post"> --> <%-- <label>Exam Name</label>
               <select name="examName">
              <%for(int j=0;j<elist.size();j++){%>
    				<option><%=elist.get(i).getExamName()%></option>
           <%}%>
             
				</select> --%> <%-- <select name="cat">
 			  <%for(int j=0;j<clist.size();i++){%>
   				 <option><%=clist.get(j).getCat()%></option>
           <%}%>
             
</select> --%>
					<td><a href="/addCat/<%=id%>"><button class="b1">Add
								Category</a>
					</button></td>

                    <td><button class="b3" style="background-color:green">
							<a href="updateExam/<%=id%>">Update</a>
						</button>
					<td><button class="btn"> <a href="/delE/<%=id%>">Cancel</a></button></td>


				</tr>
			</tbody>



			<%i++;%>
			<% }%>
			<%   }catch(Exception e){
            	 out.println("Unable to connect to database"+e);
            	 
             
             }
           
        	  
          
            %>



		</table>
		<br>
		<button class="b1">
			<a href="/home">Back</a>
		</button>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>