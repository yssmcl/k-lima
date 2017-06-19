<%-- 
    Document   : index
    Created on : 05/06/2017, 14:26:56
    Author     : Paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/drilldown.js"></script>
  
 <div id="colunasLaterais" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>  
<br><br><br>

<div id="AlunosDesistentesPorCurso" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<br><br><br>     
  <div id="AlunosPorAnoDoCursoDe" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<br><br><br>
        
  <div id="pizza" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
<br><br><br> 
  
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>  
        
     <script>
        
        // Create the chart

Highcharts.chart('colunasLaterais', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Alunos Desistentes por Curso'
        },

        xAxis: {
            categories: ['Ciência da Computação','Engenharia Elétrica','Engenharia Mecânica','Matemática'],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Quantidade de alunos'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Desistentes',
            data: [495, 228, 143, 440]

        }]
    }); // retangular
        
Highcharts.chart('AlunosDesistentesPorCurso', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Alunos Cursando: Ciencia da Computação'+' '
        },
        xAxis: {
            categories: ['1 ano', '2 ano', '3 ano', '4 ano'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Alunos',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Quantidade de alunos',
            data: [55 , 32, 10, 21]
        }]
    });
        
Highcharts.chart('AlunosPorAnoDoCursoDe', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Alunos por ano do curso de '+'CC'
        },

        xAxis: {
            categories: [ '1 ano', '2 ano', '3 ano','4 ano'],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Quantidade de alunos'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Cancelados',
            data: [85, 31, 8, 7]

        }, {
            name: 'Cancelados por Abandono',
            data: [181, 24, 50, 24]
        }]
    }); // retangular
        
Highcharts.chart('pizza', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'situação do ingresso do curso de:'+'Ciência da Computação '
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Alunos',
            colorByPoint: true,
            data: [
                   {name: 'Desistentes', y: 495},
                   {name: 'Formados', y: 222},
                   {name: 'Transferidos', y: 51},
                   {name: 'Cursando', y: 118}            
            ]
        }]
        
    });  // pizza
 
        
    </script>    
    </body>
</html>
