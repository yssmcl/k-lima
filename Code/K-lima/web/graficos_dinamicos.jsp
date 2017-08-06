<!DOCTYPE html>

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

<html class="no-js" lang="en" dir="ltr" onload="carregaGrafico(tituloEscolhido, graficoSelecionado, cursoSelecionado, anoSelecionado, situacaoSelecionada);">
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
         
            <div class="medium-2 columns">
                <label>tipo do Grafico:</label>                      
                <select id="graficoSelecionado">
                      <option name="Colunas" value="column"> Grafico Colunas</option>
                      <option name="Colunas Laterais" value="bar"> Grafico laterais</option>
                      <option name="Pizza" value="pie"> Grafico Pizza</option>
                  </select>
            </div>
            
            
            <div class="medium-3 columns">  
                <label>Filtro Base(eixo X):</label>                
                <select id="FiltrosSelecionado" name="FiltroX">
                    <option value="AllAno">Todos os periodos</option>
                    <option value="AllCurso">Todos os Cursos</option>
                    <option value="AllSituacao">Todas as Situações</option>
                    <option value="AllEvacao">Todos os evadidos</option>
                    <%
                        for(int i= 0; i<listaCurso.size(); i++){%>
                            <option value="<%out.print(listaCurso.get(i).getNome());%>">
                            <%out.print(listaCurso.get(i).getNome());%></option>                                
                    <% } %>
                </select>
              </div>
            <div class="medium-3 columns">  
                <label>Filtro eixo Y:</label>                
                <select id="FiltrosSelecionadoY" name="FiltroY">
                    <option value="AllAno">Todos os periodos</option>
                    <option value="AllSituacao">Todas as Situações</option>
                    <option value="AllEvacao">Todos os evadidos</option>
                    <%
                        for(int i= 0; i<listaCurso.size(); i++){%>
                            <option value="<%out.print(listaCurso.get(i).getNome());%>">
                            <%out.print(listaCurso.get(i).getNome());%></option>                                
                    <% } %>
                </select>
              </div>
                
                
                
        </div>
        <div class="row">
            
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
                            "carregaGrafico();" />         
                </div>
            </div>
    </form>

          
          
    <br/>    <br/>    <br/>    <br/>    <br/>
    
    <div id="grafico" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
    <br><br><br> 
    

    
    <script>
        function carregaGrafico(){
        <%  //Long alunosCancelados = ( Long) request.getAttribute("alunosCancelados");
            //Long alunosCanceladosAbandono = ( Long) request.getAttribute("alunosCanceladosAbandono");
            List<String> filtrosEixoX = (List<String>)request.getAttribute("filtrosEixoX");
            String filtrosEixoy = (String) request.getAttribute("filtrosEixoy");
            String baseEixoX = (String) request.getAttribute("baseX");
            List<Long> constantesX = (List<Long>) request.getAttribute("constantesX");
            String criarGraficoDinamico = (String) request.getAttribute("criarGraficoDinamico");
            out.print(criarGraficoDinamico);
        %>
            
        }
    </script>
    
    <script src="<%=caminho%>/js/vendor/jquery.js"></script> 
    <script src="<%=caminho%>/js/vendor/what-input.js"></script>
    <script src="<%=caminho%>/js/vendor/foundation.js"></script>
    <script src="<%=caminho%>/js/app.js"></script>
    <script type="text/javascript">

    </body>
</html>
