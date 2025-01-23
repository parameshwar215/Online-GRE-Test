<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.gre.entity.Admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

</head>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

form {
 
  display: flex;
  flex-direction: column;
  align-items: center;
}

.container {
/* margin: 50px auto;
 border-left: 10px solid #000;
  border-right: 10px solid #FFF; */
   border: 1px solid #eb4e24;
  padding:40px;
  padding-top:10px;
  
  display: flex;
  flex-direction: column;
  width: 25vw;
}

h1, p {
  text-align: center;
}

input,select {
  margin: 0.25em 0em 1em 0em;
  outline: none;
  padding: 0.5em;
  border: none;
  background-color: rgb(225, 225, 225);
  border-radius: 0.25em;
  color: black;
}
button {
  padding: 0.75em;
  border: none;
  outline: none;
  background-color: rgb(68, 18, 232);
  color: white;
  border-radius: 0.25em;
}

/* hover functionality for button */
button:hover {
  cursor: pointer;
  background-color: rgb(41, 4, 164);
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
  /* String name=(String)request.getAttribute("name");
  long phNo=(long)request.getAttribute("phNo"); */
  Admin ad=(Admin)request.getAttribute("admin");
  %>      
       <form action="/saveUpdates" method="post" >
                <div class="container">
            <h1>Update profile </h1>
        
                
          
                <label >Admin Id: </label>
                <input type="text" name="adminId" value=<%=ad.getAdminId()%> readonly>
                <label >Email Id </label>
                <input type="text" name="email" value=<%=ad.getEmail()%> readonly>
                 <label >Phone No </label>
                <input type="text" name="phoneNo" value=<%=ad.getPhoneNo()%> readonly>
                  <label >Admin Name: </label>
                 <input type="text" name="adminName" value=<%=ad.getAdminName()%>>
                 
                 <label >Address </label>
                <input type="text" name="address" value=<%=ad.getAddress()%> >
                <label > City</label>
                <input type="text" name="city"  pattern="[A-Za-z].{3,}"value=<%=ad.getCity()%> >
                <label >State </label>
                <%-- <input type="text" name="state" value=<%=ad.getState()%>> --%>
			<select name="state" id="state" class="form-control">
				<option value="Andhra Pradesh">Andhra Pradesh</option>
				<option value="Telangana">Telangana</option>
				<option value="Arunachal Pradesh">Arunachal Pradesh</option>
				<option value="Assam">Assam</option>
				<option value="Bihar">Bihar</option>
				<option value="Chandigarh">Chandigarh</option>
				<option value="Chhattisgarh">Chhattisgarh</option>
				<option value="Goa">Goa</option>
				<option value="Gujarat">Gujarat</option>
				<option value="Haryana">Haryana</option>
				<option value="Himachal Pradesh">Himachal Pradesh</option>
				<option value="Jammu and Kashmir">Jammu and Kashmir</option>
				<option value="Jharkhand">Jharkhand</option>
				<option value="Karnataka">Karnataka</option>
				<option value="Kerala">Kerala</option>
				<option value="Madhya Pradesh">Madhya Pradesh</option>
				<option value="Maharashtra">Maharashtra</option>
				<option value="Manipur">Manipur</option>
				<option value="Meghalaya">Meghalaya</option>
				<option value="Mizoram">Mizoram</option>
				<option value="Nagaland">Nagaland</option>
				<option value="Odisha">Odisha</option>
				<option value="Punjab">Punjab</option>
				<option value="Rajasthan">Rajasthan</option>
				<option value="Sikkim">Sikkim</option>
				<option value="Tamil Nadu">Tamil Nadu</option>

				<option value="Tripura">Tripura</option>
				<option value="Uttar Pradesh">Uttar Pradesh</option>
				<option value="Uttarakhand">Uttarakhand</option>
				<option value="West Bengal">West Bengal</option>
			</select> <label>Country </label> <select name="country" id="state"
				class="form-control">
				<option value="Andhra Pradesh">India</option>
			</select>.
			<button>Save Details</button><br>
			<button><a href="/profile" style="text-decoration:none;color:white">Back</a></button>
		</div>
        </form>
</body>
</html>