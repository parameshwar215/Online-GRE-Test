<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<style>
.bid{
background-color:rgba(197,202,233,1.0);
text-align:center;
}
p{
color:orange;
}
input{
ailgn-items:center;
margin-left:43px;
}
.btn{
margin-right:80px;
}

</style>





<body class="bid">
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("email") == null) {
		response.sendRedirect("/sessionexpired");

	}
	//String name=(String)
	%>
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

		if (session.getAttribute("email") == null) {
			response.sendRedirect("/login");
		}
	%>
	<%
		boolean oldnewequal = (boolean) request.getAttribute("oldnewequal");
		boolean old = (boolean) request.getAttribute("old");
		boolean newconformsame = (boolean) request.getAttribute("newconformsame");
		boolean np = (boolean) request.getAttribute("np");
		boolean cp = (boolean) request.getAttribute("cp");
	%>
	<br>
	<br>
	<br>
	<br>
	
	<div class="background ">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-3 forms card">
				<h1>Change password</h1>
				<form:form method="post" action="changepassword" modelAttribute="changepassword">
					<div class="forget">
						<table>
							<%
								if (old) {
							%>
							<tr>
								<td style="color: red"><small>* old password is wrong</small></td>
							</tr>
							<%
								}
							%>
							<%
								if (oldnewequal) {
								%>
							<tr>
								<td style="color: red"><small>* Old and new password shouldn't be the same</small></td>
							</tr>
							<%
								}
							%>
							<%
								if (newconformsame) {
							%>
							<tr>
								<td style="color: red"><small>* New and conform password should be the same</small></td>
							</tr>
							<%
								}
							%>
							<%
								if (np && cp) {
							%>
							<tr>
								<td style="color: red"><small>* New and conform password should not be null</small></td>
							</tr>
							<%
								}
							%>
							<tr>
								<td class="mx-5 my-2"><form:input type="password" class="form-control" path="oldPassword" placeholder="Enter old password"  /></td>
								<td><form:errors path="oldPassword" cssClass="error"></form:errors></td>
							</tr>
							<tr>
								<td><form:input type="password" class="form-control " path="newPassword" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{6,}$" title="Password should be at least 6 characters long, including one uppercase letter, one lowercase letter, one digit, and one special character." placeholder="Enter New password"  /></td>
								<td><form:errors path="newPassword" cssClass="error"></form:errors></td>
								<p><super>*</super>Password should be at least 6 characters long, including one uppercase, one lowercase, one digit, and one special character.</p>
							</tr>
							<tr>
								<td><form:input type="password" class="form-control" path="conformPassword" placeholder="Enter Conform password"  /></td>
								<td><form:errors path="conformPassword" cssClass="error"></form:errors></td>
							</tr>
							<tr>
								<td><input  type="submit" value="Submit" class="btn btn-primary text-center"></td>
								<td><button class="btn btn-primary text-center"><a href="/profile" style="text-decoration:none;color:white">Back</a></button></td>
								
							</tr>
						</table>
						
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>

 
 
 
 