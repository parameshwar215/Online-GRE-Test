<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
   import="java.sql.*"
   
   import="javax.sql.*"%>
<%@ page import="com.gre.entity.Category" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
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
.b3 {
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

.b3:active,
.b3:focus {
  outline: none;
}

.b3:hover {
  background-position: -20px -20px;
}

.b3:focus:not(:active) {
  box-shadow: rgba(40, 170, 255, 0.25) 0 0 0 .125em;
}  
.b2 {
background-color: #3EB2FD;
border: none;
border-radius:30px;
 color: white;
 padding: 15px 32px;
  text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
    margin: 4px 2px;
     cursor: pointer;

}
a{
text-decoration:none;
color:white;
}
</style>
<meta charset="UTF-8">
<title></title>
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
//List<Category> clist=(List<Category>)request.getAttribute("clist");
  String c=(String)request.getAttribute("cname");
  int cat_id=(int)request.getAttribute("id");
  String s=Integer.toString(cat_id);
  %>

<h3 style="text-align:center"><%=c%>-Questions</h3>
  <hr>
                <div>
                <h3></h3>
                  <a href="/addQ"><button class="b3">Add Question</button></a>
                      
                
                <a href="/viewQuestions" ><button class="b3"> View All Questions</button></a>
                </div>
                <hr>
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
        	  String str="select *from questions where cat_id="+s;
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
              
                   <td><%=re.getString("a")%></td>
             
                   <td><%=re.getString("b")%></td>
                  
                   <td><%=re.getString("c")%></td>
               
                   <td><%=re.getString("d")%></td>
                   
                   <td> <%=re.getString("answer")%></td>
                  <td> <button class="b2" style="background-color:green;" ><a  href="/updateQ/<%=id%>">update</a></button> </td>
                  <td> <button class="b2" style="background-color:red;"><a href="/deleteQ/<%=id%>">Delete</a></button> </td>
                  
                   </tr> 
                   </tbody> 
                   
  
         
        		  <%i++;%>
        		 <% }%>
        		 
        		  <%
                  
                      con.close();
                  	
                  %>
           <%   }catch(Exception e){
            	 out.println("Unable to connect to database"+e);
            	
             }
            
            %>
            
        
       
      </table>
     </div><br>
     <a href="/viewQuestions" ><button class="b3">Back</button></a>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      
</body>
</html>