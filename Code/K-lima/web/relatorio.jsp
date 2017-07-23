<%--
    Document   : relatorio
    Created on : 23/07/2017, 19:46:37
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
	</head>

	<body>
		<form action="RelatorioServlet" method="post">
			<div class="row">
				<input type="submit" value="Gerar relatório de evasão" class="button" />
			</div>

			<!--TODO: adicionar dropbox pra selecionar o curso-->
			<!--TODO: fazer o esquema de caminho absoluto pro logo da Unioeste no relatório-->
		</form>
	</body>

</html>
