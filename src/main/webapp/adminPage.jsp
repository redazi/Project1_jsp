<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if(session.getAttribute("user1")==null){
    	  RequestDispatcher request1 = request.getRequestDispatcher("adminlogin1.jsp");
    	  request1.forward(request, response);
    } %>
     <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestion des crenaux</title>
<link rel="stylesheet" href="reda.css">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="font/font-awesome.min.css">

<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
</head>
<body>
<!-- Vertical navbar -->
<div class="vertical-nav bg-white" id="sidebar">
  <div class="py-4 px-3 mb-4 bg-light">
    <div class="media d-flex align-items-center"><img src="img/administrateur.png" alt="..." width="65" class="mr-3 rounded-circle img-thumbnail shadow-sm">
      <div class="media-body">
        <h4 class="m-0">hello,${ sessionScope.user1 }</h4>
        <p class="font-weight-light text-muted mb-0">Administrateur</p>
      </div>
    </div>
  </div>

  <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Main</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
      <a href="adminPage.jsp" class="nav-link text-dark font-italic bg-light">
                <i class="fa fa-th-large mr-3 text-primary fa-fw"></i>
                Home
            </a>
    </li>
    <li class="nav-item">
      <a href="gererclient.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-address-card mr-3 text-primary fa-fw"></i>
                Gestion des clients
            </a>
    </li>
    <li class="nav-item">
      <a href="gerersalle.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                Gestion des salles
            </a>
    </li>
     <li class="nav-item">
      <a href="conreserv.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-line-chart mr-3 text-primary fa-fw"></i>
                Confirmer ou annuler Reservation
            </a>
    </li>
     <li class="nav-item">
      <a href="histo.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-line-chart mr-3 text-primary fa-fw"></i>
               historique des  Reservation
            </a>
    </li>
   
   
  </ul>

  

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
   <a href="Messagerie.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-area-chart mr-3 text-primary fa-fw"></i>
                Messagerie
            </a>
    </li>
   
    <li class="nav-item">
      <a href="logoutadmin.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-picture-o mr-3 text-primary fa-fw"></i>
               logout
            </a>
    </li>
     
        <li class="nav-item">
      <a href="index.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-pie-chart mr-3 text-primary fa-fw"></i>
                page client
            </a>
    </li>
    <li class="nav-item">
      <a href="logoutadmin.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-picture-o mr-3 text-primary fa-fw"></i>
               logout
            </a>
    </li>
  </ul>
</div>
<!-- End vertical navbar -->

<%
int c1=1;
int c=1;
int c11=1;
int c111=1;
  try {
	  
		 Class.forName("com.mysql.cj.jdbc.Driver");
       
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gsalle?serverTimezone=UTC","root","");
       Statement s = con.createStatement();
      
       ResultSet r= s.executeQuery("SELECT COUNT(reservation.code) FROM reservation WHERE reservation.valide=0");
       
     
      if(r.next()){
    	 
 	  
    		
    	   c= r.getInt("COUNT(reservation.code)");
    	   
    	 
       }
      
      ResultSet r1= s.executeQuery("SELECT COUNT(reservation.code) FROM reservation WHERE reservation.valide=1");
     
      
     if(r1.next()){
   	 
	  
   		
   	   c1= r1.getInt("COUNT(reservation.code)");
   	   
   	 
      }
     ResultSet r11= s.executeQuery("SELECT COUNT(salle.id) FROM salle");
     
     
     if(r11.next()){
   	 
	  
   		
   	   c11= r11.getInt("COUNT(salle.id)");
   	   
   	 
      }
 ResultSet r111= s.executeQuery("SELECT COUNT(login) FROM auth");
     
     
     if(r111.next()){
   	 
	  
   		
   	   c111= r111.getInt("COUNT(login)");
   	   
   	 
      }
     
      
   	
    
     
	}catch(SQLException | ClassNotFoundException e) {
		e.getStackTrace();
	}
  
  
  
  %>
<div class="container bootstrap snippet" style="margin-top: 258px;margin-left: 476px;">
  <div class="row">
    <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded">Reservations en attentent</div>
          <div class="circle-tile-number text-faded "><%=c %></div>
          <a class="circle-tile-footer" href="conreserv.jsp">plus d�taille<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>
        <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded">Reservations confirm�es</div>
          <div class="circle-tile-number text-faded "><%=c1 %></div>
          <a class="circle-tile-footer" href="histo.jsp" >Plus d�taille<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>
           <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded">Salles list�es</div>
          <div class="circle-tile-number text-faded "><%=c11 %></div>
           <a class="circle-tile-footer" href="gerersalle.jsp">plus d�taille<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>
      <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded">Nombre de clients</div>
          <div class="circle-tile-number text-faded "><%=c111 %></div>
          <a class="circle-tile-footer" href="gererclient.jsp">plus d�taille<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>
  
  </div> 
</div>  
  




</body>
</html>