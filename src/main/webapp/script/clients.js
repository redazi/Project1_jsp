$(document).ready(function () {
    $.ajax({
        url: "ClientController",
        data: {op: "load"},
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
            remplir(data);
           
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus);
        }
    });
    $("#add").click(function () {
        var login = $("#login").val();
        var passe = $("#passe").val();
        
        
        $.ajax({
            url: "ClientController",
            data: {login: login, passe: passe},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
             remplir(data);
                $("#login").val("");
                $("#passe").val("");
                
               
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });

    });
    $("#content").on("click", ".delete", function () {
        //alert($(this).attr('val'));
        var id = $(this).closest('tr').find('td').eq(0).text();
        $.ajax({
        url: "ClientController",
        data: {op: "delete", id:id},
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
            remplir(data);
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus);
        }
    });

    });
     $("#table").on("click", "tbody tr", function() {
        //var login = $(this).find('td:eq(1)').text();
       // var passe = $(this).find('td:eq(2)').text();
        
        $("#login").val($(this).find('td:eq(1)').text());
        $("#passe").val($(this).find('td:eq(2)').text());
        
        
});
    
      $("#content").on("click", ".update", function () {
        var id = $(this).closest('tr').find('td').eq(0).text();
         var login = $("#login").val();
               var passe = $("#passe").val();
        
        
        
        $.ajax({
            url: "ClientController",
            data: {op:"update",id:id,login: login, passe: passe},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                alert("has been modified");
             remplir(data);
                $("#login").val("");
                $("#passe").val("");
                
               
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });

    });
    function remplir(data) {
        var ligne = "";
        for (var i = 0; i < data.length; i++) {
            //alert(data[i].dateAchat.ToString("dd/MM/yyyy"));
            ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].login + "</td><td>" + data[i].password+ "</td><td><button class='delete' val='"+ data[i].id +"'>Supprimer</button></td><td><button class='update' val='"+ data[i].id +"'>Modifier</button></td></tr>";
        }
        $("#content").html(ligne);
    }
});

