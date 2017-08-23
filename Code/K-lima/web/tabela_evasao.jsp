<%--
    Document   : tabela_evasao
    Created on : 17/07/2017, 09:01:48
    Author     : Leandro Ensina
--%>

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
    <title>Tutoria</title>


    <link rel="stylesheet" type="text/css" href="<%=caminho%>/css/datatables.min.css"/>
    <script type="text/javascript" src="<%=caminho%>/js/datatables.min.js"></script>
    <script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
            $('#example').dataTable();
	} );

        function limparFiltros(){
            document.getElementById("aluno").value = "";
            document.getElementById("curso").value = "";
            document.getElementById("anoEntrada").value = "";
            document.getElementById("anoAtual").value = "";
            document.getElementById("situacaoAtual").value = "";
        }

        function abrirMapa(){
            url = "/tutoria/mapa_alunos.jsp?";
            
            url += "aluno=" + document.getElementById("aluno").value + "&";
            url += "curso=" + document.getElementById("curso").value + "&";
            url += "anoEntrada=" + document.getElementById("anoEntrada").value + "&";
            url += "anoAtual=" + document.getElementById("anoAtual").value + "&";
            url += "situacaoAtual=" + document.getElementById("situacaoAtual").value;
            
            window.location.replace(url);
        }
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
          <%-- <form> --%>
          <%--     <div class="row" style="text-align: right;"> --%>
          <%--         <input type="submit" value="Gerar Relatório" class="success button" style="width: 150px;" /> --%>
          <%--     </div> --%>
          <%-- </form> --%>
          <hr />

          <form action="PesquisarAluno" method="get">
            <div class="row">
              <div class="medium-4 columns">
                  <label>Nome
                      <input id="aluno" name="aluno" type="text" value="<%= request.getParameter("aluno") != null ? request.getParameter("aluno") : "" %>"/>
                  </label>
              </div>
                <div class="medium-4 columns">
                  <label>Curso
                      <input id="curso" name="curso" type="text" value="<%= request.getParameter("curso") != null ? request.getParameter("curso") : "" %>"/>
                  </label>
                </div>
                <div class="medium-4 columns">
                  <label>Turno
                      <input id="turno" name="turno" type="text" value="<%= request.getParameter("turno") != null ? request.getParameter("turno") : "" %>"/>
                  </label>
                </div>
            </div>
            <div class="row">
                <div class="medium-4 columns">
                  <label>Ano Entrada
                      <input id="anoEntrada" name="anoEntrada" type="text" value="<%= request.getParameter("anoEntrada") != null ? request.getParameter("anoEntrada") : "" %>"/>
                  </label>
                </div>
                <div class="medium-4 columns">
                  <label>Ano Atual
                      <input id="anoAtual" name="anoAtual" type="text" value="<%= request.getParameter("anoAtual") != null ? request.getParameter("anoAtual") : "" %>"/>
                  </label>
                </div>
                <div class="medium-4 columns">
                  <label>Situação Atual
                      <input id="situacaoAtual" name="situacaoAtual" type="text" value="<%= request.getParameter("situacaoAtual") != null ? request.getParameter("situacaoAtual") : "" %>"/>
                  </label>
                </div>
            </div>
              <div class="row">
                  <div class="medium-10 columns">
                    <input type="submit" value="Pesquisar" class="button" style="width: 150px;" />
                    <input type="button" value="Limpar Filtros" class="button" style="width: 150px;" onclick="limparFiltros()" />
                  </div>
                  <div class="medium-2 columns">
                    <input type="button" value="Vizualizar Mapa" class="button" style="width: 150px;" onclick="abrirMapa()" />
                  </div>
              </div>
          </form>

          <hr />

          <div class="row">
            <table id="example" class="display">
              <thead>
                  <tr>
                      <th>Nome</th>
                      <th>Curso</th>
                      <th>Turno</th>
                      <th>Ano Entrada</th>
                      <th>Ano Atual</th>
                      <th>Situação Atual</th>
                  </tr>
              </thead>
              <tbody>
                    <%
                    AlunoManager manager = new AlunoManager();

                    List<Aluno> alunos = (ArrayList<Aluno>) request.getAttribute("alunos");

                    if(alunos == null){
                        alunos = manager.recuperarTodosAlunos();
                    }

                    for(Aluno aluno : alunos){%>
                        <tr>
                            <td><%= aluno.getNome() %></td>
                            <td><%= aluno.getCurso().getNome() %></td>
                            <td><%= aluno.getCurso().getTurno() %></td>
                            <td><%= aluno.getAnoEntrada() %></td>                            
                            <td><%= aluno.getAnoAtual()%></td>
                            <td><%= aluno.getSituacaoAtual() %></td>
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
