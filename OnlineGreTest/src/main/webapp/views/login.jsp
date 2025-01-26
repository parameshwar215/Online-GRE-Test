<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin login</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

</head>
<style>
body
{
    margin: 0;
    padding: 0;
    background-color:#6abadeba;
    font-family: 'Arial';
}
.mb-3{
        width: 382px;
        overflow: hidden;
        margin: auto;
        margin: 20 0 0 450px;
        padding: 80px;
        background: #23463f;
        border-radius: 15px ;

}
h1{
text-align: center;
    color: #277582;
    padding: 20px;
    }
    label{
    color: #08ffd1;
    font-size: 17px;
}
#email{
    width: 230px;
    height: 30px;
    border: none;
    border-radius: 3px;
    padding-left: 8px;
}
#password{
    width: 230px;
    height: 30px;
    border: none;
    border-radius: 3px;
    padding-left: 8px;

}
#log{
    width: 230px;
    height: 30px;
    border: none;
    border-radius: 17px;
    padding-left: 7px;
    color: blue;


}
span{
    color: white;
    font-size: 17px;
}
#xx{
color:white;}

</style>
<body>



	<h1>Admin Login</h1>

	
	<form class="row g-1 align-items-center" action="/login" method="post" onsubmit="return check()">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" id="email" name="email"  aria-describedby="emailHelp" required>
    <!-- <div id="xx">We'll never share your email with anyone else..</div> -->
 
  
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password"  name="password" id="password" required><br><br><br>
  
  
  <button type="submit"  id="log">Submit</button>
   </div>
</form>
<script>
        function check() {
        	return true;
        }
        var error="<%=request.getAttribute("error")%>";
        if(error && error!=="null" && error.trim()!=""){
      
        	alert(error);
        }       
    </script>


</body>
</html>
