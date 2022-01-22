$(document).ready(function () {
    $.ajax({
        url: "SalleController",
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
        var code = $("#code").val();
        var libelle = $("#libelle").val();
        
        
        $.ajax({
            url: "SalleController",
            data: {code: code, libelle: libelle},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
             remplir(data);
                $("#code").val("");
                $("#libelle").val("");
                
               
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
        url: "SalleController",
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
        var code = $(this).find('td:eq(1)').text();
        var libelle = $(this).find('td:eq(2)').text();
        
        $("#code").val(code);
        $("#libelle").val(libelle);
        
        
});
    
      $("#content").on("click", ".update", function () {
        var id = $(this).closest('tr').find('td').eq(0).text();
         var code = $("#code").val();
               var libelle = $("#libelle").val();
        
        
        
        $.ajax({
            url: "SalleController",
            data: {op:"update",id:id,code: code, libelle: libelle},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                alert("has been modified");
             remplir(data);
                $("#code").val("");
                $("#libelle").val("");
                
               
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
            ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].code + "</td><td>" + data[i].libelle+ "</td><td><button class='delete' val='"+ data[i].id +"'>Supprimer</button></td><td><button class='update' val='"+ data[i].id +"'>Modifier</button></td></tr>";
        }
        $("#content").html(ligne);
    }
});

