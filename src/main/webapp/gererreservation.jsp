<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<title>CarLocation</title>
<link rel="stylesheet" href="New.css">
<script src="js/func.js"></script>
<link rel="stylesheet" href="font/font-awesome.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="script/clients.js" type="text/javascript"></script>
<style type="text/css">fieldset  {
    width: 50%;
    margin: auto;
}
.tab{
    border-collapse: collapse;
    margin: 0 auto; 
      font-family: Arial;
}

.tab td, th{
    border : 1px solid black;
    padding: 10px 15px;
    font-family: Arial;
}

.tab tr:nth-child(2n){
    background-color: activeborder;
    font-family: Arial;
}

.tab tr:nth-child(2n + 1){
    background-color: azure;
    font-family: Arial;
}
.bnupdate {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    font-family: Arial;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
}

.bndelete {
    background-color: coral; /* Green */
    border: none;
    color: white;
    font-family: Arial;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
}


</style>
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
      <a href="ajoutcar.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-address-card mr-3 text-primary fa-fw"></i>
                ajouter une Voiture
            </a>
    </li>
    <li class="nav-item">
      <a href="supprimer.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                Supprimer une Voiture
            </a>
    </li>
     <li class="nav-item">
      <a href="modifierVoiture0.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-picture-o mr-3 text-primary fa-fw"></i>
               Modifier une voiture
            </a>
    </li>
    <li class="nav-item">
      <a href="logoutadmin.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-picture-o mr-3 text-primary fa-fw"></i>
               logout
            </a>
    </li>
  </ul>

  <p class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">Charts</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
   <a href="Messagerie.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-area-chart mr-3 text-primary fa-fw"></i>
                Messagerie
            </a>
    </li>
   
     <li class="nav-item">
      <a href="gererreservation.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-line-chart mr-3 text-primary fa-fw"></i>
                Gerer les reservation
            </a>
    </li>
      <li class="nav-item">
      <a href="conreserv.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-line-chart mr-3 text-primary fa-fw"></i>
                Confirmer ou annuler Reservation
            </a>
    </li>
        <li class="nav-item">
      <a href="index.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-pie-chart mr-3 text-primary fa-fw"></i>
                page client
            </a>
    </li>
  </ul>
</div>
<!-- End vertical navbar -->
<div class="content">
<fieldset>
                <legend>Informations Client</legend>
                <table border="0">
                    <tr>
                        <td>login</td>
                        <td><input id="login" type="text" name="login" value=""  required=""/></td>
                    </tr>
                    <tr>
                        <td>mot de passe</td>
                        <td><input  id="passe" type="password" name="passe" value="" required="" /></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>
                            <input id="add" type="submit" value="Envoyer" />
                            
                        </td>
                    </tr>
                </table>
            </fieldset>
                
                           <div style="margin-left: 331px;border-right-style: solid;border-right-width: 0px;width: 1041px;margin-top: 7px;">
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Filtrage par Date de reservation.." style="height: 44px;width: 352px;">
<table  id="tbl" onkeyup="myFunction()">

     <thead>
                        <tr>
                            <th>Id</th>
                            <th>login <br>
                            <th>passeword</th>
                            
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody id="content">
                          
                    </tbody>
</table>
        
</div>
                           
       </div>              

           

</body>
</html>