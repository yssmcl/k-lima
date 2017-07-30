<%-- 
    Document   : totais_evasao
    Created on : 30/07/2017, 13:52:36
    Author     : Leandro Ensina
--%>


<%@page import="com.google.common.collect.Multimap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.bo.Aluno"%>
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
    <title>SAG - Sistema de Apoio ao Gestor</title>


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
                <h1>Alunos</h1>
            </div>
          </div>
          
          <hr />

          <div class="row">
            <table id="example" class="display">
              <thead>
                  <tr>
                      <th>Ano</th>
                      <th>Cancelado</th>
                      <th>Cancelado por Abandono</th>
                      <th>Transferido</th>
                      <th>Total</th>
                  </tr>
              </thead>
              <tbody>
                    <%
                    AlunoManager manager = new AlunoManager();
                    Multimap<String, Object> condicao1 = new Multimap<>();
                    Multimap<String, Object> condicao2;
                    Multimap<String, Object> condicao3;
                    int ano = 2003;

                    List<Aluno> alunos = (ArrayList<Aluno>) request.getAttribute("alunos");

                    while(ano < 2018){
                        condicao1.put("anoSaida", ano);
                        condicao2
                    %>
                        <tr>
                            <td><%= ano %></td>
                            <td><%= manager.recuperarQtdAlunosPorAtributos(condicao, null) %></td>
                            <td><%= aluno.getCurso().getTurno() %></td>
                            <td><%= aluno.getAnoEntrada() %></td>
                            <td><%= aluno.getAnoAtual()%></td>
                        </tr>
                    <%
                        ano++;
                    }
                    %>
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
