<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% if(session.getAttribute("hello")==null){
    	  RequestDispatcher request1 = request.getRequestDispatcher("index.jsp");
    	  request1.forward(request, response);
    } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CarLocation</title>
<link rel="stylesheet" href="Style.css">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="font/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	// Prevent dropdown menu from closing when click inside the form
	$(document).on("click", ".navbar-right .dropdown-menu", function(e){
		e.stopPropagation();
	});
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
			<li class="nav-item"><a href="location.jsp" class="nav-link">Home</a></li>
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
     <div class="gallery" style="margin-top: -18px;">
     
            <img src="img\index1.jpg" alt="index Icon" height="620px">
</div>

                <!-- Footer -->
<footer class="page-footer font-small mdb-color pt-4">

  <!-- Footer Links -->
  <div class="container text-center text-md-left">

    <!-- Footer links -->
    <div class="row text-center text-md-left mt-3 pb-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">gestion salles</h6>
        <p>La nouvelle entreprise de gestion de salle !.</p>
      </div>
      <!-- Grid column -->

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">lien admin</h6>
        <p>
          <a href="adminlogin1.jsp">Page admin</a>
        </p>
        
        
      </div>

      <!-- Grid column -->
      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
        <p>
          <i class="fas fa-home mr-3"></i> Youssoufia, 4366, MAR</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> zidahireda97@gmail.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> + 524645589</p>
        <p>
          <i class="fas fa-print mr-3"></i> + 06 96 58 77 11 22 </p>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Footer links -->

    <hr>

    <!-- Grid row -->
    <div class="row d-flex align-items-center">

      <!-- Grid column -->
      <div class="col-md-7 col-lg-8">

        <!--Copyright-->
        <p class="text-center text-md-left">© 2022 Copyright:
          <a href="https://mdbootstrap.com/">
            <strong> gestion salles</strong>
          </a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-5 col-lg-4 ml-lg-0">

        <!-- Social buttons -->
        <div class="text-center text-md-right">
          <ul class="list-unstyled list-inline">
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-google-plus-g"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </li>
          </ul>
        </div>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

</footer>
<!-- Footer -->
</body>

</html>