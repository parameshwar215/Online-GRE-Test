<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
   import="java.sql.*"
   import="javax.sql.*"%>
<%@ page import="com.gre.entity.Category" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
    crossorigin="anonymous">
/* input{
border:0px;
border-bottom:2px;
 outline: none;
}  */

      
#no_outline:focus{
   outline: none;
  }
#viewallp{
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#viewallp td, #viewallp th {
  border: 1px solid #ddd;
  padding: 8px;
}

#viewallp tr:nth-child(even){background-color: #f2f2f2;}

#viewallp tr:hover {background-color: #ddd;}

#viewallp th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
.btn {
 /*  background-color: DodgerBlue; */
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 100px;
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: RoyalBlue;
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

a{
text-decoration: none
}
.b1:hover {
  background-position: -20px -20px;
}

.b1:focus:not(:active) {
  box-shadow: rgba(40, 170, 255, 0.25) 0 0 0 .125em;
} 

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  
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
List<Category> clist=(List<Category>)session.getAttribute("clist");
var catLength=clist.size();
//boolean flag=(boolean)request.getAttribute("flag");
%>

 <h3 style="text-align:center;">All  Category Questions (No of Catogiries: <%=catLength%>)</h3>
          
     <table >

  <tr>
  <td  style="text-align: center; width:50px">
  
    <div id="boxes">
               <div id="column1">
               <button class="b1" ><a href="/home" style="color:white" >Home</a></button>
               
                      <!-- <form action="/addQ" method="POST"> -->
                      <button class="b1" type="submit"><a href="/addQ" style="color:white;" >Add Question</a></button>
    </div>
  </td>
  
    <td  style="text-align: left;width:50px">
    
           
   <div id="column1">
           
           <form action="/saveC" method="POST">
        <input style="margin-right:20px;margin-top:7px" type="text" name="cat" placeholder="Add New Category" required>
        <button class="b1">add category</button>
          </form>
   </div>
    
    </td>
    <td  style="text-align: left;width:50px">
     <form action="/deleteC" method="get">
            <select style="margin-right:20px;margin-top:7px;" name="cat" required>
            
            
            <option  style="width: 200px"><--.Please Select Category.--></option>
             <%for(Category cat:clist){%>
               
               <option><%=cat.getCat()%></option>
                
            <%}%>
            
            </select>
            <button class="b1">Remove Category</button>
             </form>
    </td>
  
  </tr>
</table>     
          
          
          
 

      <div id="column3">
            <%
            if((boolean)session.getAttribute("flag")==true){%>
            <p style="color:red"><super>*</super>You Can't Delete This Category because this category may assigned for one or more exams, if you want to delete this category make sure remove this category from the Exams</p>
           <% }%> 
            <% session.setAttribute("flag", false);%>
            
            
            <hr>
           
            
       </div>
  </div>         
 
<div>              
<%
int c=1;
for(Category cat:clist){%>
	
  <button class="b1"><a href="getQuestion/<%=cat.getCategoryId()%>" style="color:white"><%=c%>. <%=cat.getCat() %></a></button>	
<%c++;} %>
<a href="/viewQuestions" ><button class="b1">View All Questions</button></a>
       
               <hr>
 </div>  
   <div>
   
     <table class="table table-success table-striped" id="viewallp">
              <thead>
              <tr>
              <th>Qn.No</th>
              <th>Category</th>
              <th>Negative Marks</th>
              <th>Question</th>
              <th>Option A</th>
              <th>Option B</th>
              <th>Option C</th>
              <th>Option D</th>
              <th>Answer</th>
              <th>Updation</th>
              <th>Deletion</th>
              </tr>
              </thead>  
               
            <%
          try{
        	  Class.forName("com.mysql.cj.jdbc.Driver");
        	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/OnlineTest","root","parmesh@215");
        	  Statement st=con.createStatement();
        	  String str="select *from questions";
        	  ResultSet re=st.executeQuery(str);
        	  int i=1;
        	  while(re.next()){
        		  int id=re.getInt("question_id");
        		  %>
        		  
        		   <tbody>
        		    <tr> 
        		    <td><%=i%></td>
        		    
                    <td><%=re.getString("category_name")%></td>
                    
                   <td><%=re.getFloat("negative_marks")%></td>
                   <td><%=re.getString("question")%></td>
                    <!-- <label>Question : </label> -->
                   <%-- <td><<%=re.getString("question")%>></td> --%>
                    <!-- <label>Option A</label> -->
                   <td><%=re.getString("a")%></td>
                    <!-- <label>Option B</label> -->
                   <td><%=re.getString("b")%></td>
                   <!-- <label>Option C</label> -->
                   <td><%=re.getString("c")%></td>
                    <!-- <label>Option D</label> -->
                   <td><%=re.getString("d")%></td>
                    <!-- <label>Answer</label> -->
                   <td> <%=re.getString("answer")%></td>
                  <%--  <td><a href="/updateQ/<%=id%>"><button style = "background-color:skyblue" type="submit">Update</button>   </td> --%>
                  <td><button  class="btn" style="background-color:green;"> <a href="/updateQ/<%=id%>" style="color:white">update</a></button> </td>
                  <td> <button class="btn" style="background-color:red;"><a href="/deleteQ/<%=id%>" style="color:white">Delete</a></button> </td>
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
                  <button class="b1" ><a href="/home" style="color:white" >Back</a></button>
     </div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      
</body>
</html>