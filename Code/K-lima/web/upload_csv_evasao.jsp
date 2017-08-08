<%--
Document   : upload_csv_evasao
Created on : 17/07/2017, 08:12:07
Author     : Leandro Encina
--%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.bo.Aluno"%>
<%@page import="unioeste.geral.manager.AlunoManager"%>
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
		<title>Tutoria</title>

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

					<!-- MAIN SECTION -->
					<div class="row">
						<br />
						<h1>Importar dados de alunos</h1>

							<div class="medium-12 columns">
								<form method="post" action="UploadServlet" enctype="multipart/form-data">
									Selecione o arquivo CSV para importação:
									<input type="file" name="dataFile" id="fileChooser"/><br/><br/>
									<input type="submit" class="button" value="Importar" style="width: 150px;"/>
									<br>
									<a data-open="excluir" class="alert button" style="width: 150px;">Limpar banco de dados</a>
								</form>
								<div class="reveal" id="excluir" data-reveal>
									<button class="close-button" data-close aria-label="Close reveal" type="button">
										<span aria-hidden="true">&times;</span>
									</button>

									<div class="center">
										Deseja realmente limpar o banco de dados?<br><br>
										<form action="LimparBanco" method="post">
											<input class="button" type="submit" style="width: 100px;" value="Sim"/>
											<a href="#" class="secondary button" style="width: 100px;" data-close>Não</a>
										</form>
									</div>
								</div>

								<br />
								<span><b>Observação:</b> a importação do arquivo pode levar alguns segundos...</span>
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
