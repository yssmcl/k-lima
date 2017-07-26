<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="unioeste.geral.bo.Curso"%>
<%@page import="unioeste.geral.bo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.manager.AlunoManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.common.collect.Multimap"%>
<%@page import="unioeste.geral.servlet.GraficosServlet"%>
<%@page import="unioeste.geral.manager.CursoManager"%>
<%@page import="com.google.common.collect.HashMultimap"%>

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
  <%
        CursoManager curso= new CursoManager();
        List<Curso> listaCurso = curso.recuperarCursosPorAtributo("nome","%");
        
        
  %>
  <script src="http://code.highcharts.com/highcharts.js"></script>
  <script src="http://code.highcharts.com/modules/exporting.js"></script>
  <script src="http://code.highcharts.com/modules/drilldown.js"></script>
  <link rel="stylesheet" href="<%=caminho%>/css/foundation.css">    
  <link rel="stylesheet" href="<%=caminho%>/css/app.css">
  <div class="off-canvas-wrapper">
       <!-- Essa div e a de cima servem para fazer a parte do menu lateral -->
       
          <jsp:include page="#{caminho}/includes/menu.jsp"/>
<!-- MAIN SECTION -->
 
          
      </div>
          <div class="row centralizado">
            <div class="medium-12 columns" style="text-align: center;">
                <h1>Alunos Unioeste</h1>
            </div>
          </div>
          
          <hr />

    <form action="GraficosServlet" method="post">
        <div class="row"> 
            <div class="medium-3 columns">  
                        <label>Titulo do Gráfico:</label> 
                        <input id="tituloEscolhido" name="titulo">
                    </div>             

            <div class="medium-3 columns">  
                <label>Curso:</label>                
                <select id="cursoSelecionadoEixoX">
                    <option value="All">Todos</option>
                    <option value="All">Todos</option>
                    <%
                        for(int i= 0; i<listaCurso.size(); i++){%>
                            <option value="<%out.print(listaCurso.get(i).getNome());%>">
                                <%out.print(listaCurso.get(i).getNome());%></option>                                
                       <% } %>
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
                  <select id="cursoSelecionado" name="cursoSelecionado">                     
                      <option id="AllCursos" value="All">Todos</option>
                    <%
                        for(int i= 0; i<listaCurso.size(); i++){%>
                            <option  value="<%out.print(listaCurso.get(i).getNome());%>">
                                <%out.print(listaCurso.get(i).getNome());%></option>                                
                       <% } %>
                  </select>
            </div>
              <div class="medium-2 columns">  
                <label>Ano Atual:</label>
                  <select name="anoSelecionado" id="anoSelecionado">
                      <option value="All">Todos</option>
                      <option value="1">Primeiro</option>
                      <option value="2">Segundo</option>
                      <option value="3">Terceiro</option>
                      <option value="4">Quarto</option>
                      <option value="5">Quinto</option>
                  </select>
            </div>
          <div class="medium-3 columns">  
                <label>Situação Atual:</label>
                  <select name="situacaoSelecionada" id="situacaoSelecionada">
                      <option value="All">Todas</option>
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
                  <input type="submit" value="Gerar" class="button" style="width: 150px;" onclick=
                            "carregaGrafico(tituloEscolhido, graficoSelecionado, cursoSelecionado, anoSelecionado, situacaoSelecionada);" />         
                </div>
            </div>
    </form>

          
          
    <br/>    <br/>    <br/>    <br/>    <br/>
    
    <div id="grafico" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
    <br><br><br> 
    
    <script>
        function carregaGrafico(tituloSelect, graficoSelecionado,){
        <%  Long alunosCancelados = ( Long) request.getAttribute("alunosCancelados");
            //Long alunosCanceladosAbandono = ( Long) request.getAttribute("alunosCanceladosAbandono");
            
        %>
        
        var titulo = document.getElementById(tituloSelect.id).value;
        var teste = graficoSelecionado.options[graficoSelecionado.selectedIndex].value;
        var curso = cursoSelecionado.options[cursoSelecionado.selectedIndex].value;
       
       
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
                text: 'quantidade de alunos do curso de: '+curso
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
        <% 
            
                out.println(
                    "{name: "
                        + "'Alusnos evadidos', "
                        + "data: ["+alunosCancelados+", "+alunosCancelados+", "+alunosCancelados+", "+alunosCancelados+"] "
                    + "}");

          
            
                %>]
    });
        }
    </script>
    
    <script src="<%=caminho%>/js/vendor/jquery.js"></script> 
    <script src="<%=caminho%>/js/vendor/what-input.js"></script>
    <script src="<%=caminho%>/js/vendor/foundation.js"></script>
    <script src="<%=caminho%>/js/app.js"></script>
    <script type="text/javascript">



    </body>
</html>
