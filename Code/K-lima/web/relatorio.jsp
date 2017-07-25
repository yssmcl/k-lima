<%@page import="java.util.List"%>
<%@page import="unioeste.geral.bo.Curso"%>
<%@page import="unioeste.geral.manager.CursoManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en" dir="ltr">
	<%String caminho = request.getContextPath();%>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>SAG - Sistema de Apoio ao Gestor</title>

		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/zf-5.5.2/jqc-1.11.3,dt-1.10.8/datatables.min.css"/>
		<script type="text/javascript" src="https://cdn.datatables.net/r/zf-5.5.2/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
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

				<div class="row">
					<br />
					<h1>Relatório de Evasão</h1>
					<form action="RelatorioServlet" method="get">
						<div class="medium-3 columns">
						  Selecione o curso:
						  <select id="idCurso" name="idCurso">
							  <%
							  List<Curso> cursos = new CursoManager().recuperarCursosPorAtributo("nome", "%");
							  for (Curso curso : cursos) {%>
								  <option value="<%= curso.getId() %>">
									  <%= curso.getNome() %>
								  </option>
							  <%}%>
							  <option value="Todos">Todos</option>
						  </select>
						  <br />
						  <br />
						  <input type="submit" value="Gerar relatório de evasão" class="button" />
						</div>
					</form>
				</div>

			</div>
		</div>
		<script src="<%=caminho%>/js/vendor/what-input.js"></script>
		<script src="<%=caminho%>/js/vendor/foundation.js"></script>
		<script src="<%=caminho%>/js/app.js"></script>
	</body>

</html>
