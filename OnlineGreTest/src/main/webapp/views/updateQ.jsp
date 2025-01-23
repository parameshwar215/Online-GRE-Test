<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page
   import="java.sql.*"
   import="javax.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gre.entity.Questions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adding</title>

</head>
<style>
body{
background-color: skyblue;
}
form{
justify-content: center;
/* display: flex; */
margin: 10px 280px;
/* border: 3px solid skyblue; */

 padding: 10px; 

}
.addQ{
   /* text-align:center;  */
  
  margin: 10px 140px;
  width: 40%;
  height:110%; 
  border: 3px solid #73AD21;
  background-color: #FFFFE0;
   padding: 20px; 
 padding-left:20%; 
}
label{
display:inline-block;
/* width:90px; */
font-size:20px;
}
input{
width: 200px;
height:20px;
}
h1{
text-align:center;
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
  display:inline-flex;
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
  Questions q=(Questions)request.getAttribute("Q");
  int id=(int)request.getAttribute("id");
  String s=Integer.toString(id);
  %>    
         <%
          try{
        	  Class.forName("com.mysql.cj.jdbc.Driver");
        	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/OnlineTest","root","parmesh@215");
        	  Statement st=con.createStatement();
        	//  String sql = "INSERT INTO users (fullname, email, password) VALUES (?, ?, ?)"
        	  String str="select *from questions where question_id="+s;
        	  ResultSet res=st.executeQuery(str);
        	  /* out.print(res.getInt("negative_marks")); */
        	  while(res.next()){
        		  
        	%>
         <div>
            <h1>  Update Question  </h1>
        </div>
       <form action="/updateQuestion/<%=id%>" method="post" >
       <div class="addQ">
                <label >Question-Description </label><br>
                <input type="text" style="width: 200px;height:50px;" name="question" value="<%=res.getString("question")%>"  required><br><br>
                <label >Negative marks </label><br>
                <input type="text" name="negativeMarks" value="<%=res.getFloat("negative_marks")%>" required><br><br>
                <label >Option-A </label><br>
                <input type="text" name="a" value="<%=res.getString("a")%>" required><br><br>
                <label >Option-B </label><br>
                <input type="text" name="b" value="<%=res.getString("b")%>" required><br><br>
                <label >Option-C</label><br>
                <input type="text" name="c" value="<%=res.getString("c")%>" required><br><br>
                <label >Option-D</label><br>
                <input type="text" name="d" value="<%=res.getString("d")%>" required><br><br>
                <label >Answer </label><br>
                <input type="text" pattern="[A-D].{0,0}"name="answer" value="<%=res.getString("answer")%>" required><br><br>
              <button>Update Question</button>
        </form>
        </div>
        	 
        	 <%} %>
           <%   }catch(Exception e){
            	 out.println("Unable to connect to database"+e);
            	 
             
             }
             
        %>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
          
</body>
</html>