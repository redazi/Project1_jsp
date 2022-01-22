<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestion des crenaux</title>

<link rel="stylesheet" type="text/css" href="New.css">
<link rel="stylesheet" href="font/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
</head>
<body>

<div style="padding-left: 257px;border-left-width: 0px;border-left-style: solid;padding-right: 254px;margin-top: 223px;" class="form-ad">


  <form class="text-center border border-light p-5" method="post" action="Servlet3">

                <p class="h4 mb-4">Sign in</p>

                <!-- Email -->
                <input type="text" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="username" name="user1" required="required">

                <!-- Password -->
                <input type="password" id="defaultLoginFormPassword" class="form-control mb-4" name="pw" placeholder="Password" required="required">

                <div class="d-flex justify-content-around">
                    <div>
                        <!-- Remember me -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                            <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
                        </div>
                        
                    </div>
                    <div>
                        <!-- Forgot password -->
                        <a href="">Forgot password?</a>
                    </div>
                </div>
 <% if(request.getAttribute("error")!=null) out.print("<div class='alert alert-danger' role='alert'>"+request.getAttribute("error")+"</div>"); %>
                <!-- Sign in button -->
                <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

            
               
            </form>
            <!-- Default form login -->


</div>
          
</body>
</html>