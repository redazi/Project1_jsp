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


            <fieldset>
                <legend>Liste des Clients</legend>

                <table border="1" class="tab" id="table">
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

            </fieldset>
                  
        </div>
</body>
</html>