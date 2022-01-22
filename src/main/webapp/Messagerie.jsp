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
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Filtrage par Nom.." style="height: 44px;width: 352px;">
<table  id="tbl" onkeyup="myFunction()">
   <tr>
    <th><strong>id</strong></th>
    <th><strong>Nom</strong></th>
    <th><strong>Email</strong></th>
    <th><strong>Phone</strong></th>
    <th><strong>Message</strong></th>
  </tr>
  <tr>
  <%
  try {
	
		 Class.forName("com.mysql.cj.jdbc.Driver");
       
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gsalle?serverTimezone=UTC","root","");
       Statement s = con.createStatement();
      
       ResultSet r= s.executeQuery("select * from contact");
       //int c =0;
       while(r.next()){
    	   //c++;
    	   int id=r.getInt("id");
    	  	String nom=r.getString("nom");
    	  	String email=r.getString("email");
    	  	int phone=r.getInt("phone");
    	  	String message=r.getString("message");
 	   
    		%>
    	    <td><strong><%=id %></strong></td>
    	    <td><strong><%=nom %></strong></td>
    	    <td><strong><%=email %></strong></td>
    	    <td><strong><%=phone %></strong></td>
    	    <td><strong><%=message %></strong></td>
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