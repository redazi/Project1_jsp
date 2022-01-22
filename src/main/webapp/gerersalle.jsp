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
                <legend>Informations salle</legend>
                <table border="0">
                    <tr>
                        <td>code</td>
                        <td><input id="code" type="text" name="code" value=""  required=""/></td>
                    </tr>
                    <tr>
                        <td>libelle</td>
                        <td><input  id="libelle" type="text" name="libelle" value="" required="" /></td>
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
                <legend>Liste des salles</legend>

                <table border="1" class="tab" id="table">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>code <br>
                            <th>libelle</th>
                            
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