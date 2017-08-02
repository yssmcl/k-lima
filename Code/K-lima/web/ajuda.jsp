<%-- 
    Document   : ajuda
    Created on : 23/07/2017, 17:55:22
    Author     : Leandro Ensina
--%>

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
          <br />
          <h1 style="text-align: center;">Importação dos dados de alunos para a aplicação</h1>
          <br />
          <div class="row">
              <span><p style="color: red; font-weight: bold;">Observação: </p>Antes de importar um arquivo para o sistema, 
                  lembre-se de apagar o banco com o botão "Limpar Banco" que está presente na própria "Atualizar Dados".
                  Isso se deve ao fato de que poderá ocorrer risco de duplicação de dados de alunos, 
                  sendo então responsabilidade do usuário.</span>
          </div>
          <hr />
          <div class="row">
              <p>Para que a importação dos dados de alunos para a aplicação seja feito de forma correta, siga o modelo da 
                  template disposível <a href="<%=caminho%>/img/ajuda/template_SAG.xlsx">aqui</a>. 
                  A primeira linha do arquivo (Figura 1) indica quais informações cada coluna deve conter, 
                  e esta <b>não</b> deve ser apagada. Cada linha indica as informações de um aluno e, 
                  em caso de necessidade, <b>não</b> utilize ponto e vírgula (<b>;</b>) para separar partes de textos, 
                  dê preferência a vírgulas comuns, pois o algoritmo de importação utiliza de pontos e vírgulas 
                  para a importação do arquivo.</p>
          </div>
          <br />
          <div class="row" style="text-align:center;">
             <img src="<%=caminho%>/img/ajuda/img1.png" alt="Unioeste" height="400" width="900">
             <p><b>Figura 1</b></p>
          </div>
          <br />
          <div class="row">
              <p>A partir deste arquivo em Excel com os dados já inseridos, salve este arquivo para o formato CSV, 
                  conforme demonstrado nas Figuras 2 e 3 abaixo.</p>
          </div>
          <br />
          <div class="row" style="text-align:center;">
		<img src="<%=caminho%>/img/ajuda/img2.png" alt="Unioeste" height="400" width="900">
                <p><b>Figura 2</b></p>
          </div>
          <br />
          <div class="row" style="text-align:center;">
		<img src="<%=caminho%>/img/ajuda/img3.png" alt="Unioeste" height="400" width="900">
                <p><b>Figura 3</b></p>
          </div>
          <br />
          <div class="row">
              <p>Após salvar o arquivo no formato CSV, os dados neste arquivo ficarão semelhantes a Figura 4. 
              Com isso, o arquivo está pronto para ser importado para a aplicação.</p>
          </div>          
          <br />
          <div class="row" style="text-align:center;">
		<img src="<%=caminho%>/img/ajuda/img4.png" alt="Unioeste" height="500" width="900">
                <p><b>Figura 4</b></p>
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
