var data;
var chart;

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawSheetName);


function drawSheetName(String) {
    if(String != null)
    {
        var queryString = encodeURIComponent(String)
        var query = new google.visualization.Query(
          'https://docs.google.com/spreadsheets/d/1_X3izuFEPmm5-O8h2t5MeT-TJHCvgeUi5ucxjnldWyE/gviz/tq?sheet=Sheet1&headers=1&tq=' + queryString);
        query.send(handleSampleDataQueryResponse);
    }
}

function handleSampleDataQueryResponse(response) {
    //mensagem de erro caso ocorra algum problema
    if (response.isError()) {
        alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
        return;
    }

    //resgatar os atributos enviados pela usuário
    var tipo_grafico = document.getElementById("tip_graf").value;
    var filtPri = document.getElementById("fil_pri").name;
    var chart_title = document.getElementById("chart_title").value;
    

    var data = response.getDataTable();

    //selecionar o tipo de gráfico que será usado
    if(tipo_grafico == "Column")
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    else if(tipo_grafico == "Pie")
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    else
        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

    var view = new google.visualization.DataView(data);

    //colocar o valor da barra acima dela
    view.setColumns([0, 1,
     { calc: "stringify",
       sourceColumn: 1,
       type: "string",
       role: "annotation" }]);        

    //editar as opções da criação do gráfico
     var options = {
        title: chart_title,
        subtitle: 'oi',
        width: 1300,
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

    //desenhar o gráfico
    chart.draw(view,options);

}
        
function BuildSQL(){
    var filtPri = document.getElementById("fil_pri").value;
    var curso = document.getElementById("curso").value;
    var sit_atual = document.getElementById("sit_atual").value;;
    var ano_let = document.getElementById("ano_let").value;;
    var ano_inic = document.getElementById("ano_inic").value;;
    var ano_fin = document.getElementById("ano_fin").value;;

    var grafico = "SELECT " + filtPri + ", COUNT(A) ";

        grafico = grafico + "WHERE "

    if (curso != "null")
        var grafico = grafico + "B = " + "'" + curso + "' AND ";
    
    if (sit_atual != "null")
        var grafico = grafico + "C = " + "'" + sit_atual + "' AND ";

    if (ano_let != "null")
        var grafico = grafico + "D = " + "" + ano_let + " AND ";

    if (ano_inic != "null")
        var grafico = grafico + "E >= " + "" + ano_inic + " AND ";

    if (ano_fin != "null")
        var grafico = grafico + "E <= " + "" + ano_fin + " AND ";

        grafico = grafico + "1 = 1 "

    grafico = grafico + "GROUP BY " + filtPri + " LABEL COUNT(A) 'Quantidade de Alunos'"

    drawSheetName(grafico);

    if(document.getElementById("chart_div").style.display=="none"){
        document.getElementById("chart_div").style.display="block";
        document.getElementById("png").style.display="block";
     }

}