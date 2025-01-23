<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>
<%@ page import="com.gre.entity.Category" %>
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
 margin-top:0px;
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
margin-bottom:0px;
margin-top:0px;
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
<script>
function check(){
	var ans=
}

</script>
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("email") == null) {
		response.sendRedirect("/sessionexpired");

	}
	//String name=(String)
	%>
  <% 
  List<Category> list=(List<Category>)request.getAttribute("list");
  %>
         <div>
            <h1>Question Adding </h1>
        </div>
       <form action="/saveQ" onsubmit="return check()" method="post" >
       <div class="addQ">

               
                <label >Question-Description </label><br>
                <input type="text" name="Question" style="width: 200px;height:50px;" required><br><br>
                <label >Negative marks </label><br>
                <input type="text" name="negativeMarks" required><br><br>
                <label >Option-A </label><br>
                <input type="text" name="a" required><br><br>
                <label >Option-B </label><br>
                <input type="text" name="b" required><br><br>
                <label >Option-C</label><br>
                <input type="text" name="c" required><br><br>
                <label >Option-D</label><br>
                <input type="text" name="d" required><br><br>
                <label >Answer </label><br>
                <input type="text" name="answer" pattern="[A-D].{0,0}"required><br><br>
                
             <label>Select Category</label><br>
            <select name="categoryName" required><br>
            <option style="width: 200px;"><--.Please Select Category.--></option>
            <%for(int i=0;i<list.size();i++){
            int c=list.get(i).getCategoryId();
            %>
            <option><%=list.get(i).getCat()%></option>
           <%}%>
             <br> <br>
            </select>
            <br>
            <br>
            
            <button >Add Question</button> 
             </div>   
        </form>
       
        <button style="text-align:center"><a href="/home" style="text-decoration:none;color:white">Back</a></button>
       
        
             
  
</body>
</html>