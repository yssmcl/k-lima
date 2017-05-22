var data;
var chart;


google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawSheetName);


function drawSheetName(String) {
    if(String != null)
    {
        var queryString = encodeURIComponent(String)
        var query = new google.visualization.Query(
          'https://docs.google.com/spreadsheets/d/19YIcyeRxDG0MEhjcW493b07zdmWWccb1cXIWrpVGkaA/gviz/tq?sheet=Sheet1&headers=1&tq=' + queryString);
        query.send(handleSampleDataQueryResponse);
    }
}

function handleSampleDataQueryResponse(response) {
    //mensagem de erro caso ocorra algum problema
    if (response.isError()) {
        console.log('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
        return;
    }

    
    //resgatar os atributos enviados pela usuário
    var tipo_grafico = document.getElementById("tip_graf").value;
    var materia = document.getElementById("materia").value;
    var curso = document.getElementById("curso").value;
    if(curso.value == "null") curso.value = "Todas";
    //*/
    var datat = response.getDataTable();
    
    
    //selecionar o tipo de gráfico que será usado
    if(tipo_grafico == "Column")
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    else if(tipo_grafico == "Pie")
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    else
        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

    var view = new google.visualization.DataView(datat);
     
    //colocar o valor da barra acima dela
    view.setColumns([0, 1, 2, 3 , 4]);        

    //editar as opções da criação do gráfico
     var options = {
        title: curso + " - " + materia,
        width: 1000,
        height: 800,
        bar: {groupWidth: "50%"},
        legend: { position: "right" },
        is3D: true,
    };

    //Criação do Link para o download do Gráfico
    var my_div = document.getElementById('download');
    google.visualization.events.addListener(chart, 'ready', function () {
        my_div.innerHTML = '<a href="' + chart.getImageURI() + '" download="chart.png"> <img src="image/download_icon.png" height="20" width="20"> </a>';
    });
    //*/
    //desenhar o gráfico
    chart.draw(view,options);

}
        
function BuildSQL(){
    var materia = document.getElementById("materia").value;
    var curso = document.getElementById("curso").value;
    var ano_let = document.getElementById("ano_let").value;

    var grafico = "SELECT " + "M, O, N, Q, R ";

        grafico = grafico + "WHERE "

    if (curso != "null" && materia != "null"){
        var grafico = grafico + "G = " + "'" + curso + "' AND ";
    }else
    if(curso != "null"){
        var grafico = grafico + "G = " + "'" + curso + "'";
    }
    
    if (materia != "null" && ano_let != "null"){
        var grafico = grafico + "M = " + "'" + materia + "' AND ";
    }else 
    if (materia != "null"){
        var grafico = grafico + "M = " + "'" + materia + "'";
    }

    if (ano_let != "null"){
        var grafico = grafico + "J = " + "'" + ano_let + "' ";
    }
    
   //getDataTable(grafico);
    drawSheetName(grafico);

    if(document.getElementById("chart_div").style.display=="none"){
        document.getElementById("chart_div").style.display="block";
        document.getElementById("png").style.display="block";
     }

}

function handleGetDataTable(response){
//mensagem de erro caso ocorra algum problema
    if (response.isError()) {
        console.log('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
        return;
    }    
    data = response.getDataTable();
    
}

function getDataTable(String){
     if(String != null)
    {
        var queryString = encodeURIComponent(String)
        var query = new google.visualization.Query(
          'https://docs.google.com/spreadsheets/d/19YIcyeRxDG0MEhjcW493b07zdmWWccb1cXIWrpVGkaA/gviz/tq?sheet=Sheet1&headers=1&tq=' + queryString);
        query.send(handleGetDataTable);
        
    }   
}

function optionsMenu(){

var curso = document.getElementById("curso").value;
var materia = "SELECT " + "M, G " + "WHERE"
    if (curso != null )
        var materia = materia + " G = " + "'" + curso + "'";
getDataTable(materia);

var a = function() {
    var defer = $.Deferred();

    setTimeout(function() {
        defer.resolve(); // When this fires, the code in a().then(/..../); is executed.
        labelOptionsMenu();
    }, 200);

    return defer;

};
a();
}

function labelOptionsMenu(){
var idmateriaHTML = $("#materia");
    console.log(data);
	 for(var i = 0; i < data.qg.length; i++){	 
    var labelMateria = data.qg[i].c[0].v;
        idmateriaHTML.append(
            "<option value='"+labelMateria+"'>"+labelMateria+"</option>"
            );       
    }

}

function deleteAllOptions(){
    var idmateriaHTML = $("#materia");
    var i;
    idmateriaHTML.children().remove();
    idmateriaHTML.append("<option value='null'>Todas</option>")
	
}

