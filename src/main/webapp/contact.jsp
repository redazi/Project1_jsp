<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/File.css">
<!------ Include the above in your HEAD tag ---------->

<title>Insert title here</title>
<script type="text/javascript">

function justnum(evt)
{
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode != 46 && charCode > 31 
	&& (charCode < 48 || charCode > 57))
	return false;
	return true;
}  

</script>
			
</head>
<body>
<nav class="navbar navbar-default navbar-expand-lg navbar-light justify-content-center" style="width: -2px;border-top-width: 2px;top: 1px;">
	
        <a class="navbar-brand" href="location.jsp" style="margin-left: 20px;margin-top: -11px;">
        <img src="img\logo_salle.jpg" alt="logo" width="30px" height="40px%">
        </a>
        
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
		<ul class="nav navbar-nav">
			<li class="nav-item"><a href="home.jsp" class="nav-link">Home</a></li>
			<li class="nav-item"><a href="reservation.jsp" class="nav-link">Reservation</a></li>		
		<li class="nav-item active"><a href="mesReservations.jsp" class="nav-link">Mes Reservation</a></li>
			<li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
		</ul>
		
		
		<ul class="nav navbar-nav navbar-right ml-auto">			
                    <li class="nav-item" >
		<a data-toggle="dropdown" id="log" class="nav-link dropdown-toggle" href="#" >Login</a>
				
			</li>
			<li class="nav-item" id="sign">
				<a href="#" data-toggle="dropdown" id="ter" class="btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1">Sign up</a>
				<ul class="dropdown-menu form-wrapper">					
					<li>
				
					</li>
				</ul>
			</li>
	<li><p>Bienvenue,${sessionScope.hello }</p></li>
 
     <script type="text/javascript">
                                      document.getElementById("ter").style.visibility = "hidden";
                                      document.getElementById("log").style.visibility = "hidden";
        </script>
               <li class="nav-item avatar dropdown" id="ava">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <img src="img/moncompte.png" class="rounded-circle z-depth-0"
            alt="avatar image">
        </a>
 
        <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary"
          aria-labelledby="navbarDropdownMenuLink-55">

          <a class="dropdown-item" href="logout.jsp">logout</a>
       
        </div>
      </li>       
                        
		</ul>
	</div>
</nav>

<div class="container contact-form">
            <div class="contact-image">
                <img src="img/contact.jpg" alt="contact"/>
            </div>
            <form method="post" action="Servlet7">
                <h3>Laissez nous un message</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="nom" class="form-control" placeholder="Entrer votre nom *" required="required" value="" />
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" placeholder="Entrer votre Email *" required="required" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="phone" onkeypress="return justnum(event)" maxlength="10" class="form-control" placeholder="Entrer votre numero de telephone *"  value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" name="btnSubmit" class="btnContact"  value="Envoyer votre Message" />
                        </div>
                    </div>
               
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="msg" class="form-control" placeholder="Votre Message *" required="required" style="width: 100%; height: 150px;"></textarea>
                        </div>
                           <div class="form-group">
                <% if(request.getAttribute("msg")!=null) out.print("<div class='alert alert-success' role='alert'>"+request.getAttribute("msg")+"</div>"); %>
              <% if(request.getAttribute("msg1")!=null) out.print("<div class='alert alert-danger' role='alert'>"+request.getAttribute("msg")+"</div>"); %>
                </div>
                    </div>
                </div>
            
            </form>
                 
</div>
  
</body>

</html>