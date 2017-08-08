<%-- 
    Document   : tabela_aprovacao
    Created on : 08/08/2017, 09:10:43
    Author     : Leandro Ensina
--%>
<%@page import="com.google.common.collect.HashMultimap"%>
<%@page import="unioeste.geral.bo.Disciplina"%>
<%@page import="unioeste.geral.bo.Formulario"%>
<%@page import="unioeste.geral.manager.DisciplinaManager"%>
<%@page import="unioeste.geral.manager.FormularioManager"%>
<%@page import="com.google.common.collect.Multimap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.bo.Disciplina"%>
<%@page import="unioeste.geral.manager.AlunoManager"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html class="no-js" lang="en" dir="ltr">
<%
	String caminho = request.getContextPath();
%>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tutoria</title>


    <link rel="stylesheet" type="text/css" href="<%=caminho%>/css/datatables.min.css"/>
    <script type="text/javascript" src="<%=caminho%>/js/datatables.min.js"></script>
    <script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
            $('#example').dataTable();
	} );
    </script>

    <link rel="stylesheet" href="<%=caminho%>/css/foundation.css">
    <link rel="stylesheet" href="<%=caminho%>/css/app.css">
  </head>
  <body>

    <div class="off-canvas-wrapper">
      <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper> <!-- Essa div e a de cima servem para fazer a parte do menu lateral -->

        <jsp:include page="#{caminho}/includes/menu.jsp"/>

          <!-- MAIN SECTION -->

          <div class="row centralizado">
            <div class="medium-12 columns" style="text-align: center;">
                <h1>Histórico de Aprovação - Engenharia Mecânica</h1>
            </div>
          </div>
          
          <hr />
          
          <div class="row">
            <h1>1º ano</h1>
            <table id="example" class="display">
              <thead>
                  <tr>
                      <th>Disciplinas</th>
                      <th>2008</th>
                      <th>2009</th>
                      <th>2010</th>
                      <th>2011</th>
                      <th>2012</th>
                      <th>2013</th>
                  </tr>
              </thead>
              <tbody>
                  <%
                  int serie = 1;
                  DisciplinaManager manager = new DisciplinaManager();
                  FormularioManager managerForm = new FormularioManager();
                  List<Disciplina> disciplinas = new ArrayList<>();
                  List<Formulario> formularios = new ArrayList<>();
                  HashMultimap<String, Object> condicaoSerie;
                  HashMultimap<String, Object> condicaoNota;
                  
                  condicaoSerie = HashMultimap.create();
                  condicaoSerie.put("serie", serie);
                  
                  disciplinas = manager.recuperarDisciplinas(condicaoSerie, null);
                  
                  for(Disciplina disciplina : disciplinas){%>
                        <tr>
                            <td><%= disciplina.getNome() %></td>
                            <%
                            int ano = 2008;
                            while(ano < 2014){
                                condicaoNota = HashMultimap.create();
                                condicaoNota.put("ano", ano);
                                Long aux = disciplina.getId();
                                condicaoNota.put("disciplina_id", aux.intValue());
                                
                                formularios = managerForm.recuperarFormularios(condicaoNota, null);
                                
                                int media;
                                if(formularios != null){
                                    media = (100*formularios.get(0).getNumeroAprovacoes())/(formularios.get(0).getNumeroAprovacoes() + formularios.get(0).getNumeroAprovacoes());
                            %>
                                <td><%= media %></td>
                            <%
                                }
                                ano++;
                            }
                            %>
                        </tr>
                  <%}%>
                </tbody>
            </table>
          </div>          
        </div>
      </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>

    <!--
    <script src="<%=caminho%>/js/vendor/jquery.js"></script>
    -->
    <script src="<%=caminho%>/js/vendor/what-input.js"></script>
    <script src="<%=caminho%>/js/vendor/foundation.js"></script>
    <script src="<%=caminho%>/js/app.js"></script>
    <script type="text/javascript">
	// For demo to fit into DataTables site builder...
	$('#example')
		.removeClass( 'display' )
		.addClass('tdisplay');
    </script>
  </body>
</html>
