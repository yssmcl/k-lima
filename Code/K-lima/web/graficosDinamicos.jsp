<%@page import="unioeste.geral.bo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.manager.AlunoManager"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en" dir="ltr">
<%
	String caminho = request.getContextPath();
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>K-Lima</title>
    
  </head>
<body>
  
  <script src="http://code.highcharts.com/highcharts.js"></script>
  <script src="http://code.highcharts.com/modules/exporting.js"></script>
  <script src="http://code.highcharts.com/modules/drilldown.js"></script>
  <link rel="stylesheet" href="<%=caminho%>/css/foundation.css">    
  <link rel="stylesheet" href="<%=caminho%>/css/app.css">
<!-- MAIN SECTION -->
          
          <div class="row centralizado">
            <div class="medium-12 columns" style="text-align: center;">
                <h1>Alunos Unioeste</h1>
            </div>
          </div>
          
          <hr />
          
          <div class="row">
              <div class="medium-2 columns">  
                  <label>Titulo do Gráfico:</label> 
                  <input id="tituloEscolhido" name="titulo">
              </div>
              <div class="medium-2 columns">  
                  <label>filtro primario:</label> 
                  <select id="filtroExioX">
                        <option name="cursos" value="{Ciência da Computação, Engenharia Mecânica,
                                Engenharia Eletrica, Matemática}"> Cursos </option>
                        <option name="Colunas" value="{'1 ano', '2 ano', '3 ano','4 ano'}"> Ano Letivo</option>
                        <option name="Colunas Laterais" value="{Cursando, Formando, Transferido, 
                                Cancelado, Cancelado por Abandono}"> Situação atual</option>
                    </select>
              </div>
          </div>
            <div class="row">
                
              
              <div class="medium-2 columns">
                  <label>tipo do Grafico:</label>                      
                  <select id="graficoSelecionado">
                        <option name="Colunas" value="column"> Grafico Colunas</option>
                        <option name="Colunas Laterais" value="bar"> Grafico laterais</option>
                        <option name="Pizza" value="pie"> Grafico Pizza</option>
                    </select>
              </div>
              <div class="medium-3 columns">  
                  <label>Curso:</label>
                    <select id="cursoSelecionado">
                        <option value="{Ciência da Computação, Engenharia Mecânica,
                                Engenharia Eletrica, Matemática}">Todos</option>
                        <option value="Ciência da Computação">Ciência da Computação</option>
                        <option value="Engenharia Mecânica">Engenharia Mecânica</option>
                        <option value="Engenharia Eletrica">Engenharia Eletrica</option>
                        <option value="Matematica">Matematica</option>
                    </select>
              </div>
                <div class="medium-2 columns">  
                  <label>Ano Atual:</label>
                    <select id="anoSelecionado">
                        <option value="{'1 ano', '2 ano', '3 ano','4 ano'}">Todos</option>
                        <option value="Primeiro">Primeiro</option>
                        <option value="Segundo">Segundo</option>
                        <option value="Terceiro">Terceiro</option>
                        <option value="Quarto">Quarto</option>
                        <option value="Quarto">Quinto</option>
                    </select>
              </div>
            <div class="medium-3 columns">  
                  <label>Situação Atual:</label>
                    <select id="situacaoSelecionada">
                        <option value="{Cursando, Formando, Transferido, 
                                Cancelado, Cancelado por Abandono}">Todas</option>
                        <option value="Cancelado por Abandono">Cancelado por Abandono</option>
                        <option value="Cursando">Cursando</option>
                        <option value="Cancelado">Cancelado</option>
                        <option value="Formado">Formado</option>
                        <option value="Transferido">Transferido</option>
                    </select>
              </div>
            </div>
            <div class="row">
                <div class="medium-12 columns">
                    <a class="button" onclick=
                        "carregaGrafico(tituloEscolhido, graficoSelecionado, cursoSelecionado, anoSelecionado, situacaoSelecionada);"/>
                    Gerar</a>
                </div>
            </div>    
          
          
    <br/>    <br/>    <br/>    <br/>    <br/>
    
    <div id="grafico" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
    <br><br><br> 
    
    <script>
        function carregaGrafico(tituloSelect, graficoSelecionado, cursoSelecionado, anoSelecionado, situacaoSelecionada){
        var titulo = document.getElementById(tituloSelect.id).value;
        var teste = graficoSelecionado.options[graficoSelecionado.selectedIndex].value;
        var curso = cursoSelecionado.options[cursoSelecionado.selectedIndex].value;
        var anoAtual = anoSelecionado.options[anoSelecionado.selectedIndex].value;
        var situacao = situacaoSelecionada.options[situacaoSelecionada.selectedIndex].value;
         
        Highcharts.chart( 'grafico', {
            chart:{
                type: teste
            },
            title:{
                text: titulo
            },
        xAxis: {
            categories: [ ],
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
        series: [
        <% out.println(
                "{name: "
                    + "'Cancelados', "
                    + "data: [85, 31, 8, 7] "
                + "}, "
                + "{ name:"
                    + " 'Cancelados por Abandono', "
                    + "data: [181, 24, 50, 24]"
                + "}");
    
                %>]
    });
        }
        
        
    </script>
    
    <script src="<%=caminho%>/js/vendor/what-input.js"></script>
    <script src="<%=caminho%>/js/vendor/foundation.js"></script>
    <script src="<%=caminho%>/js/app.js"></script>
    <script type="text/javascript">



    </body>
</html>
