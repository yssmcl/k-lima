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
    <title>Tutoria</title>
    
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
                <input id=tituloEscolhido name="titulo">
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
                <label>Tipos de Filtros Base:</label>                
                <select id=TiposDeFiltrosX name="TipoFiltroX" 
                        onclick="limpaCombo(FiltroSelecionadoX);limpaCombo(TiposDeFiltrosY);limpaCombo(FiltroSelecionadoY);
                            preencheFiltroX(TiposDeFiltrosX,FiltroSelecionadoX);
                        
                           preencheFiltroSelecionadoY(TiposDeFiltrosX,TiposDeFiltrosY);">
                    <option value="TfiltroPeriodos">Periodos</option>
                    <option value="TfiltroCursos" >Cursos</option>
                    <option value="TfiltroSituacao">Situações</option>
                </select >
              </div>
            <div class="medium-3 columns">  
                <label>Tipos de Filtros para Y:</label>                
                <select id=TiposDeFiltrosY name="TipoFiltroX" 
                        onclick="
                        limpaCombo(FiltroSelecionadoY);
                             preencheFiltroX(TiposDeFiltrosY,FiltroSelecionadoY)
                        limpaCombo(filtrosAuxiliar);
                            preencheFiltroAuxiliar(TiposDeFiltrosY, filtrosAuxiliar, TiposDeFiltrosX);;">
                    
                </select >
              </div>    
        </div>
        
        <div class="row">
        <div class="medium-6 columns">  
                <label>Filtro Base(eixo X):</label>                
                <select id=FiltroSelecionadoX name="FiltroX" >
                
                </select>
              </div>
            <div class="medium-6 columns">  
                <label>Filtro eixo Y:</label>                
                <select id=FiltroSelecionadoY name="FiltroY">
                    
                </select>
              </div>
        </div>
        
        <div class="row">
            
                           
          <div class="medium-3 columns">  
                <label id="filtrosAuxiliarName" >Filtros Auxiliares:</label>
                  <select id="filtrosAuxiliar" name="auxiliaresSelecionado">
                      
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
    
    <div id=grafico style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
    <br><br><br> 
    

    
    <script>
        function limpaCombo(elemento1){
            comboboxNome = document.getElementById(elemento1.id);
            while(comboboxNome.options.length>0){
                comboboxNome.remove(0);
            }
        }      
        
        function preencheFiltroSelecionadoY(elemento1, elemento2){
            var dropSelecionadoX = document.getElementById(elemento1.id);
            var filtroEscolhidoParaX = dropSelecionadoX.options[dropSelecionadoX.selectedIndex].value;
            var optionsDoDrop=document.getElementById(elemento2.id);

            if( filtroEscolhidoParaX.valueOf()==="TfiltroCursos"){
                var opt = document.createElement('option');
                    opt.value= 'TfiltroPeriodos';
                    opt.text = 'Periodos';
                    optionsDoDrop.add(opt);
                var opt = document.createElement('option');
                    opt.value= 'TfiltroSituacao';
                    opt.text = 'Situações';
                    optionsDoDrop.add(opt);
            }
            else if( filtroEscolhidoParaX.valueOf()==="TfiltroPeriodos"){
                var opt = document.createElement('option');
                    opt.value= 'TfiltroSituacao';
                    opt.text = 'Situações';
                    optionsDoDrop.add(opt);
                var opt = document.createElement('option');
                    opt.value= 'TfiltroCursos';
                    opt.text = 'Cursos';
                    optionsDoDrop.add(opt);
            }
            else if( filtroEscolhidoParaX.valueOf()==="TfiltroSituacao"){
                var opt = document.createElement('option');
                    opt.value= 'TfiltroCursos';
                    opt.text = 'Cursos';
                    optionsDoDrop.add(opt);
                var opt = document.createElement('option');
                    opt.value= 'TfiltroPeriodos';
                    opt.text = 'Periodos';
                    optionsDoDrop.add(opt);
                    
            }
        }
        
        function preencheFiltroX(elemento1, elemento2){
            var dropSelecionadoX = document.getElementById(elemento1.id);
            var filtroEscolhidoParaX = dropSelecionadoX.options[dropSelecionadoX.selectedIndex].value;
            var optionsDoDrop=document.getElementById(elemento2.id);
        
            if( filtroEscolhidoParaX.valueOf()==="TfiltroCursos"){   
                var opt = document.createElement('option');              
                opt.value="AllCursos";
                opt.text = "Todos os Cursos";                
                optionsDoDrop.add(opt);
                var opt = document.createElement('option');   
                <% for(int i= 0; i<listaCurso.size(); i++){
                    
                    out.println("opt.value= '"+listaCurso.get(i).getNome()+"';");
                    //out.println("opt.name= \""+listaCurso.get(i).getNome()+"\";"); TODO verificar como colocar name no option
                    out.println("opt.text = '"+listaCurso.get(i).getNome()+"';");
                    out.println("optionsDoDrop.add(opt);");
                    out.println("opt = document.createElement('option');");
                 } %>

            }
            else if( filtroEscolhidoParaX.valueOf()==="TfiltroPeriodos"){   
                var opt = document.createElement('option');
                    opt.value= 'AllAnos';
                    opt.text = 'Todos os Anos';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '1';
                    opt.text = 'Primeiro Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '2';
                    opt.text = 'Segundo Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '3';
                    opt.text = 'Terceiro Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '4';
                    opt.text = 'Quarto Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '5';
                    opt.text = 'Quinto Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    
                    // TODO, quando tiver os anos no BD deixar dinamicos com os Cursos

            } 
            else if( filtroEscolhidoParaX.valueOf()==="TfiltroSituacao"){   
                var opt = document.createElement('option');
                    opt.value= 'AllSituacao';
                    opt.text = 'Todas Situações';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cancelado por Abandono';
                    opt.text = 'Cancelado por Abandono';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cancelado';
                    opt.text = 'Cancelado';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Transferido';
                    opt.text = 'Transferido';
                    optionsDoDrop.add(opt);
                
                opt = document.createElement('option');
                    opt.value= 'Formado';
                    opt.text = 'Formado';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cursando';
                    opt.text = 'Cursando';
                    optionsDoDrop.add(opt);
                
            }
        }
        
        function preencheFiltroY(elemento1, elemento2){
            var dropSelecionadoX = document.getElementById(elemento1.id);
            var filtroEscolhidoParaX = dropSelecionadoX.options[dropSelecionadoX.selectedIndex].value;
            var optionsDoDrop=document.getElementById(elemento2.id);
        
            if( filtroEscolhidoParaX.valueOf()!=="TfiltroCursos"){   
                var opt = document.createElement('option');              
                opt.value="AllCursos";
                opt.text = "Todos os Cursos";                
                optionsDoDrop.add(opt);
                var opt = document.createElement('option');   
                <% for(int i= 0; i<listaCurso.size(); i++){
                    
                    out.println("opt.value= '"+listaCurso.get(i).getNome()+"';");
                    //out.println("opt.name= \""+listaCurso.get(i).getNome()+"\";"); TODO verificar como colocar name no option
                    out.println("opt.text = '"+listaCurso.get(i).getNome()+"';");
                    out.println("optionsDoDrop.add(opt);");
                    out.println("opt = document.createElement('option');");
                 } %>

            }
            if( filtroEscolhidoParaX.valueOf()!=="TfiltroPeriodos"){   
                var opt = document.createElement('option');
                    opt.value= 'AllAnos';
                    opt.text = 'Todos os Anos';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '1';
                    opt.text = 'Primeiro Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '2';
                    opt.text = 'Segundo Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '3';
                    opt.text = 'Terceiro Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '4';
                    opt.text = 'Quarto Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '5';
                    opt.text = 'Quinto Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    
                    // TODO, quando tiver os anos no BD deixar dinamicos com os Cursos

            } 
            if( filtroEscolhidoParaX.valueOf()!=="TfiltroSituacao"){   
                var opt = document.createElement('option');
                    opt.value= 'AllSituacao';
                    opt.text = 'Todas Situações';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cancelado por Abandono';
                    opt.text = 'Cancelado por Abandono';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cancelado';
                    opt.text = 'Cancelado';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Transferido';
                    opt.text = 'Transferido';
                    optionsDoDrop.add(opt);
                
                opt = document.createElement('option');
                    opt.value= 'Formado';
                    opt.text = 'Formado';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cursando';
                    opt.text = 'Cursando';
                    optionsDoDrop.add(opt);
                
            }
 
            
            
        }
        
        function preencheFiltroAuxiliar(elemento1, elemento2, elemento3){
        var dropSelecionadoX = document.getElementById(elemento3.id);
        var filtroEscolhidoParaX = dropSelecionadoX.options[dropSelecionadoX.selectedIndex].value;
        var dropSelecionadoY = document.getElementById(elemento1.id);
        var filtroEscolhidoParaY = dropSelecionadoY.options[dropSelecionadoY.selectedIndex].value;
        var optionsDoDrop=document.getElementById(elemento2.id);
        
        
            if( filtroEscolhidoParaY.valueOf()!=="TfiltroCursos" && filtroEscolhidoParaX.valueOf()!=="TfiltroCursos"){
                var opt = document.createElement('option');              
                opt.value="AllCursos";
                opt.text = "Todos os Cursos";                
                optionsDoDrop.add(opt);
                var opt = document.createElement('option');   
                <% for(int i= 0; i<listaCurso.size(); i++){
                    
                    out.println("opt.value= '"+listaCurso.get(i).getNome()+"';");
                    //out.println("opt.name= \""+listaCurso.get(i).getNome()+"\";"); TODO verificar como colocar name no option
                    out.println("opt.text = '"+listaCurso.get(i).getNome()+"';");
                    out.println("optionsDoDrop.add(opt);");
                    out.println("opt = document.createElement('option');");
                 } %>

            }
            if( filtroEscolhidoParaY.valueOf()!=="TfiltroPeriodos" && filtroEscolhidoParaX.valueOf()!=="TfiltroPeriodos"){ 
                var opt = document.createElement('option');
                    opt.value= 'AllAnos';
                    opt.text = 'Todos os Anos';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '1';
                    opt.text = 'Primeiro Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '2';
                    opt.text = 'Segundo Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '3';
                    opt.text = 'Terceiro Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '4';
                    opt.text = 'Quarto Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= '5';
                    opt.text = 'Quinto Ano';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    
                    // TODO, quando tiver os anos no BD deixar dinamicos com os Cursos

            } 
            if( filtroEscolhidoParaY.valueOf()!=="TfiltroSituacao"&& filtroEscolhidoParaX.valueOf()!=="TfiltroSituacao"){ 
                var opt = document.createElement('option');
                    opt.value= 'AllSituacao';
                    opt.text = 'Todas Situações';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cancelado por Abandono';
                    opt.text = 'Cancelado por Abandono';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cancelado';
                    opt.text = 'Cancelado';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Transferido';
                    opt.text = 'Transferido';
                    optionsDoDrop.add(opt);
                
                opt = document.createElement('option');
                    opt.value= 'Formado';
                    opt.text = 'Formado';
                    optionsDoDrop.add(opt);
                opt = document.createElement('option');
                    opt.value= 'Cursando';
                    opt.text = 'Cursando';
                    optionsDoDrop.add(opt);
                
            }
 
            
            
        }
    </script>
    
    <script src="<%=caminho%>/js/vendor/jquery.js"></script> 
    <script src="<%=caminho%>/js/vendor/what-input.js"></script>
    <script src="<%=caminho%>/js/vendor/foundation.js"></script>
    <script src="<%=caminho%>/js/app.js"></script>
    <script type="text/javascript">

    </body>
</html>
