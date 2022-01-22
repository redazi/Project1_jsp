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
    <th><strong>code de la salle</strong></th>
    <th><strong>Date debut</strong></th>
    <th><strong>Date fin</strong></th>
  </tr>
  <tr>
  
  <%
  
  
  try {
	
		 Class.forName("com.mysql.cj.jdbc.Driver");
       
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gsalle?serverTimezone=UTC","root","");
       Statement s = con.createStatement();
      
       ResultSet r= s.executeQuery("select * from reservation where valide=0");
       int c =0;
       while(r.next()){
    	   c++;
    	   
    	  	String datedebut=r.getString("datedebut");
    	  	String datefin=r.getString("datefin");
    	  	String num_mat=r.getString("code");
    	  	String log=r.getString("log");
    	  	Date datereservation=r.getDate("datereservation");
 	   
    		%>
    	    <td><strong><%=c %></strong></td>
    	    <td><strong><%=datereservation %></strong></td>
    	    <td><strong><%=log %></strong></td>
    	    <td><strong><%=num_mat %></strong></td>
    	    <td><strong><%=datedebut %></strong></td>
    	    <td><strong><%=datefin %></strong></td>
    	    <td>   <form action="Servlet12" method="post">
  <div class="form-group" >
    <input type="hidden"  class="form-control" name="hide3" value="<%=num_mat %>"  >
     <input type="hidden"  class="form-control" name="hide4" value="<%=log %>"  >
  </div>
  <button type="submit" style="width: 194px;" class="btn btn-primary">
Annuler la reservation 
</button>

</form> 
<form action="Servlet11" method="post">
  <div class="form-group" >
    <input type="hidden"  class="form-control" name="hide5" value="<%=num_mat %>"  >
     <input type="hidden"  class="form-control" name="hide6" value="<%=log %>"  >
  </div>
  <button type="submit" class="btn btn-primary">
Confirmer la reservation 
</button>

</form> </td>
    	  </tr>
    	  
    	  <% 
    	  
       }
   	
     
     
	}catch(SQLException | ClassNotFoundException e) {
		e.getStackTrace();
	}
  
  
  
  %>
 
</table>
           <div class="form-group">
                                        <% if(request.getAttribute("msge1")!=null) out.print("<div class='alert alert-danger' role='alert'>"+request.getAttribute("msge1")+"</div>"); %>
                                    <% if(request.getAttribute("msge")!=null) out.print("<div class='alert alert-success' role='alert'>"+request.getAttribute("msge")+"</div>"); %>
                             </div>
</div>
                           
                  

           

</body>
</html>