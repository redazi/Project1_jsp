<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<% if(session.getAttribute("hello")==null){
    	  RequestDispatcher request1 = request.getRequestDispatcher("index.jsp");
    	  request1.forward(request, response);
    } %>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


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



<div style="margin-left: 195px;border-right-style: solid;margin-right: 121px;border-right-width: 0px;">
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Filtrage par code de salle.." style="height: 44px;width: 352px;">
<table  id="tbl" onkeyup="myFunction()">
  <tr>
    <th>code</th>
    <th>libellé</th>
  </tr>
  <tr>
  
  <%
 
  try {
	
		 Class.forName("com.mysql.cj.jdbc.Driver");
       
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gsalle?serverTimezone=UTC","root","");
       Statement s = con.createStatement();
      
       ResultSet r= s.executeQuery("SELECT DISTINCT salle.code,salle.libelle FROM salle where salle.code not in (SELECT reservation.code from reservation WHERE reservation.valide!=-1) ");
       
       while(r.next()){
    	   String matr=r.getString("code");
    	  	String code=r.getString("code");
    	  	String libelle=r.getString("libelle");
    	  	
    		
    		%>
    		
    	    <td><%=code %></td>
    	    <td><%=libelle %></td>
    	    
    	    <td>   <form action="Servlet8">
  <div class="form-group" >
    <input type="hidden"  class="form-control" name="hide" value="<%=matr %>"  >
    
  </div>
  <button type="submit" class="btn btn-primary">
Réserver 
</button>
</form>  </td>
    	  </tr>
    	  
    	  <% 
       }
   	
     
     
	}catch(SQLException | ClassNotFoundException e) {
		e.getStackTrace();
	}
  
  
  
  %>

 
</table>

</div>



</body>
</html>