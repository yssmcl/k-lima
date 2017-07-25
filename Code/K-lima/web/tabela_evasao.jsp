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
    <title>SAG - Sistema de Apoio ao Gestor</title>


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

        function limparBanco(){
            decisao = confirm("Ao apagar o banco, todos os dados serão perdidos. Deseja continuar?");
            if(decisao){
            	location.href = "index.jsp";
            }
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

          <form action="PesquisarAluno" method="post">
            <div class="row">
              <div class="medium-4 columns">
                  <label>Nome
                      <input id="aluno" name="aluno" type="text" />
                  </label>
              </div>
                <div class="medium-4 columns">
                  <label>Curso
                      <input id="curso" name="curso" type="text" />
                  </label>
                </div>
                <div class="medium-4 columns">
                  <label>Turno
                      <input id="turno" name="turno" type="text" />
                  </label>
                </div>
            </div>
            <div class="row">
                <div class="medium-4 columns">
                  <label>Ano Entrada
                      <input id="anoEntrada" name="anoEntrada" type="text" />
                  </label>
                </div>
                <div class="medium-4 columns">
                  <label>Ano Atual
                      <input id="anoAtual" name="anoAtual" type="text" />
                  </label>
                </div>
                <div class="medium-4 columns">
                  <label>Situação Atual
                      <input id="situacaoAtual" name="situacaoAtual" type="text" />
                  </label>
                </div>
            </div>
              <div class="row">
                  <div class="medium-12 columns">
                    <input type="submit" value="Pesquisar" class="button" style="width: 150px;" />
                    <input type="button" value="Limpar Filtros" class="button" style="width: 150px;" onclick="limparFiltros()" />
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
          <form action="LimparBanco" method="post">
              <div class="row">
                  <input type="submit" value="Limpar Banco" class="alert button" style="width: 150px;" />
              </div>
          </form>
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
