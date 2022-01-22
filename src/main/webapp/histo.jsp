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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Template/Menu.jsp" %>



                   
                           <div style="margin-left: 331px;border-right-style: solid;border-right-width: 0px;width: 1041px;margin-top: 7px;">
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Filtrage par Date de reservation.." style="height: 44px;width: 352px;">
<table  id="tbl" onkeyup="myFunction()">
   <tr>
    <th><strong>id</strong></th>
    <th><strong>Date de reservation</strong></th>
    <th><strong>login</strong></th>
    <th><strong>code de salle</strong></th>
    <th><strong>Date debut</strong></th>
    <th><strong>Date fin</strong></th>
  </tr>
  <tr>
  
  <%
  
  
  try {
	
		 Class.forName("com.mysql.cj.jdbc.Driver");
       
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gsalle?serverTimezone=UTC","root","");
       Statement s = con.createStatement();
      
       ResultSet r= s.executeQuery("select * from reservation");
       int c =0;
       while(r.next()){
    	   c++;
    	   
    	  	String datedebut=r.getString("datedebut");
    	  	String datefin=r.getString("datefin");
    	  	String num_mat=r.getString("code");
    	  	String log=r.getString("log");
    	  	Date datereservation=r.getDate("datereservation");
    	  	int v = r.getInt("valide");
    		%>
    	    <td><strong><%=c %></strong></td>
    	    <td><strong><%=datereservation %></strong></td>
    	    <td><strong><%=log %></strong></td>
    	    <td><strong><%=num_mat %></strong></td>
    	    <td><strong><%=datedebut %></strong></td>
    	    <td><strong><%=datefin %></strong></td>
    	    <td><strong><% if(v>0){out.println("Confirmer par l'administration");
 	         }else if(v<0){
 	        	out.println("Annuler par l'administration ");
 	         }else{
 	        	out.println("En attente de confirmation ou l'anulation");;
 	         } %></strong></td>
    	    <td>   <form action="Servlet10">
 
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