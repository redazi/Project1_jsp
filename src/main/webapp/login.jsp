<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestion des crenaux</title>
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
			<li class="nav-item"><a href="login.jsp" class="nav-link">Reservation</a></li>			
		
			<li class="nav-item"><a href="login.jsp" class="nav-link">Contact</a></li>
		</ul>
		
		
		<ul class="nav navbar-nav navbar-right ml-auto">			
                    
			<li class="nav-item" id="sign">
				<a href="signup.jsp"  id="ter" class="btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1">Sign up</a>
				<ul class="dropdown-menu form-wrapper">					
					
				</ul>
			</li>
	
 
 
           
		</ul>
	</div>
</nav>


                
                
   <div style="/*! width:750px; */padding-left: 257px;border-left-width: 0px;border-left-style: solid;padding-right: 254px;margin-top: 84px;">
  <form class="text-center border border-light p-5" method="post" action="Servlet1">

                <p class="h4 mb-4">Sign in</p>

                <!-- Email -->
                <input type="text" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="username" name="login1" required="required">

                <!-- Password -->
                <input type="password" id="defaultLoginFormPassword" class="form-control mb-4" name="pass" placeholder="Password" required="required">

                <div class="d-flex justify-content-around">
                    <div>
                        <!-- Remember me -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                            <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
                        </div>
                        
                    </div>
                    <div>
                        <!-- Forgot password -->
                        <a href="">Forgot password?</a>
                    </div>
                </div>
                 <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>
 <% if(request.getAttribute("error1")!=null) out.print("<div class='alert alert-danger' role='alert'>"+request.getAttribute("error1")+"</div>"); %>
       
            </form>
            <!-- Default form login -->

</div>
                
                

</body>






</html>