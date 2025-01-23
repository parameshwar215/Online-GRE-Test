<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gre.entity.Admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.profile{
align-items:center;
      border:1px solid #DDDDDD; 
     -webkit-border-radius:10px;
    -moz-border-radius:10px;
    border-radius:10px; 
     box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);  
}	

 
table {
border-radius:10px;
  border-collapse: collapse;
  width: 30%;
}

 td {
 border:1px solid #DDDDDD;
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
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
color:white;
text-decoration:none;
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

   <h3>Profile Details</h3> 
   <hr>
  <div class="profile">
  <img src="adminimg.png">
  <%
  /* String name=(String)request.getAttribute("name");
  long phNo=(long)request.getAttribute("phNo"); */
  Admin ad=(Admin)request.getAttribute("admin");
  %> 

  
  <table class="table table-user-information">
                <tbody>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                Admin ID                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                             <%=ad.getAdminId()%>
                        </td>
                    </tr>
                    <tr>    
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                Admin Name                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                              <%=ad.getAdminName()%>
                        </td>
                    </tr>
                  
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                               Phone Number                                              
                            </strong>
                        </td>
                        <td class="long-primary">
                            <%=ad.getPhoneNo()%>
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                               Admin Email ID                                               
                            </strong>
                        </td>
                        <td class="text-primary">
                           <%=ad.getEmail()%>
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                               Address                                            
                            </strong>
                        </td>
                        <td class="text-primary">
                            <%=ad.getAddress()%>
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                               City                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                           <%=ad.getCity()%>
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                              State                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                           <%=ad.getState()%>
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                              Country                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                            <%=ad.getCountry()%>
                        </td>
                    </tr>
                          
                </tbody>
            </table><br>
          
           
          
            <button><a href="/home" >Back</a></button>
            <button class="b2"><a href="/editP">Update Profile</a></button> 
           
            <button><a href="/forgetpassword" >Reset Password</a></button><br><br>
            
            
             
      </div>
</body>
</html>