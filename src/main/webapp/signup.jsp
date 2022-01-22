<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CarLocation</title>
<link rel="stylesheet" href="Style.css">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="font/font-awesome.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/func2.js"></script>
<script type="text/javascript">
	// Prevent dropdown menu from closing when click inside the form
	$(document).on("click", ".navbar-right .dropdown-menu", function(e){
		e.stopPropagation();
	});
</script>
<style>


table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
</head>
<body>

<nav class="navbar navbar-default navbar-expand-lg navbar-light justify-content-center" style="width: -2px;border-top-width: 2px;top: 1px;">
	
        <a class="navbar-brand" href="index.jsp" style="margin-left: 20px;margin-top: -11px;">
        <img src="img\logo_salle.jpg" alt="logo" width="30px" height="40px%">
        </a>
        
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
		<ul class="nav navbar-nav">
			<li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
			<li class="nav-item"><a href="signup.jsp" class="nav-link">Reservation</a></li>			
		
			<li class="nav-item"><a href="signup.jsp" class="nav-link">Contact</a></li>
		</ul>
		
		
		<ul class="nav navbar-nav navbar-right ml-auto">			
                    <li class="nav-item" >
		<a  id="log" class="nav-link dropdown-toggle" href="login.jsp" >Login</a>
				
			</li>
			
	
 
 
           
		</ul>
	</div>
</nav>


                
                <div style="/*! width:750px; */padding-left: 257px;border-left-width: 0px;border-left-style: solid;padding-right: 254px;margin-top: 47px;">
<!-- Sign in button -->
               
						<form class="text-center border border-light p-5" action="Servlet2" method="post">
							<p class="hint-text">Créer un nouveau compte!</p>
							<div class="form-group">
								<input type="text" class="form-control" name="user" placeholder="Username" value="<% if(request.getParameter("user")!=null) out.print(request.getParameter("user")); %>" required="required">
								<% if(request.getAttribute("error3")!=null) out.print("<div class='alert alert-danger' role='alert'>"+request.getAttribute("error3")+"</div>"); %>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="passw" placeholder="Password" required="required">
							  <% if(request.getAttribute("error4")!=null) out.print("<div class='alert alert-danger' role='alert'>"+request.getAttribute("error4")+"</div>"); %>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="cpassw" placeholder="Confirm Password" required="required">
							<% if(request.getAttribute("error5")!=null) out.print("<div class='alert alert-danger' role='alert'>"+request.getAttribute("error5")+"</div>"); %>
							</div>
							<div class="form-group">
								<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms &amp; Conditions</a></label>
							</div>
							<input type="submit" id="sig" class="btn btn-primary btn-block" value="Sign up">
							<% if(request.getAttribute("error14")!=null) out.print("<div class='alert alert-success' role='alert'>"+request.getAttribute("error14")+"</div>"); %>
						</form>
				


</div>
                

</body>






</html>